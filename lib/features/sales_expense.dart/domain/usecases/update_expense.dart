import '../models/expense_model.dart';
import '../repositories/expense_repository.dart';

/// UseCase to update an existing expense.
class UpdateExpense {
  final ExpenseRepository _repository;

  UpdateExpense(this._repository);

  /// Updates the given [updatedExpense] in the repository.
  Future<void> call(ExpenseModel updatedExpense) {
    return _repository.updateExpense(updatedExpense);
  }
}
