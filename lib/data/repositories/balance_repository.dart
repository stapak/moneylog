import '../models/account.dart';
import '../models/transaction.dart';
import '../models/transaction_type.dart';

class BalanceRepository {
  double calculateBalance({
    required Account account,
    required List<Transaction> transactions,
  }) {
    double balance = account.openingBalance;

    for (final transaction in transactions) {
      if (transaction.type == TransactionType.income) {
        if (transaction.accountId == account.id) {
          balance += transaction.amount;
        }
      }

      if (transaction.type == TransactionType.expense) {
        if (transaction.accountId == account.id) {
          balance -= transaction.amount;
        }
      }

      if (transaction.type == TransactionType.transfer) {
        if (transaction.accountId == account.id) {
          balance -= transaction.amount;
        }

        if (transaction.destinationAccountId == account.id) {
          balance += transaction.amount;
        }
      }
    }

    return balance;
  }
}