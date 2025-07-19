import 'package:expense_management_assignment_app/features/sales_expense.dart/presentation/bottom_sheets/add_item/controller/add_item_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// Input field for total item price with required label.
/// Bound to AddItemController for state syncing.
class TotalItemPricingField extends StatelessWidget {
  const TotalItemPricingField({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final controller = Provider.of<AddItemController>(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Label: "Total Price *"
        RichText(
          text: TextSpan(
            text: 'Total Price',
            style: theme.textTheme.bodyLarge?.copyWith(
              fontWeight: FontWeight.w600,
            ),
            children: const [
              TextSpan(text: ' *', style: TextStyle(color: Colors.red)),
            ],
          ),
        ),
        const SizedBox(height: 8),

        // Text Input Field
        TextField(
          keyboardType: TextInputType.number,
          onChanged: controller.setTotalPrice,
          controller: TextEditingController(text: controller.totalPriceText)
            ..selection = TextSelection.fromPosition(
              TextPosition(offset: controller.totalPriceText.length),
            ),
          decoration: InputDecoration(
            hintText: 'Please type here ₹ 1000',
            hintStyle: TextStyle(color: colorScheme.secondary, fontWeight: FontWeight.w600),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 14,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(
                color: theme.hintColor.withAlpha(100),
                width: 0.5,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(
                color: theme.hintColor.withAlpha(100),
                width: 0.5,
              ),
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
