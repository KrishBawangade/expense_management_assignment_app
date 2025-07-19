import 'package:flutter/material.dart';
import 'package:expense_management_assignment_app/features/sales_expense.dart/presentation/bottom_sheets/view_history/view_history_bottom_sheet.dart';



/// Opens the View History bottom sheet
void showHistoryBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
    ),
    builder: (_) => const ViewHistoryBottomSheet(),
  );
}

