import 'package:flutter/material.dart';

/// A rounded "Add Item" button with a + icon inside a bordered white box.
/// Styled using secondary color theme. Triggers a callback when pressed.
class AddItemButton extends StatelessWidget {
  final VoidCallback onPressed;

  const AddItemButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return SizedBox(
      width: double.infinity,
      child: OutlinedButton.icon(
        onPressed: onPressed,
        icon: Container(
          decoration: BoxDecoration(
            border: Border.all(color: colorScheme.secondary, width: 1.2),
            borderRadius: BorderRadius.circular(6),
          ),
          padding: const EdgeInsets.all(4),
          child: Icon(
            Icons.add,
            color: colorScheme.secondary,
            size: 15,
            weight: 1.2,
          ),
        ),
        label: Padding(
          padding: const EdgeInsets.only(left: 4),
          child: Text(
            'Add Item',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: colorScheme.secondary,
            ),
          ),
        ),
        style: OutlinedButton.styleFrom(
          side: BorderSide(color: colorScheme.secondary),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          foregroundColor: colorScheme.secondary,
          backgroundColor: Colors.white,
        ),
      ),
    );
  }
}
