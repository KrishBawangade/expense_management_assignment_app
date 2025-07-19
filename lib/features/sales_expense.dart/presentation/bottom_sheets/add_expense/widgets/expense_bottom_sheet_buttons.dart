import 'package:expense_management_assignment_app/features/sales_expense.dart/presentation/bottom_sheets/add_expense/controller/add_expense_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ExpenseBottomSheetButtons extends StatelessWidget {
  final VoidCallback onSubmit;

  const ExpenseBottomSheetButtons({
    super.key,
    required this.onSubmit,
  });

  @override
  Widget build(BuildContext context) {
    final addExpenseController = Provider.of<AddExpenseController>(context);
    final isValid = addExpenseController.isFormValid;

    return Container(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Divider(),
          const SizedBox(height: 8),

          // ✅ Submit Button
          ElevatedButton(
            onPressed: isValid ? onSubmit : null,
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.secondary,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.symmetric(vertical: 16),
              textStyle: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            child: const Text('Submit'),
          ),
          const SizedBox(height: 12),

          // ✅ Cancel Button
          OutlinedButton(
            onPressed: () => Navigator.pop(context),
            style: OutlinedButton.styleFrom(
              foregroundColor: Theme.of(context).colorScheme.secondary,
              side: BorderSide(
                color: Theme.of(context).colorScheme.secondary,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.symmetric(vertical: 16),
              textStyle: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            child: const Text('Cancel'),
          ),
        ],
      ),
    );
  }
}
