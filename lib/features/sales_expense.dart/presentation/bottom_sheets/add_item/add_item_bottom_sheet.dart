import 'package:expense_management_assignment_app/features/sales_expense.dart/presentation/bottom_sheets/add_expense/controller/add_expense_controller.dart';
import 'package:expense_management_assignment_app/features/sales_expense.dart/presentation/bottom_sheets/add_item/controller/add_item_controller.dart';
import 'package:expense_management_assignment_app/features/sales_expense.dart/presentation/bottom_sheets/add_item/widgets/add_item_bottom_actions.dart';
import 'package:expense_management_assignment_app/features/sales_expense.dart/presentation/bottom_sheets/add_item/widgets/add_item_header.dart';
import 'package:expense_management_assignment_app/features/sales_expense.dart/presentation/bottom_sheets/add_item/widgets/item_name_field.dart';
import 'package:expense_management_assignment_app/features/sales_expense.dart/presentation/bottom_sheets/add_item/widgets/quantity_row_field.dart';
import 'package:expense_management_assignment_app/features/sales_expense.dart/presentation/bottom_sheets/add_item/widgets/total_item_pricing_field.dart';
import 'package:expense_management_assignment_app/features/sales_expense.dart/presentation/bottom_sheets/confirm_items/sheet_launcher/confirm_items_sheet_launcher.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddItemBottomSheet extends StatefulWidget {
  const AddItemBottomSheet({super.key});

  @override
  State<AddItemBottomSheet> createState() => _AddItemBottomSheetState();
}

class _AddItemBottomSheetState extends State<AddItemBottomSheet> {
  AddItemController? disposeController;

  @override
  void initState() {
    super.initState();
    disposeController = Provider.of<AddItemController>(context, listen: false);
  }

  @override
  void dispose() {
    disposeController?.reset();
    super.dispose();
  }

  void _handleSave() async {
    final controller = Provider.of<AddItemController>(context, listen: false);
    final addExpenseController = Provider.of<AddExpenseController>(
      context,
      listen: false,
    );
    final isValid = controller.validateAllFields();
    if (isValid) {
      addExpenseController.addItem(controller.toExpenseItem());

      bool? shouldPop = await showConfirmItemsBottomSheet(context);
      if (shouldPop ?? false) {
        if (mounted) {
          Navigator.of(context).pop();
        }
      }
    }
  }

  void _handleSaveAndNew(AddItemController controller) {
    final addExpenseController = Provider.of<AddExpenseController>(
      context,
      listen: false,
    );
    final isValid = controller.validateAllFields();
    if (isValid) {
      final item = controller.toExpenseItem();

      // Add item and refresh the UI
      addExpenseController.addItem(item);
      controller.reset(listen: true);
    }
  }

  @override
  Widget build(BuildContext context) {
    const sheetSize = 0.85;
    final controller = Provider.of<AddItemController>(context);

    return DraggableScrollableSheet(
      initialChildSize: sheetSize,
      minChildSize: sheetSize,
      maxChildSize: sheetSize,
      expand: false,
      builder: (context, scrollController) {
        return SafeArea(
          child: SizedBox(
            width: double.infinity,
            child: Stack(
              children: [
                // 🔽 Scrollable content
                Padding(
                  padding: const EdgeInsets.only(top: 80, bottom: 130),
                  child: SingleChildScrollView(
                    controller: scrollController,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 20,
                    ),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ItemNameField(),
                        SizedBox(height: 20),
                        QuantityRowField(),
                        SizedBox(height: 20),
                        TotalItemPricingField(),
                        SizedBox(height: 300), // placeholder for spacing
                      ],
                    ),
                  ),
                ),

                // 🔼 Header
                const Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: AddItemHeader(),
                ),

                // 🔽 Bottom buttons with logic
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: AddItemBottomActions(
                    onSave: _handleSave,
                    onSaveAndNew: () {
                      _handleSaveAndNew(controller);
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
