import 'package:flutter/material.dart';

import '../../domain/models/expense_model.dart';
import '../../domain/usecases/add_expense.dart';
import '../../domain/usecases/delete_expense.dart';
import '../../domain/usecases/get_all_expenses.dart';
import '../../domain/usecases/get_expense_by_id.dart';
import '../../domain/usecases/update_expense.dart';

/// Provider that manages the expense list and interacts with usecases.
class ExpenseProvider extends ChangeNotifier {
  final GetAllExpenses _getAllExpenses;
  final AddExpense _addExpense;
  final UpdateExpense _updateExpense;
  final DeleteExpense _deleteExpense;
  final GetExpenseById _getExpenseById;

  ExpenseProvider({
    required GetAllExpenses getAllExpenses,
    required AddExpense addExpense,
    required UpdateExpense updateExpense,
    required DeleteExpense deleteExpense,
    required GetExpenseById getExpenseById,
  })  : _getAllExpenses = getAllExpenses,
        _addExpense = addExpense,
        _updateExpense = updateExpense,
        _deleteExpense = deleteExpense,
        _getExpenseById = getExpenseById;

  List<ExpenseModel>? _expenses; // Null means "not yet loaded"
  String? _error;
  bool _isLoading = false;

  List<ExpenseModel>? get expenses => _expenses;
  bool get isLoading => _isLoading;
  String? get error => _error;

  /// Fetches all expenses from the repository and notifies listeners.
  Future<void> loadExpenses() async {
    _isLoading = true;
    _error = null;
    _expenses = null;
    notifyListeners();

    try {
      final data = await _getAllExpenses();
      _expenses = data;
    } catch (e) {
      _error = 'Failed to load expenses: ${e.toString()}';
      _expenses = null;
    }

    _isLoading = false;
    notifyListeners();
  }

  /// Adds a new expense and refreshes the list.
  Future<void> addNewExpense(ExpenseModel expense) async {
    await _addExpense(expense);
    await loadExpenses();
  }

  /// Updates an existing expense and refreshes the list.
  Future<void> updateExistingExpense(ExpenseModel updatedExpense) async {
    await _updateExpense(updatedExpense);
    await loadExpenses();
  }

  /// Deletes an expense by its ID and refreshes the list.
  Future<void> deleteExpenseById(String id) async {
    await _deleteExpense(id);
    await loadExpenses();
  }

  /// Returns an expense by ID (without refreshing the list).
  Future<ExpenseModel?> getExpenseById(String id) {
    return _getExpenseById(id);
  }
}
