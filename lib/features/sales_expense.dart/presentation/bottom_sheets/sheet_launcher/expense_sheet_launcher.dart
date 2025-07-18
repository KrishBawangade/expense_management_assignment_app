import 'package:expense_management_assignment_app/features/sales_expense.dart/presentation/bottom_sheets/add_expense_bottom_sheet.dart';
import 'package:flutter/material.dart';

/// Shows the Add Expense bottom sheet as a modal
void showAddExpenseBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
    ),
    builder: (context) => const AddExpenseBottomSheet(),
  );
}
