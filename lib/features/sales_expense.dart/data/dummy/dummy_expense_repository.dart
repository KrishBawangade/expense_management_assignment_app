import 'dart:async';
import 'package:collection/collection.dart';
import 'package:uuid/uuid.dart';

import 'package:expense_management_assignment_app/features/sales_expense.dart/domain/enums/payment_mode.dart';
import 'package:expense_management_assignment_app/features/sales_expense.dart/domain/enums/quantity_type.dart';
import 'package:expense_management_assignment_app/features/sales_expense.dart/domain/models/expense_item_model.dart';
import 'package:expense_management_assignment_app/features/sales_expense.dart/domain/models/payment_history_model.dart';
import '../../domain/models/expense_model.dart';
import '../../domain/repositories/expense_repository.dart';

/// A dummy in-memory implementation of [ExpenseRepository].
///
/// Used for testing and UI development without requiring a database connection.
class DummyExpenseRepository implements ExpenseRepository {
  final List<ExpenseModel> _dummyExpenses = [];
  final _uuid = const Uuid();

  DummyExpenseRepository() {
    // Populate dummy expense list on initialization
    _dummyExpenses.addAll(_generateMockExpenses());
  }

  @override
  Future<List<ExpenseModel>> getAllExpenses() async {
    await Future.delayed(Duration(milliseconds: 300)); // Simulated latency
    return _dummyExpenses;
  }

  @override
  Future<void> addExpense(ExpenseModel expense) async {
    _dummyExpenses.add(expense);
  }

  @override
  Future<void> deleteExpense(String id) async {
    _dummyExpenses.removeWhere((e) => e.id == id);
  }

  @override
  Future<ExpenseModel?> getExpenseById(String id) async {
    return _dummyExpenses.firstWhereOrNull((e) => e.id == id);
  }

  @override
  Future<void> updateExpense(ExpenseModel updatedExpense) async {
    final index = _dummyExpenses.indexWhere((e) => e.id == updatedExpense.id);
    if (index != -1) {
      _dummyExpenses[index] = updatedExpense;
    }
  }

  /// Generates a sample list of [ExpenseModel]s for mocking purposes.
  List<ExpenseModel> _generateMockExpenses() {
    final now = DateTime.now();
    return [
      ExpenseModel(
        id: _uuid.v4(),
        date: now.subtract(Duration(days: 1)),
        categoryName: 'Grocery',
        vendorName: 'Big Bazaar',
        totalBilling: 850.0,
        paid: 850.0,
        createdBy: 'Krish',
        paymentMode: PaymentMode.upi,
        note: 'Weekly grocery shopping',
        paymentScreenshotPathList: null,
        itemList: [
          ExpenseItemModel(
            id: _uuid.v4(),
            itemName: 'Aashirvaad Aata',
            totalQuantityPurchased: 5.0,
            quantityType: QuantityType.kg,
            totalItemPricing: 250.0,
          ),
          ExpenseItemModel(
            id: _uuid.v4(),
            itemName: 'Amul Milk',
            totalQuantityPurchased: 2.0,
            quantityType: QuantityType.litre,
            totalItemPricing: 120.0,
          ),
        ],
        paymentHistory: [
          PaymentHistoryModel(
            id: _uuid.v4(),
            createdAt: now.subtract(Duration(days: 1, hours: 2)),
            createdBy: 'Krish',
            paymentAmount: 850.0,
            paymentMode: PaymentMode.upi,
            paymentScreenshotPathList: null,
          ),
        ],
      ),
    ];
  }
}
