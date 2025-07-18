import 'package:expense_management_assignment_app/features/sales_expense.dart/presentation/bottom_sheets/controller/add_expense_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// A vendor name input field that animates into view when category is filled.
/// It uses AnimatedSwitcher to smoothly show/hide.
class VendorTextField extends StatelessWidget {
  const VendorTextField({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<AddExpenseController>(context);
    final theme = Theme.of(context);

    final isVisible = controller.categoryName.trim().isNotEmpty;

    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 250),
      switchInCurve: Curves.easeOut,
      switchOutCurve: Curves.easeIn,
      transitionBuilder: (child, animation) => SizeTransition(
        sizeFactor: animation,
        axisAlignment: -1.0,
        child: child,
      ),
      child: isVisible
          ? Column(
              key: const ValueKey('vendor-visible'),
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                // Label with (optional)
                RichText(
                  text: TextSpan(
                    text: 'Vendor Name',
                    style: theme.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w600),
                    children: [
                      TextSpan(
                        text: ' (optional)',
                        style: TextStyle(
                          color: theme.hintColor,
                          fontWeight: FontWeight.normal,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),

                // Input field
                TextField(
                  onChanged: controller.setVendorName,
                  controller: TextEditingController(text: controller.vendorName)
                    ..selection = TextSelection.fromPosition(
                      TextPosition(offset: controller.vendorName.length),
                    ),
                  decoration: InputDecoration(
                    hintText: 'Please type here',
                    hintStyle: TextStyle(color: theme.colorScheme.secondary),
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
                      borderSide: BorderSide(color: theme.colorScheme.primary, width: 1.2),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            )
          : const SizedBox.shrink(key: ValueKey('vendor-hidden')),
    );
  }
}
