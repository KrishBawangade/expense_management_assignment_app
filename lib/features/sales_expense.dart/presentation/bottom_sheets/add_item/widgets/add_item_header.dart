import 'package:expense_management_assignment_app/features/sales_expense.dart/presentation/bottom_sheets/add_expense/controller/add_expense_controller.dart';
import 'package:expense_management_assignment_app/features/sales_expense.dart/presentation/bottom_sheets/confirm_items/sheet_launcher/confirm_items_sheet_launcher.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// Top section with "Add Items" title and "View List" button
class AddItemHeader extends StatelessWidget {
  const AddItemHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    final addExpenseController = Provider.of<AddExpenseController>(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Text(
                'Add Items',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              const Spacer(),
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                  side: BorderSide(
                    color:
                        addExpenseController.items.isNotEmpty
                            ? colorScheme.secondary
                            : Theme.of(context).hintColor.withAlpha(40),
                  ),
                ).copyWith(
                  overlayColor: WidgetStateProperty.all(
                    colorScheme.secondary.withAlpha(30), // splash color
                  ),
                ),
                onPressed:
                    addExpenseController.items.isEmpty
                        ? null
                        : () async {
                          if (addExpenseController.items.isNotEmpty) {
                            bool? shouldPop = await showConfirmItemsBottomSheet(
                              context,
                            );
                            if ((shouldPop ?? false) && context.mounted) {
                              Navigator.of(context).pop();
                            }
                          }
                        },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Text(
                    'View List',
                    style: TextStyle(
                      color:
                          addExpenseController.items.isNotEmpty
                              ? colorScheme.secondary
                              : Theme.of(context).hintColor.withAlpha(80),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          const Divider(thickness: 1),
        ],
      ),
    );
  }
}
