import '../models/expense_model.dart';
import '../repositories/expense_repository.dart';

/// UseCase to add a new expense.
class AddExpense {
  final ExpenseRepository _repository;

  AddExpense(this._repository);

  /// Adds the provided [expense] to the data source.
  Future<void> call(ExpenseModel expense) {
    return _repository.addExpense(expense);
  }
}
