
import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';

part 'app_database.g.dart';

// ACCOUNTS TABLE
class Accounts extends Table {
  TextColumn get id => text()();

  TextColumn get name => text()();

  RealColumn get openingBalance => real()();

  TextColumn get iconName =>
      text().withDefault(const Constant('account_balance'))();

  @override
  Set<Column> get primaryKey => {id};
}

// CATEGORIES TABLE
class Categories extends Table {
  TextColumn get id => text()();

  TextColumn get name => text()();

  // 0 = income, 1 = expense
  IntColumn get type => integer()();

  BoolColumn get isDefault =>
      boolean().withDefault(const Constant(false))();

  DateTimeColumn get createdAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}

// TRANSACTIONS TABLE
class Transactions extends Table {
  TextColumn get id => text()();

  // 0 = income, 1 = expense, 2 = transfer
  IntColumn get type => integer()();

  RealColumn get amount => real()();

  TextColumn get accountId => text()();

  TextColumn get destinationAccountId =>
      text().nullable()();

  TextColumn get categoryId =>
      text().nullable()();

  TextColumn get note =>
      text().nullable()();

  DateTimeColumn get date => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}

// DATABASE
@DriftDatabase(
  tables: [
    Accounts,
    Categories,
    Transactions,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase([QueryExecutor? executor])
      : super(
    executor ?? driftDatabase(name: 'moneylog'),
  );

  // RESERVED CATEGORY IDs

  static const String deletedIncomeCategoryId =
      'deleted-income';

  static const String deletedExpenseCategoryId =
      'deleted-expense';

  // ACCOUNT OPERATIONS

  Future<void> createAccount({
    required String id,
    required String name,
    required double openingBalance,
    String iconName = 'account_balance',
  }) async {
    await into(accounts).insert(
      AccountsCompanion.insert(
        id: id,
        name: name,
        openingBalance: openingBalance,
        iconName: Value(iconName),
      ),
    );
  }

  Future<List<Account>> getAllAccounts() {
    return select(accounts).get();
  }

  Future<Account?> getAccountById(String id) {
    return (select(accounts)
      ..where((account) => account.id.equals(id)))
        .getSingleOrNull();
  }

  Future<bool> updateAccount({
    required String id,
    required String name,
    required double openingBalance,
    String iconName = 'account_balance',
  }) async {
    final updatedRows = await (update(accounts)
      ..where((account) => account.id.equals(id)))
        .write(
      AccountsCompanion(
        name: Value(name),
        openingBalance: Value(openingBalance),
        iconName: Value(iconName),
      ),
    );

    return updatedRows > 0;
  }

  Future<bool> deleteAccount(String id) async {
    final deletedRows = await (delete(accounts)
      ..where((account) => account.id.equals(id)))
        .go();

    return deletedRows > 0;
  }

  // CATEGORY OPERATIONS

  Future<void> createCategory({
    required String id,
    required String name,
    required int type,
    required bool isDefault,
    required DateTime createdAt,
  }) async {
    await into(categories).insert(
      CategoriesCompanion.insert(
        id: id,
        name: name,
        type: type,
        isDefault: Value(isDefault),
        createdAt: createdAt,
      ),
    );
  }

  Future<List<Category>> getAllCategories() {
    return select(categories).get();
  }

  Future<Category?> getCategoryById(String id) {
    return (select(categories)
      ..where((category) => category.id.equals(id)))
        .getSingleOrNull();
  }

  Future<bool> updateCategory({
    required String id,
    required String name,
    required int type,
  }) async {
    if (id == deletedIncomeCategoryId ||
        id == deletedExpenseCategoryId) {
      throw ArgumentError(
        'The Deleted category cannot be renamed.',
      );
    }

    if (name.trim().toLowerCase() == 'deleted') {
      throw ArgumentError(
        'The category name "Deleted" is reserved.',
      );
    }

    final updatedRows = await (update(categories)
      ..where((category) => category.id.equals(id)))
        .write(
      CategoriesCompanion(
        name: Value(name),
        type: Value(type),
      ),
    );

    return updatedRows > 0;
  }

  Future<bool> deleteCategory(String id) async {
    if (id == deletedIncomeCategoryId ||
        id == deletedExpenseCategoryId) {
      throw ArgumentError(
        'The Deleted category cannot be removed.',
      );
    }

    final category = await getCategoryById(id);

    if (category == null) {
      return false;
    }

    final deletedCategoryId = category.type == 0
        ? deletedIncomeCategoryId
        : deletedExpenseCategoryId;

    return transaction(() async {
      final existingDeletedCategory =
      await getCategoryById(deletedCategoryId);

      if (existingDeletedCategory == null) {
        await createCategory(
          id: deletedCategoryId,
          name: 'Deleted',
          type: category.type,
          isDefault: true,
          createdAt: DateTime.now(),
        );
      }

      await (update(transactions)
        ..where((transaction) =>
            transaction.categoryId.equals(id)))
          .write(
        TransactionsCompanion(
          categoryId: Value(deletedCategoryId),
        ),
      );

      final deletedRows = await (delete(categories)
        ..where((category) => category.id.equals(id)))
          .go();

      return deletedRows > 0;
    });
  }

  // TRANSACTION OPERATIONS

  Future<void> createTransaction({
    required String id,
    required int type,
    required double amount,
    required String accountId,
    String? destinationAccountId,
    String? categoryId,
    String? note,
    required DateTime date,
  }) async {
    await into(transactions).insert(
      TransactionsCompanion.insert(
        id: id,
        type: type,
        amount: amount,
        accountId: accountId,
        destinationAccountId: Value(destinationAccountId),
        categoryId: Value(categoryId),
        note: Value(note),
        date: date,
      ),
    );
  }

  Future<List<Transaction>> getAllTransactions() {
    return (select(transactions)
      ..orderBy([
            (transaction) => OrderingTerm(
          expression: transaction.date,
          mode: OrderingMode.desc,
        ),
      ]))
        .get();
  }

  Future<Transaction?> getTransactionById(String id) {
    return (select(transactions)
      ..where((transaction) =>
          transaction.id.equals(id)))
        .getSingleOrNull();
  }

  Future<List<Transaction>> getTransactionsByAccountId(
      String accountId,
      ) {
    return (select(transactions)
      ..where((transaction) =>
      transaction.accountId.equals(accountId) |
      transaction.destinationAccountId.equals(accountId))
      ..orderBy([
            (transaction) => OrderingTerm(
          expression: transaction.date,
          mode: OrderingMode.desc,
        ),
      ]))
        .get();
  }

  Future<bool> updateTransaction({
    required String id,
    required int type,
    required double amount,
    required String accountId,
    String? destinationAccountId,
    String? categoryId,
    String? note,
    required DateTime date,
  }) async {
    final updatedRows = await (update(transactions)
      ..where((transaction) =>
          transaction.id.equals(id)))
        .write(
      TransactionsCompanion(
        type: Value(type),
        amount: Value(amount),
        accountId: Value(accountId),
        destinationAccountId: Value(destinationAccountId),
        categoryId: Value(categoryId),
        note: Value(note),
        date: Value(date),
      ),
    );

    return updatedRows > 0;
  }

  Future<bool> deleteTransaction(String id) async {
    final deletedRows = await (delete(transactions)
      ..where((transaction) =>
          transaction.id.equals(id)))
        .go();

    return deletedRows > 0;
  }

  // DATABASE VERSION AND MIGRATION

  @override
  int get schemaVersion => 2;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (Migrator m) async {
      await m.createAll();
    },
    onUpgrade: (Migrator m, int from, int to) async {
      if (from < 2) {
        await m.addColumn(accounts, accounts.iconName);
      }
    },
  );
}