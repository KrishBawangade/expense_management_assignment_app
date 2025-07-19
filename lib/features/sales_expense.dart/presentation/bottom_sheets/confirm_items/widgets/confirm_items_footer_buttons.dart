import 'package:expense_management_assignment_app/features/sales_expense.dart/presentation/bottom_sheets/add_expense/controller/add_expense_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// 🔽 Footer section for Confirm Items bottom sheet.
/// Contains Total Billing, Confirm, Add Items, and Delete All buttons.
class ConfirmItemsFooterButtons extends StatelessWidget {
  const ConfirmItemsFooterButtons({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final expenseController = Provider.of<AddExpenseController>(context);
    final items = expenseController.items;
    final total = expenseController.totalAmount;

    return Container(
      padding: const EdgeInsets.fromLTRB(16, 4, 16, 16),
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Divider(thickness: 1),

          // 💰 Total Billing Row
          Padding(
            padding: const EdgeInsets.only(top: 12, bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Total Billing',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  '₹ ${total.toStringAsFixed(2)}',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Theme.of(context).colorScheme.tertiary,
                  ),
                ),
              ],
            ),
          ),

          // ✅ Confirm Button
          ElevatedButton(
            onPressed: items.isEmpty ? null : () => Navigator.of(context).pop(true),
            style: ElevatedButton.styleFrom(
              backgroundColor: colorScheme.secondary,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              padding: const EdgeInsets.symmetric(vertical: 16),
              textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            child: const Text('Confirm'),
          ),
          const SizedBox(height: 12),

          // ➕ Add Items Button
          OutlinedButton.icon(
            onPressed: () => Navigator.of(context).pop(false),
            icon: Container(
              decoration: BoxDecoration(
                border: Border.all(color: colorScheme.secondary, width: 1.2),
                borderRadius: BorderRadius.circular(6),
              ),
              padding: const EdgeInsets.all(4),
              child: Icon(Icons.add, color: colorScheme.secondary, size: 15),
            ),
            label: Padding(
              padding: const EdgeInsets.only(left: 4),
              child: Text(
                'Add Items',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: colorScheme.secondary,
                ),
              ),
            ),
            style: OutlinedButton.styleFrom(
              side: BorderSide(color: colorScheme.secondary),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              padding: const EdgeInsets.symmetric(vertical: 12),
              foregroundColor: colorScheme.secondary,
              backgroundColor: Colors.white,
            ),
          ),
          const SizedBox(height: 12),

          // ❌ Delete All Button
          OutlinedButton(
            onPressed: items.isEmpty
                ? null
                : () {
                    expenseController.clearItems();
                    Navigator.of(context).pop(true);
                  },
            style: OutlinedButton.styleFrom(
              side: BorderSide(color: Colors.red),
              foregroundColor: Colors.red,
              padding: const EdgeInsets.symmetric(vertical: 14),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            ),
            child: const Text(
              'Delete All',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }
}
