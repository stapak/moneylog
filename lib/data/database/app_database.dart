
import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';

part 'app_database.g.dart';

// ACCOUNTS TABLE
class Accounts extends Table {
  TextColumn get id => text()();

  TextColumn get name => text()();

  RealColumn get openingBalance => real()();

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

  // ==============================
  // ACCOUNT OPERATIONS
  // ==============================

  // CREATE ACCOUNT
  Future<void> createAccount({
    required String id,
    required String name,
    required double openingBalance,
  }) async {
    await into(accounts).insert(
      AccountsCompanion.insert(
        id: id,
        name: name,
        openingBalance: openingBalance,
      ),
    );
  }

  // READ ALL ACCOUNTS
  Future<List<Account>> getAllAccounts() {
    return select(accounts).get();
  }

  // READ ONE ACCOUNT
  Future<Account?> getAccountById(String id) {
    return (select(accounts)
      ..where((account) => account.id.equals(id)))
        .getSingleOrNull();
  }

  // UPDATE ACCOUNT
  Future<bool> updateAccount({
    required String id,
    required String name,
    required double openingBalance,
  }) async {
    final updatedRows = await (update(accounts)
      ..where((account) => account.id.equals(id)))
        .write(
      AccountsCompanion(
        name: Value(name),
        openingBalance: Value(openingBalance),
      ),
    );

    return updatedRows > 0;
  }

  // DELETE ACCOUNT
  Future<bool> deleteAccount(String id) async {
    final deletedRows = await (delete(accounts)
      ..where((account) => account.id.equals(id)))
        .go();

    return deletedRows > 0;
  }

  // ==============================
  // CATEGORY OPERATIONS
  // ==============================

  // CREATE CATEGORY
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

  // READ ALL CATEGORIES
  Future<List<Category>> getAllCategories() {
    return select(categories).get();
  }

  // READ ONE CATEGORY
  Future<Category?> getCategoryById(String id) {
    return (select(categories)
      ..where((category) => category.id.equals(id)))
        .getSingleOrNull();
  }

  // UPDATE CATEGORY
  Future<bool> updateCategory({
    required String id,
    required String name,
    required int type,
  }) async {
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

  // DELETE CATEGORY
  Future<bool> deleteCategory(String id) async {
    final deletedRows = await (delete(categories)
      ..where((category) => category.id.equals(id)))
        .go();

    return deletedRows > 0;
  }

  // ==============================
  // DATABASE VERSION
  // ==============================

  @override
  int get schemaVersion => 1;
}