
import '../database/app_database.dart';
import '../models/account.dart' as model;

class AccountRepository {
  final AppDatabase database;

  AccountRepository(this.database);

  // CREATE ACCOUNT
  Future<void> createAccount(model.Account account) async {
    await database.createAccount(
      id: account.id,
      name: account.name,
      openingBalance: account.openingBalance,
    );
  }

  // READ ALL ACCOUNTS
  Future<List<model.Account>> getAllAccounts() async {
    final accounts = await database.select(database.accounts).get();

    return accounts.map((account) {
      return model.Account(
        id: account.id,
        name: account.name,
        openingBalance: account.openingBalance,
      );
    }).toList();
  }

  // READ ONE ACCOUNT
  Future<model.Account?> getAccountById(String id) async {
    final account = await database.getAccountById(id);

    if (account == null) {
      return null;
    }

    return model.Account(
      id: account.id,
      name: account.name,
      openingBalance: account.openingBalance,
    );
  }

  // UPDATE ACCOUNT
  Future<bool> updateAccount(model.Account account) async {
    return database.updateAccount(
      id: account.id,
      name: account.name,
      openingBalance: account.openingBalance,
    );
  }

  // DELETE ACCOUNT
  Future<bool> deleteAccount(String id) async {
    return database.deleteAccount(id);
  }
}