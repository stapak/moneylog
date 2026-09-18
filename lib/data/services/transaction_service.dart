import '../models/transaction_type.dart';
import '../models/transaction.dart';

class TransactionService {
  void validateTrasaction(Transaction transaction){
    if(transaction.amount <=0){
      throw ArgumentError("Amount must be greater than zero");
    }

    if(transaction.type == TransactionType.transfer){
      if(transaction.destinationAccountId == null ||
          transaction.destinationAccountId!.isEmpty){
        throw ArgumentError(
          "Transfer must have a destination account",
        );
      }
      if ( transaction.destinationAccountId == transaction.accountId){
        throw ArgumentError(
          'Source and destination accounts cannot be the same',
        );
      }
    }
  }
}