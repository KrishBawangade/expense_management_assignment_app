import 'package:expense_management_assignment_app/features/sales_expense.dart/application/providers/expense_provider.dart';
import 'package:expense_management_assignment_app/features/sales_expense.dart/presentation/bottom_sheets/add_expense/sheet_launcher/expense_sheet_launcher.dart';
import 'package:expense_management_assignment_app/shared/widgets/main_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:provider/provider.dart';
import '../widgets/expense_item_tile.dart';

class SalesExpenseScreen extends StatefulWidget {
  const SalesExpenseScreen({super.key});

  @override
  State<SalesExpenseScreen> createState() => _SalesExpenseScreenState();
}

class _SalesExpenseScreenState extends State<SalesExpenseScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();

    // Load expense data on the next microtask with safe context access
    Future.microtask(() async {
      if (mounted) {
        final expenseProvider = Provider.of<ExpenseProvider>(
          context,
          listen: false,
        );
        if (expenseProvider.expenses == null) {
          await expenseProvider.loadExpenses();
        }
      }
    });

    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(() {
      if (_tabController.indexIsChanging) return;
      setState(() {}); // To update FAB or UI
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final expenseProvider = Provider.of<ExpenseProvider>(context);
    final expenseList = expenseProvider.expenses;

    return SafeArea(
      top: false,
      child: Scaffold(
        appBar: MainAppBar(
          title: 'Sales & Expense',
          showBackButton: true,
          actions: [
            IconButton(
              icon: Icon(
                FeatherIcons.search,
                color: theme.hintColor.withAlpha(100),
              ),
              onPressed: () {},
            ),
          ],
        ),
        floatingActionButton:
            _tabController.index == 1
                ? Padding(
                  padding: const EdgeInsets.only(bottom: 120),
                  child: FloatingActionButton(
                    onPressed: () {
                      showAddExpenseBottomSheet(context);
                    },
                    shape: const CircleBorder(),
                    backgroundColor: colorScheme.primary,
                    child: const Icon(Icons.add),
                  ),
                )
                : null,
        body: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(
                left: 16,
                bottom: 8,
                top: 20,
                right: 16,
              ),
              child: TabBar(
                controller: _tabController,
                isScrollable: true,
                splashBorderRadius: BorderRadius.circular(20),
                labelColor: colorScheme.primary,
                unselectedLabelColor: theme.hintColor,
                indicatorSize: TabBarIndicatorSize.tab,
                labelPadding: const EdgeInsets.symmetric(horizontal: 25),
                tabAlignment: TabAlignment.start,
                indicatorPadding: const EdgeInsets.symmetric(vertical: 8),
                indicator: BoxDecoration(
                  color: colorScheme.primary.withAlpha(40),
                  borderRadius: BorderRadius.circular(20),
                ),
                tabs: const [
                  Tab(text: 'Sales'),
                  Tab(text: 'Expense'),
                  Tab(text: 'Money Management'),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  const Center(
                    child: Text(
                      'Sales',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: TextField(
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'Type here to add more category',
                            hintStyle: TextStyle(
                              color: theme.hintColor.withAlpha(150),
                            ),
                            // Light border with improved styling
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: theme.hintColor.withAlpha(30),
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: theme.hintColor.withAlpha(30),
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: colorScheme.primary.withAlpha(100),
                                width: 1.5,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 12,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child:
                            expenseList == null || expenseList.isEmpty
                                ? const Center(
                                  child: Text('No expenses added yet'),
                                )
                                : ListView.separated(
                                  itemCount: expenseList.length,
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 16,
                                  ),
                                  itemBuilder: (context, index) {
                                    final expense = expenseList[index];
                                    return ExpenseItemTile(
                                      categoryName: expense.categoryName,
                                      isFixed: expense.isFixed,
                                      onItemClicked: () {},
                                    );
                                  },
                                  separatorBuilder:
                                      (_, __) => const SizedBox(height: 12),
                                ),
                      ),
                    ],
                  ),
                  const Center(
                    child: Text(
                      'Money Management',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
