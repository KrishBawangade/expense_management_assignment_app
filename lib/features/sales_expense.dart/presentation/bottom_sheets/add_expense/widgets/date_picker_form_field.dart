import 'package:expense_management_assignment_app/features/sales_expense.dart/presentation/bottom_sheets/add_expense/controller/add_expense_controller.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

/// A reusable date picker form field that integrates directly
/// with the AddExpenseController using Provider.
class DatePickerFormField extends StatelessWidget {
  const DatePickerFormField({super.key});

  /// Returns the given [DateTime] formatted as '01-July-2025'.
  String _formatDate(DateTime date) {
    final formatter = DateFormat('dd-MMMM-yyyy');
    return formatter.format(date);
  }

  /// Opens the date picker dialog with custom styling.
  Future<void> _pickDate(BuildContext context, DateTime initialDate) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      builder: (context, child) {
        final theme = Theme.of(context);
        return Theme(
          data: theme.copyWith(
            datePickerTheme: DatePickerThemeData(
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              cancelButtonStyle: TextButton.styleFrom(
                foregroundColor: Colors.grey.shade800,
                textStyle: const TextStyle(fontWeight: FontWeight.w700),
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 8,
                ),
              ),
              confirmButtonStyle: TextButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: const Color(0xFF0D5691),
                textStyle: const TextStyle(fontWeight: FontWeight.bold),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 8,
                ),
              ),
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      if (context.mounted) {
        context.read<AddExpenseController>().updateDate(picked);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<AddExpenseController>();
    final selectedDate = controller.selectedDate;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 🏷️ Label with red star for required field
        RichText(
          text: TextSpan(
            text: 'Date',
            style: Theme.of(
              context,
            ).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
            children: const [
              TextSpan(text: ' *', style: TextStyle(color: Colors.red)),
            ],
          ),
        ),
        const SizedBox(height: 8),

        // 📅 Tappable field with formatted date
        GestureDetector(
          onTap: () => _pickDate(context, selectedDate),
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: Theme.of(context).hintColor.withAlpha(100),
                width: 0.5,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  _formatDate(selectedDate),
                  style: const TextStyle(fontSize: 16),
                ),
                Icon(
                  Icons.calendar_month,
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
