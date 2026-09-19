
import 'package:flutter_test/flutter_test.dart';
import 'package:drift/native.dart';

import 'package:moneylog/data/database/app_database.dart'
    show AppDatabase;
import 'package:moneylog/data/models/transaction.dart'
as model;
import 'package:moneylog/data/models/transaction_type.dart';
import 'package:moneylog/data/repositories/transaction_repository.dart';

void main() {
  late AppDatabase database;
  late TransactionRepository repository;

  setUp(() {
    database = AppDatabase(NativeDatabase.memory());
    repository = TransactionRepository(database);
  });

  tearDown(() async {
    await database.close();
  });

  // CREATE INCOME

  test('Create and read an income transaction', () async {
    final transaction = model.Transaction(
      id: 'transaction-1',
      type: TransactionType.income,
      amount: 30000,
      accountId: 'account-1',
      categoryId: 'category-income-1',
      note: 'Monthly salary',
      date: DateTime(2026, 1, 1),
    );

    await repository.createTransaction(transaction);

    final savedTransaction =
    await repository.getTransactionById('transaction-1');

    expect(savedTransaction, isNotNull);
    expect(savedTransaction!.type, TransactionType.income);
    expect(savedTransaction.amount, 30000);
    expect(savedTransaction.accountId, 'account-1');
    expect(savedTransaction.categoryId, 'category-income-1');
    expect(savedTransaction.note, 'Monthly salary');
  });

  // CREATE EXPENSE

  test('Create and read an expense transaction', () async {
    final transaction = model.Transaction(
      id: 'transaction-2',
      type: TransactionType.expense,
      amount: 500,
      accountId: 'account-1',
      categoryId: 'category-expense-1',
      note: 'Lunch',
      date: DateTime(2026, 1, 2),
    );

    await repository.createTransaction(transaction);

    final savedTransaction =
    await repository.getTransactionById('transaction-2');

    expect(savedTransaction, isNotNull);
    expect(savedTransaction!.type, TransactionType.expense);
    expect(savedTransaction.amount, 500);
    expect(savedTransaction.categoryId, 'category-expense-1');
  });

  // CREATE TRANSFER

  test('Create and read a transfer transaction', () async {
    final transaction = model.Transaction(
      id: 'transaction-3',
      type: TransactionType.transfer,
      amount: 5000,
      accountId: 'account-1',
      destinationAccountId: 'account-2',
      note: 'Transfer to savings',
      date: DateTime(2026, 1, 3),
    );

    await repository.createTransaction(transaction);

    final savedTransaction =
    await repository.getTransactionById('transaction-3');

    expect(savedTransaction, isNotNull);
    expect(savedTransaction!.type, TransactionType.transfer);
    expect(savedTransaction.amount, 5000);
    expect(savedTransaction.accountId, 'account-1');
    expect(
      savedTransaction.destinationAccountId,
      'account-2',
    );
  });

  // READ ALL TRANSACTIONS

  test('Read all transactions', () async {
    await repository.createTransaction(
      model.Transaction(
        id: 'transaction-1',
        type: TransactionType.income,
        amount: 30000,
        accountId: 'account-1',
        date: DateTime(2026, 1, 1),
      ),
    );

    await repository.createTransaction(
      model.Transaction(
        id: 'transaction-2',
        type: TransactionType.expense,
        amount: 500,
        accountId: 'account-1',
        date: DateTime(2026, 1, 2),
      ),
    );

    final transactions =
    await repository.getAllTransactions();

    expect(transactions.length, 2);
  });

  // UPDATE TRANSACTION

  test('Update a transaction', () async {
    await repository.createTransaction(
      model.Transaction(
        id: 'transaction-1',
        type: TransactionType.expense,
        amount: 500,
        accountId: 'account-1',
        note: 'Lunch',
        date: DateTime(2026, 1, 1),
      ),
    );

    final updated = await repository.updateTransaction(
      model.Transaction(
        id: 'transaction-1',
        type: TransactionType.expense,
        amount: 750,
        accountId: 'account-1',
        note: 'Dinner',
        date: DateTime(2026, 1, 2),
      ),
    );

    final transaction =
    await repository.getTransactionById('transaction-1');

    expect(updated, isTrue);
    expect(transaction!.amount, 750);
    expect(transaction.note, 'Dinner');
  });

  // DELETE TRANSACTION

  test('Delete a transaction', () async {
    await repository.createTransaction(
      model.Transaction(
        id: 'transaction-1',
        type: TransactionType.expense,
        amount: 500,
        accountId: 'account-1',
        date: DateTime(2026, 1, 1),
      ),
    );

    final deleted =
    await repository.deleteTransaction('transaction-1');

    final transaction =
    await repository.getTransactionById('transaction-1');

    expect(deleted, isTrue);
    expect(transaction, isNull);
  });

  // GET TRANSACTIONS BY ACCOUNT

  test('Get transactions by account ID', () async {
    await repository.createTransaction(
      model.Transaction(
        id: 'transaction-1',
        type: TransactionType.income,
        amount: 30000,
        accountId: 'account-1',
        date: DateTime(2026, 1, 1),
      ),
    );

    await repository.createTransaction(
      model.Transaction(
        id: 'transaction-2',
        type: TransactionType.transfer,
        amount: 5000,
        accountId: 'account-1',
        destinationAccountId: 'account-2',
        date: DateTime(2026, 1, 2),
      ),
    );

    await repository.createTransaction(
      model.Transaction(
        id: 'transaction-3',
        type: TransactionType.expense,
        amount: 1000,
        accountId: 'account-2',
        date: DateTime(2026, 1, 3),
      ),
    );

    final transactions =
    await repository.getTransactionsByAccountId('account-2');

    expect(transactions.length, 2);
  });
}