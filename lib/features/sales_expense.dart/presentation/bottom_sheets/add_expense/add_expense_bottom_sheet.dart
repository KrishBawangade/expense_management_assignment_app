import 'package:expense_management_assignment_app/features/sales_expense.dart/application/providers/expense_provider.dart';
import 'package:expense_management_assignment_app/features/sales_expense.dart/presentation/bottom_sheets/add_expense/widgets/add_item_button.dart';
import 'package:expense_management_assignment_app/features/sales_expense.dart/presentation/bottom_sheets/add_expense/widgets/billing_summary_card.dart';
import 'package:expense_management_assignment_app/features/sales_expense.dart/presentation/bottom_sheets/add_expense/widgets/category_text_field.dart';
import 'package:expense_management_assignment_app/features/sales_expense.dart/presentation/bottom_sheets/add_expense/widgets/notes_text_field.dart';
import 'package:expense_management_assignment_app/features/sales_expense.dart/presentation/bottom_sheets/add_expense/widgets/payment_mode_drop_down_field.dart';
import 'package:expense_management_assignment_app/features/sales_expense.dart/presentation/bottom_sheets/add_expense/widgets/upload_images_widget.dart';
import 'package:expense_management_assignment_app/features/sales_expense.dart/presentation/bottom_sheets/add_expense/widgets/vendor_text_field.dart';
import 'package:expense_management_assignment_app/features/sales_expense.dart/presentation/bottom_sheets/add_item/sheet_launcher/add_item_sheet_launcher.dart';
import 'package:expense_management_assignment_app/shared/providers/image_picker_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:expense_management_assignment_app/features/sales_expense.dart/presentation/bottom_sheets/add_expense/widgets/date_picker_form_field.dart';
import 'package:expense_management_assignment_app/features/sales_expense.dart/presentation/bottom_sheets/add_expense/widgets/expense_bottom_sheet_buttons.dart';
import 'package:expense_management_assignment_app/features/sales_expense.dart/presentation/bottom_sheets/add_expense/widgets/new_expense_chip.dart';
import 'package:expense_management_assignment_app/features/sales_expense.dart/presentation/bottom_sheets/add_expense/controller/add_expense_controller.dart';

class AddExpenseBottomSheet extends StatefulWidget {
  const AddExpenseBottomSheet({super.key});

  @override
  State<AddExpenseBottomSheet> createState() => _AddExpenseBottomSheetState();
}

class _AddExpenseBottomSheetState extends State<AddExpenseBottomSheet> {
  AddExpenseController? disposeController;
  ImagePickerProvider? disposeImagePickerProvider;

  @override
  void initState() {
    super.initState();
    disposeController = Provider.of<AddExpenseController>(
      context,
      listen: false,
    );
    disposeImagePickerProvider = Provider.of<ImagePickerProvider>(
      context,
      listen: false,
    );
  }

  @override
  void dispose() {
    // 🔄 Reset form state when sheet is disposed
    disposeController?.reset();
    disposeImagePickerProvider?.clearImage();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final sheetSize = 0.85;

    final controller = Provider.of<AddExpenseController>(context);
    final expenseProvider = Provider.of<ExpenseProvider>(context);

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
                // 🧾 Main scrollable content
                Padding(
                  padding: const EdgeInsets.only(bottom: 150, top: 60),
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 24,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const DatePickerFormField(),
                        const SizedBox(height: 20),
                        const CategoryTextField(),
                        const VendorTextField(),
                        const SizedBox(height: 20),
                        AddItemButton(
                          hasItems: controller.items.isNotEmpty,
                          onPressed: () {
                            showAddItemBottomSheet(context);
                          },
                        ),
                        const SizedBox(height: 20),
                        const BillingSummaryCard(),
                        const SizedBox(height: 20),
                        PaymentModeDropDownField(),
                        const SizedBox(height: 20),
                        UploadImagesWidget(),
                        const SizedBox(height: 20),
                        NotesTextField(),
                        const SizedBox(height: 150),
                      ],
                    ),
                  ),
                ),

                // 🔵 Centered Chip at the top
                const Positioned(
                  top: 12,
                  left: 0,
                  right: 0,
                  child: NewExpenseChip(),
                ),

                // ✅ Bottom Submit & Cancel buttons
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: ExpenseBottomSheetButtons(
                    onSubmit: () async {
                      if (controller.isFormValid) {
                        final expense = controller.toExpenseModel();
                        await expenseProvider.addNewExpense(expense);
                        if (context.mounted) {
                          Navigator.of(context).pop();
                        }
                      }
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
