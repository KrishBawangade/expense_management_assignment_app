import 'package:flutter/material.dart';

/// A clean, slightly flexible app bar with:
/// - optional back button,
/// - title,
/// - info icon beside it,
/// - optional actions at the end.
class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  /// Whether to show the back button on the left.
  final bool showBackButton;

  /// Callback when the info icon is pressed.
  final VoidCallback? onInfoPressed;

  /// Additional actions to show at the end of the app bar.
  final List<Widget>? actions;

  const MainAppBar({
    super.key,
    required this.title,
    this.showBackButton = false,
    this.onInfoPressed,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return AppBar(
      titleSpacing: 0,
      backgroundColor: Colors.white,
      elevation: 0,
      automaticallyImplyLeading: false, // We control the leading manually for testing
      title: Row(
        children: [
          /// Optional back button
          if (showBackButton)
            IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                if (Navigator.of(context).canPop()) {
                  Navigator.of(context).pop();
                }
              },
            )
          else
            const SizedBox(width: 16),

          /// Title text
          Text(
            title,
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),

          /// Info icon
          IconButton(
            icon: Icon(Icons.info_outline, color: colorScheme.secondary,),
            onPressed: onInfoPressed,
          ),

          const Spacer(),

          /// Optional additional actions
          if (actions != null) ...actions!,
          SizedBox(width: 4,)
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
