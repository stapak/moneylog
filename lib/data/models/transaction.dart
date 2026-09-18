import 'transaction_type.dart';

class Transaction {
  final String id;
  final TransactionType type;
  final double amount;
  final String accountId;
  final String? destinationAccountId;
  final String? categoryId;
  final String? note;
  final DateTime date;


  const Transaction({
    required this.id,
    required this.type,
    required this.amount,
    required this.accountId,
    this.destinationAccountId,
    this.categoryId,
    this.note,
    required this.date,
  });
}