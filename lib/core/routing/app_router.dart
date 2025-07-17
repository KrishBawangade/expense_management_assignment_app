import 'package:expense_management_assignment_app/features/sales_expense.dart/presentation/pages/sales_expense_screen.dart';
import 'package:flutter/material.dart';
import 'app_routes.dart';

/// Route manager for handling app navigation
class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.salesExpense:
        return MaterialPageRoute(
          builder: (_) => const SalesExpenseScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text('No route defined')),
          ),
        );
    }
  }
}
