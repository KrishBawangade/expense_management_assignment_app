import 'package:expense_management_assignment_app/core/constants/asset_paths.dart';
import 'package:expense_management_assignment_app/features/sales_expense.dart/presentation/bottom_sheets/view_history/widgets/history_item_tile.dart';
import 'package:flutter/material.dart';

class ViewHistoryBottomSheet extends StatelessWidget {
  const ViewHistoryBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    const sheetSize = 0.85;

    return DraggableScrollableSheet(
      initialChildSize: sheetSize,
      minChildSize: sheetSize,
      maxChildSize: sheetSize,
      expand: false,
      builder: (context, scrollController) {
        return SafeArea(
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 🧾 Header
                const Text(
                  'View History',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 8),
                const Divider(thickness: 1),
                const SizedBox(height: 20),

                // 📜 List of history items
                Expanded(
                  child: ListView(
                    controller: scrollController,
                    children: [
                      HistoryItemTile(
                        icon: Icons.add_box_outlined,
                        color: Theme.of(context).colorScheme.secondary,
                        title: 'Expense Entry Created & No Payment done',
                        createdAt: '01-June-2025, 12:50 hrs',
                        createdBy: 'Krish Bawangade',
                      ),
                      HistoryItemTile(
                        icon: Icons.description,
                        color: Colors.amber,
                        title: 'Payment of ₹ 7,000.00 via UPI',
                        createdAt: '04-June-2025, 16:00 hrs',
                        createdBy: 'Krish Bawangade',
                        imagePaths: [
                          AssetPaths.dummyReceipt1
                        ],
                      ),
                      HistoryItemTile(
                        icon: Icons.description,
                        color: Colors.amber,
                        title: 'Payment of ₹ 15,000.00 via NEFT/RTGS',
                        createdAt: '10-June-2025, 10:32 hrs',
                        createdBy: 'Krish Bawangade',
                        isLast: true,
                        imagePaths: [
                          AssetPaths.dummyReceipt2,
                          AssetPaths.dummyReceipt3,
                        ],
                      ),
                    ],
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
