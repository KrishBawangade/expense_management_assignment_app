import 'package:flutter/material.dart';

class SalesExpenseScreen extends StatelessWidget {
  const SalesExpenseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
        backgroundColor: Theme.of(context).colorScheme.primary,
        child: Icon(Icons.add, color: Theme.of(context).colorScheme.onPrimary),
      ),
      body: Center(child: Text("Sales & Expense Page")),
    );
  }
}
