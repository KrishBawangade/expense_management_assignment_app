import '../models/expense_model.dart';
import '../repositories/expense_repository.dart';

/// UseCase to fetch all expenses from the repository.
class GetAllExpenses {
  final ExpenseRepository _repository;

  GetAllExpenses(this._repository);

  /// Returns a list of all expenses.
  Future<List<ExpenseModel>> call() {
    return _repository.getAllExpenses();
  }
}
