import 'package:flutter_test/flutter_test.dart';

import '../lib/data/models/account.dart';
import '../lib/data/models/transaction.dart';
import '../lib/data/models/transaction_type.dart';
import '../lib/data/repositories/balance_repository.dart';

void main() {
  test('calculates account balance correctly', () {
    const bank = Account(
      id: 'bank',
      name: 'Bank',
      openingBalance: 50000,
    );

    final transactions = [
      Transaction(
        id: '1',
        type: TransactionType.income,
        amount: 10000,
        accountId: 'bank',
        date: DateTime(2026, 9, 13),
      ),
      Transaction(
        id: '2',
        type: TransactionType.expense,
        amount: 2000,
        accountId: 'bank',
        date: DateTime(2026, 9, 13),
      ),
      Transaction(
        id: '3',
        type: TransactionType.transfer,
        amount: 5000,
        accountId: 'bank',
        destinationAccountId: 'cash',
        date: DateTime(2026, 9, 13),
      ),
    ];

    final repository = BalanceRepository();

    final balance = repository.calculateBalance(
      account: bank,
      transactions: transactions,
    );

    expect(balance, 53000);
  });
}