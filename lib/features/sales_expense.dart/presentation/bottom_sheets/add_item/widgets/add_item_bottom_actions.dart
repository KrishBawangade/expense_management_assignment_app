import 'package:expense_management_assignment_app/features/sales_expense.dart/presentation/bottom_sheets/add_item/controller/add_item_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// Bottom section with 3 actions: Save & New, Save, Cancel
class AddItemBottomActions extends StatelessWidget {
  final VoidCallback onSave;
  final VoidCallback onSaveAndNew;

  const AddItemBottomActions({
    super.key,
    required this.onSave,
    required this.onSaveAndNew,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final controller = Provider.of<AddItemController>(context);
    final isFormValid = controller.isFormValid;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(10),
            blurRadius: 4,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Divider(thickness: 1),
          const SizedBox(height: 8),

          // 🔁 Save & New
          ElevatedButton(
            onPressed:
                isFormValid
                    ? () {
                      if (controller.validateAllFields()) {
                        onSaveAndNew();
                      }
                    }
                    : null,
            style: ElevatedButton.styleFrom(
              backgroundColor: colorScheme.secondary,
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
            child: const Text('Save & New'),
          ),

          const SizedBox(height: 12),

          // ✅ Save
          OutlinedButton(
            onPressed:
                isFormValid
                    ? () {
                      if (controller.validateAllFields()) {
                        onSave();
                      }
                    }
                    : null,
            style: OutlinedButton.styleFrom(
              foregroundColor: colorScheme.secondary,
              side: BorderSide(
                color:
                    isFormValid
                        ? colorScheme.secondary
                        : Theme.of(context).hintColor.withAlpha(40),
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
            child: const Text('Save'),
          ),

          const SizedBox(height: 12),

          // ❌ Cancel
          OutlinedButton(
            onPressed: () => Navigator.pop(context),
            style: OutlinedButton.styleFrom(
              foregroundColor: colorScheme.secondary,
              side: BorderSide(color: colorScheme.secondary),
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
