import '../models/expense_model.dart';
import '../repositories/expense_repository.dart';

/// UseCase to fetch a specific expense by its ID.
class GetExpenseById {
  final ExpenseRepository _repository;

  GetExpenseById(this._repository);

  /// Returns the expense matching the [id], or null if not found.
  Future<ExpenseModel?> call(String id) {
    return _repository.getExpenseById(id);
  }
}
