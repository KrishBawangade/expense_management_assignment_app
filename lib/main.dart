import 'package:expense_management_assignment_app/features/sales_expense.dart/data/dummy/dummy_expense_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'core/routing/app_router.dart';
import 'core/routing/app_routes.dart';
import 'core/theme/app_theme.dart';
import 'features/sales_expense.dart/domain/usecases/add_expense.dart';
import 'features/sales_expense.dart/domain/usecases/delete_expense.dart';
import 'features/sales_expense.dart/domain/usecases/get_all_expenses.dart';
import 'features/sales_expense.dart/domain/usecases/get_expense_by_id.dart';
import 'features/sales_expense.dart/domain/usecases/update_expense.dart';
import 'features/sales_expense.dart/application/providers/expense_provider.dart';
import 'features/sales_expense.dart/presentation/pages/sales_expense_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  // Lock orientation to portrait only
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final repository = DummyExpenseRepository(); // Initialize the dummy repo

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ExpenseProvider(
            getAllExpenses: GetAllExpenses(repository),
            addExpense: AddExpense(repository),
            updateExpense: UpdateExpense(repository),
            deleteExpense: DeleteExpense(repository),
            getExpenseById: GetExpenseById(repository),
          ),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.appTheme,
        themeMode: ThemeMode.light,
        initialRoute: AppRoutes.salesExpense,
        onGenerateRoute: AppRouter.generateRoute,
        home: const SalesExpenseScreen(),
      ),
    ); // ✅ This semicolon closes the return statement properly
  }
}
