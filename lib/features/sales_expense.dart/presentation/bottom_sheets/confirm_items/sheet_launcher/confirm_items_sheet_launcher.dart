import 'package:expense_management_assignment_app/features/sales_expense.dart/presentation/bottom_sheets/confirm_items/confirm_items_bottom_sheet.dart';
import 'package:flutter/material.dart';

/// Shows the Confirm Items bottom sheet as a modal
Future<bool?> showConfirmItemsBottomSheet(BuildContext context) async {
  return await showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
    ),
    builder: (context) => const ConfirmItemsBottomSheet(),
  );
}
