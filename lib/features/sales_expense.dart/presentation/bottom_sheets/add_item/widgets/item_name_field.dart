import 'package:expense_management_assignment_app/features/sales_expense.dart/presentation/bottom_sheets/add_item/controller/add_item_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// A reusable input field for item name with a mandatory label.
/// Styled to match the form UI and syncs with [AddItemController].
class ItemNameField extends StatelessWidget {
  const ItemNameField({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    final controller = Provider.of<AddItemController>(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Label: "Item Name *"
        RichText(
          text: TextSpan(
            text: 'Item Name',
            style: theme.textTheme.bodyLarge?.copyWith(
              fontWeight: FontWeight.w600,
            ),
            children: const [
              TextSpan(
                text: ' *',
                style: TextStyle(color: Colors.red),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),

        // Text Input Field
        TextField(
          onChanged: controller.setItemName,
          controller: TextEditingController(text: controller.itemName)
            ..selection = TextSelection.fromPosition(
              TextPosition(offset: controller.itemName.length),
            ),
          decoration: InputDecoration(
            hintText: 'Please type here',
            hintStyle: TextStyle(
              color: colorScheme.secondary,
              fontSize: 16,
              fontWeight: FontWeight.w600
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: theme.hintColor.withAlpha(100), width: 0.5),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: theme.hintColor.withAlpha(100), width: 0.5),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: colorScheme.primary, width: 1.2),
            ),
            filled: true,
            fillColor: Colors.white,
          ),
          style: const TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}
