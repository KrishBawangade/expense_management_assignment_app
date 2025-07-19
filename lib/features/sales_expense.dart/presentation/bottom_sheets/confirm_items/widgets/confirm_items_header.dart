import 'package:flutter/material.dart';

/// 📋 Header row for the Confirm Items bottom sheet.
/// Displays column titles like Item Name, Quantity, and Rate.
class ConfirmItemsHeader extends StatelessWidget {
  const ConfirmItemsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Column(
        children: [
          Row(
            children: const [
              Expanded(
                flex: 1,
                child: Text(
                  'Item Name',
                  textAlign: TextAlign.left,
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
              ),
              Expanded(
                flex: 1,
                child: Text(
                  'Quantity',
                  textAlign: TextAlign.left,
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
              ),
              Expanded(
                flex: 1,
                child: Text(
                  'Rate',
                  textAlign: TextAlign.left,
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
              ),
              SizedBox(width: 20), // space for close icon
            ],
          ),
          const Divider(height: 16),
        ],
      ),
    );
  }
}
