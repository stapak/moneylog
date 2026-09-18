import 'package:flutter_test/flutter_test.dart';

import '../lib/data/models/transaction.dart';
import '../lib/data/models/transaction_type.dart';
import '../lib/data/services/transaction_service.dart';

void main(){
  final service = TransactionService();

  test('valid transfer passes validation',() {
    final transaction = Transaction(
        id: '1',
        type: TransactionType.transfer,
        amount: 5000,
        accountId: 'bank',
        destinationAccountId:'cash',
        date: DateTime(2026,9,18)
    );
    expect( () => service.validateTrasaction(transaction),
        returnsNormally,
    );
  });
  test('transfer without destination fails validation',(){
    final transaction = Transaction(
      id:'2',
      type: TransactionType.transfer,
      amount: 5000,
      accountId: 'bank',
      date:  DateTime(2026,9,18),
    );
    expect(
        () => service.validateTrasaction(transaction),
        throwsArgumentError,
        );
  });
}