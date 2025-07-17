import 'package:flutter/material.dart';

/// A tile showing category name with:
/// - A tappable 3-dots icon (in a box) on the left
/// - The category name centered
/// - A trailing arrow icon on the right
class ExpenseItemTile extends StatelessWidget {
  final String categoryName;

  final bool isFixed;

  /// Callback when the leading icon (3-dots) is tapped
  final VoidCallback? onLeadingPressed;

  /// Callback when the whole list tile is clicked
  final VoidCallback? onItemClicked;

  const ExpenseItemTile({
    super.key,
    required this.categoryName,
    required this.isFixed,
    this.onLeadingPressed,
    this.onItemClicked,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return ListTile(
      tileColor: Colors.white,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: theme.hintColor.withAlpha(40),),
        borderRadius: BorderRadius.circular(8)),

      /// Leading 3-dot box icon
      leading: isFixed? null: InkWell(
        onTap: onLeadingPressed,
        borderRadius: BorderRadius.circular(8),
        splashColor: colorScheme.secondary.withAlpha(60),
        child: Container(
          width: 25,
          height: 25,
          decoration: BoxDecoration(
            border: Border.all(color: colorScheme.secondary, width: 1.5),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(Icons.more_horiz, size: 20, color: colorScheme.secondary),
        ),
      ),

      /// Category name centered
      title: Text(
        categoryName,
        textAlign: TextAlign.center,
        style: theme.textTheme.bodyLarge?.copyWith(
          fontWeight: FontWeight.bold
        ),
      ),

      /// Right arrow icon
      trailing: Icon(Icons.keyboard_arrow_right, color: colorScheme.secondary),

      /// Main tile tap handler
      onTap: onItemClicked,
    );
  }
}
