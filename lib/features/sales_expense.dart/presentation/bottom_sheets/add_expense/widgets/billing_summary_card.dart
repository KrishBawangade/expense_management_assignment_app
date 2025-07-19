import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:expense_management_assignment_app/features/sales_expense.dart/presentation/bottom_sheets/add_expense/controller/add_expense_controller.dart';

/// A flat card showing the total billing and paid amount fields.
/// Values are controlled and editable via Provider controller.
class BillingSummaryCard extends StatelessWidget {
  const BillingSummaryCard({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final labelStyle = theme.textTheme.bodyMedium?.copyWith(
      fontWeight: FontWeight.w600,
    );
    final hintColor = theme.hintColor;
    final secondaryColor = theme.colorScheme.secondary;
    final tertiaryColor = theme.colorScheme.tertiary;

    final controller = Provider.of<AddExpenseController>(context);

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: theme.dividerColor.withAlpha(80)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 🧾 Total Billing Row
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: hintColor.withAlpha(40)),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Text('Total Billing', style: labelStyle),
                      const SizedBox(width: 4),
                      InkWell(
                        onTap: () {
                          // TODO: Show billing info
                        },
                        child: Icon(
                          Icons.info_outline,
                          size: 20,
                          color: secondaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 16),
                SizedBox(
                  width: 100,
                  child:
                      controller.items.isNotEmpty
                          ? Text(
                            controller.totalAmount.toStringAsFixed(2),
                            textAlign: TextAlign.end,
                            style: TextStyle(
                              color: tertiaryColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          )
                          : TextField(
                            controller: TextEditingController(
                                text: controller.editableTotalAmountText,
                              )
                              ..selection = TextSelection.fromPosition(
                                TextPosition(
                                  offset:
                                      controller.editableTotalAmountText.length,
                                ),
                              ),
                            onChanged: controller.setEditableTotalAmount,
                            keyboardType: const TextInputType.numberWithOptions(
                              decimal: true,
                            ),
                            textAlign: TextAlign.end,
                            style: TextStyle(
                              color: tertiaryColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                            decoration: InputDecoration(
                              isDense: true,
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 8,
                              ),
                              suffixIcon: Icon(
                                Icons.edit,
                                size: 16,
                                color: secondaryColor,
                              ),
                              suffixIconConstraints: const BoxConstraints(
                                maxWidth: 20,
                                maxHeight: 20,
                              ),
                            ),
                          ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),

          // 💰 Paid Row
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: hintColor.withAlpha(40)),
            ),
            child: Row(
              children: [
                Expanded(child: Text('Paid', style: labelStyle)),
                const SizedBox(width: 16),
                SizedBox(
                  width: 100,
                  child: TextField(
                    controller: TextEditingController(
                        text: controller.paidAmountText,
                      )
                      ..selection = TextSelection.fromPosition(
                        TextPosition(offset: controller.paidAmountText.length),
                      ),
                    keyboardType: TextInputType.numberWithOptions(
                      decimal: true,
                    ),
                    onChanged: controller.setPaidAmount,
                    textAlign: TextAlign.end,
                    style: TextStyle(
                      color: theme.colorScheme.primary,
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                    decoration: InputDecoration(
                      isDense: true,
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 8,
                      ),
                      suffixIcon: Icon(
                        Icons.edit,
                        size: 16,
                        color: secondaryColor,
                      ),
                      suffixIconConstraints: const BoxConstraints(
                        maxWidth: 20,
                        maxHeight: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
