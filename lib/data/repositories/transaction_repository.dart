
import '../database/app_database.dart';
import '../models/transaction.dart' as model;
import '../models/transaction_type.dart';

class TransactionRepository {
  final AppDatabase database;

  TransactionRepository(this.database);

  // CREATE TRANSACTION

  Future<void> createTransaction(
      model.Transaction transaction,
      ) async {
    await database.createTransaction(
      id: transaction.id,
      type: _transactionTypeToInt(transaction.type),
      amount: transaction.amount,
      accountId: transaction.accountId,
      destinationAccountId:
      transaction.destinationAccountId,
      categoryId: transaction.categoryId,
      note: transaction.note,
      date: transaction.date,
    );
  }

  // GET ALL TRANSACTIONS

  Future<List<model.Transaction>> getAllTransactions() async {
    final transactions =
    await database.getAllTransactions();

    return transactions.map(_toModel).toList();
  }

  // GET TRANSACTION BY ID

  Future<model.Transaction?> getTransactionById(
      String id,
      ) async {
    final transaction =
    await database.getTransactionById(id);

    if (transaction == null) {
      return null;
    }

    return _toModel(transaction);
  }

  // GET TRANSACTIONS BY ACCOUNT

  Future<List<model.Transaction>>
  getTransactionsByAccountId(
      String accountId,
      ) async {
    final transactions =
    await database.getTransactionsByAccountId(accountId);

    return transactions.map(_toModel).toList();
  }

  // UPDATE TRANSACTION

  Future<bool> updateTransaction(
      model.Transaction transaction,
      ) async {
    return database.updateTransaction(
      id: transaction.id,
      type: _transactionTypeToInt(transaction.type),
      amount: transaction.amount,
      accountId: transaction.accountId,
      destinationAccountId:
      transaction.destinationAccountId,
      categoryId: transaction.categoryId,
      note: transaction.note,
      date: transaction.date,
    );
  }

  // DELETE TRANSACTION

  Future<bool> deleteTransaction(String id) async {
    return database.deleteTransaction(id);
  }

  // CONVERT MODEL TO DATABASE TYPE

  int _transactionTypeToInt(
      TransactionType type,
      ) {
    switch (type) {
      case TransactionType.income:
        return 0;

      case TransactionType.expense:
        return 1;

      case TransactionType.transfer:
        return 2;
    }
  }

  // CONVERT DATABASE TYPE TO MODEL

  TransactionType _intToTransactionType(int type) {
    switch (type) {
      case 0:
        return TransactionType.income;

      case 1:
        return TransactionType.expense;

      case 2:
        return TransactionType.transfer;

      default:
        throw ArgumentError(
          'Invalid transaction type: $type',
        );
    }
  }

  // CONVERT DATABASE ROW TO APP MODEL

  model.Transaction _toModel(dynamic transaction) {
    return model.Transaction(
      id: transaction.id,
      type: _intToTransactionType(transaction.type),
      amount: transaction.amount,
      accountId: transaction.accountId,
      destinationAccountId:
      transaction.destinationAccountId,
      categoryId: transaction.categoryId,
      note: transaction.note,
      date: transaction.date,
    );
  }
}