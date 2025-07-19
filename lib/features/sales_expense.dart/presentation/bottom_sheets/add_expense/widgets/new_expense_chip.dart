import 'package:flutter/material.dart';

class NewExpenseChip extends StatelessWidget {
  const NewExpenseChip({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Center(
      child: Chip(
        side: BorderSide.none,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        label: Text(
          'New Expense',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: colorScheme.primary,
          ),
        ),
        backgroundColor: colorScheme.primary.withAlpha(40),
      ),
    );
  }
}
