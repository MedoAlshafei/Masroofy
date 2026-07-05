import '../entities/transaction_entity.dart';

abstract class TransactionRepository {
  Future<List<TransactionEntity>> getAllTransactions();
  Future<void> saveTransaction(TransactionEntity transaction);
  Future<void> deleteTransaction(int id);
}
