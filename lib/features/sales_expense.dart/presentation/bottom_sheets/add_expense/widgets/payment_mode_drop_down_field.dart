import 'package:expense_management_assignment_app/features/sales_expense.dart/domain/enums/payment_mode.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:expense_management_assignment_app/features/sales_expense.dart/presentation/bottom_sheets/add_expense/controller/add_expense_controller.dart';

/// A styled dropdown for selecting payment mode with external label and controller integration.
class PaymentModeDropDownField extends StatelessWidget {
  const PaymentModeDropDownField({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final controller = Provider.of<AddExpenseController>(context);
    final secondaryColor = theme.colorScheme.secondary;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // External Label with red star
        RichText(
          text: TextSpan(
            text: 'Mode of Payment',
            style: theme.textTheme.bodyLarge?.copyWith(
              fontWeight: FontWeight.w600,
            ),
            children: const [
              TextSpan(text: ' *', style: TextStyle(color: Colors.red)),
            ],
          ),
        ),
        const SizedBox(height: 8),

        // Dropdown container
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: secondaryColor),
            borderRadius: BorderRadius.circular(20),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<PaymentMode>(
              isExpanded: true,
              value: controller.paymentMode,
              icon: Icon(Icons.keyboard_arrow_down, color: secondaryColor),
              hint: Text(
                'Please Select',
                style: TextStyle(
                  color: secondaryColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              items:
                  PaymentMode.values.map((mode) {
                    return DropdownMenuItem<PaymentMode>(
                      value: mode,
                      child: Text(
                        mode.label,
                        style: const TextStyle(fontSize: 16),
                      ),
                    );
                  }).toList(),
              onChanged: controller.setPaymentMode,
            ),
          ),
        ),
      ],
    );
  }
}
