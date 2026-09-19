
import 'package:flutter_test/flutter_test.dart';
import 'package:drift/native.dart';

import 'package:moneylog/data/database/app_database.dart'
    show AppDatabase;
import 'package:moneylog/data/models/account.dart';
import 'package:moneylog/data/repositories/account_repository.dart';

void main() {
  late AppDatabase database;
  late AccountRepository repository;

  setUp(() {
    database = AppDatabase(NativeDatabase.memory());
    repository = AccountRepository(database);
  });

  tearDown(() async {
    await database.close();
  });

  test('Create and read an account', () async {
    const account = Account(
      id: 'account-1',
      name: 'Bank Account',
      openingBalance: 50000,
    );

    await repository.createAccount(account);

    final savedAccount =
    await repository.getAccountById('account-1');

    expect(savedAccount, isNotNull);
    expect(savedAccount!.name, 'Bank Account');
    expect(savedAccount.openingBalance, 50000);
  });

  test('Read all accounts', () async {
    await repository.createAccount(
      const Account(
        id: 'account-1',
        name: 'Bank Account',
        openingBalance: 50000,
      ),
    );

    await repository.createAccount(
      const Account(
        id: 'account-2',
        name: 'Cash',
        openingBalance: 2000,
      ),
    );

    final accounts = await repository.getAllAccounts();

    expect(accounts.length, 2);
  });

  test('Update an account', () async {
    await repository.createAccount(
      const Account(
        id: 'account-1',
        name: 'Bank Account',
        openingBalance: 50000,
      ),
    );

    final updated = await repository.updateAccount(
      const Account(
        id: 'account-1',
        name: 'Savings Account',
        openingBalance: 60000,
      ),
    );

    final account =
    await repository.getAccountById('account-1');

    expect(updated, isTrue);
    expect(account!.name, 'Savings Account');
    expect(account.openingBalance, 60000);
  });

  test('Delete an account', () async {
    await repository.createAccount(
      const Account(
        id: 'account-1',
        name: 'Bank Account',
        openingBalance: 50000,
      ),
    );

    final deleted =
    await repository.deleteAccount('account-1');

    final account =
    await repository.getAccountById('account-1');

    expect(deleted, isTrue);
    expect(account, isNull);
  });
}