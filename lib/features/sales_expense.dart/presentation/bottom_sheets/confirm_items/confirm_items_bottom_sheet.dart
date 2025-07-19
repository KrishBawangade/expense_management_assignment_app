import 'package:expense_management_assignment_app/features/sales_expense.dart/presentation/bottom_sheets/add_expense/controller/add_expense_controller.dart';
import 'package:expense_management_assignment_app/features/sales_expense.dart/presentation/bottom_sheets/confirm_items/widgets/confirm_items_footer_buttons.dart';
import 'package:expense_management_assignment_app/features/sales_expense.dart/presentation/bottom_sheets/confirm_items/widgets/confirm_items_header.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ConfirmItemsBottomSheet extends StatelessWidget {
  const ConfirmItemsBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    const sheetSize = 0.85;

    return DraggableScrollableSheet(
      initialChildSize: sheetSize,
      minChildSize: sheetSize,
      maxChildSize: sheetSize,
      expand: false,
      builder: (context, scrollController) {
        final expenseController = Provider.of<AddExpenseController>(context);

        final items = expenseController.items;

        return SafeArea(
          child: Stack(
            children: [
              // 🧾 Scrollable List of Items
              Padding(
                padding: const EdgeInsets.only(top: 50, bottom: 260),
                child: ListView.separated(
                  padding: const EdgeInsets.only(
                    left: 16,
                    right: 16,
                    top: 8,
                    bottom: 50,
                  ),
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    final item = items[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Text(
                              item.itemName,
                              textAlign: TextAlign.left,
                              softWrap: true,
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Text(
                              '${item.totalQuantityPurchased} ${item.quantityType.name}',
                              textAlign: TextAlign.left,
                              softWrap: true,
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Text(
                              '₹${item.totalItemPricing.toStringAsFixed(2)}',
                              textAlign: TextAlign.left,
                              softWrap: true,
                            ),
                          ),
                          GestureDetector(
                            onTap: () => expenseController.removeItem(index),
                            child: Container(
                              width: 20,
                              height: 20,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.red),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: const Icon(
                                Icons.close,
                                size: 16,
                                color: Colors.red,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return Divider();
                  },
                ),
              ),

              // 📋 Header
              const Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: ConfirmItemsHeader(),
              ),

              // 🔽 Bottom Buttons
              const Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: ConfirmItemsFooterButtons(),
              ),
            ],
          ),
        );
      },
    );
  }
}
