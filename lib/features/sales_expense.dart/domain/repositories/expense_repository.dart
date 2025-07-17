import '../models/expense_model.dart';

/// Defines the contract for all expense-related data operations.
///
/// This abstraction allows the data source (e.g., local, dummy, or remote)
/// to be swapped without affecting the business or presentation layers.
abstract class ExpenseRepository {
  /// Returns a list of all expenses.
  Future<List<ExpenseModel>> getAllExpenses();

  /// Adds a new expense to the list.
  Future<void> addExpense(ExpenseModel expense);

  /// Deletes an expense by its ID.
  Future<void> deleteExpense(String id);

  /// Updates an existing expense entry.
  Future<void> updateExpense(ExpenseModel updatedExpense);

  /// Returns a specific expense by its ID, or null if not found.
  Future<ExpenseModel?> getExpenseById(String id);
}
