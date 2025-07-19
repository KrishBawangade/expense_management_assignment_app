import 'package:expense_management_assignment_app/features/sales_expense.dart/domain/enums/quantity_type.dart';
import 'package:expense_management_assignment_app/features/sales_expense.dart/presentation/bottom_sheets/add_item/controller/add_item_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// A responsive row containing:
/// - Total Quantity Purchased (TextField)
/// - Quantity Type (Dropdown)
/// Uses LayoutBuilder to switch between row and column layout.
class QuantityRowField extends StatelessWidget {
  const QuantityRowField({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final controller = Provider.of<AddItemController>(context);

    final quantityField = SizedBox(
      width: 190,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text: TextSpan(
              text: 'Total Quantity Purchased',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
              children: [
                TextSpan(text: ' *', style: TextStyle(color: Colors.red)),
              ],
            ),
          ),
          const SizedBox(height: 8),
          TextField(
            controller: TextEditingController(text: controller.quantityText)
              ..selection = TextSelection.fromPosition(
                TextPosition(offset: controller.quantityText.length),
              ),
            keyboardType: TextInputType.number,
            onChanged: controller.setQuantity,
            decoration: InputDecoration(
              hintText: 'Please type: 1/ 2/ 2000',
              hintStyle: TextStyle(
                color: colorScheme.secondary,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 8,
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
          ),
        ],
      ),
    );

    final quantityTypeField = SizedBox(
      width: 150,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text: TextSpan(
              text: 'Quantity Type',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
              children: [
                TextSpan(text: ' *', style: TextStyle(color: Colors.red)),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: theme.hintColor.withAlpha(100),
                width: 0.5,
              ),
              color: Colors.white,
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<QuantityType>(
                isExpanded: true,
                value: controller.quantityType,
                icon: Icon(
                  Icons.keyboard_arrow_down,
                  color: colorScheme.secondary,
                ),
                hint: Text(
                  'Please Select',
                  style: TextStyle(color: colorScheme.secondary),
                ),
                items:
                    QuantityType.values.map((type) {
                      return DropdownMenuItem(
                        value: type,
                        child: Text(type.label),
                      );
                    }).toList(),
                onChanged: controller.setQuantityType,
              ),
            ),
          ),
        ],
      ),
    );

    return LayoutBuilder(
      builder: (context, constraints) {
        final isWide = constraints.maxWidth >= 350;

        if (isWide) {
          return Row(
            children: [quantityField, const Spacer(), quantityTypeField],
          );
        } else {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              quantityField,
              const SizedBox(height: 16),
              quantityTypeField,
            ],
          );
        }
      },
    );
  }
}
