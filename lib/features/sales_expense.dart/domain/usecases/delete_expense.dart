import '../repositories/expense_repository.dart';

/// UseCase to delete an expense by its ID.
class DeleteExpense {
  final ExpenseRepository _repository;

  DeleteExpense(this._repository);

  /// Deletes the expense with the specified [id].
  Future<void> call(String id) {
    return _repository.deleteExpense(id);
  }
}
