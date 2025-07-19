import 'package:flutter/material.dart';
import 'preview_image_item.dart';

class HistoryItemTile extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String title;
  final String createdAt;
  final String createdBy;
  final List<String>? imagePaths;
  final bool isLast;

  const HistoryItemTile({
    super.key,
    required this.icon,
    required this.color,
    required this.title,
    required this.createdAt,
    required this.createdBy,
    this.imagePaths,
    this.isLast = false,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final hintColor = Theme.of(context).hintColor;

    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 🔹 Icon + Title Row
          Row(
            children: [
              Icon(icon, color: color, size: 20),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  title,
                  style: textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 6),

          // 🏷️ Metadata and Images
          Padding(
            padding: const EdgeInsets.only(left: 32),
            child: LayoutBuilder(
              builder: (context, constraints) {
                final hasOneImage = (imagePaths?.length ?? 0) == 1;
                final canFitImageBeside = constraints.maxWidth > 300 && hasOneImage;

                if (canFitImageBeside) {
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // ⬅️ Metadata
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Creation Date: $createdAt',
                              style: textTheme.bodySmall?.copyWith(color: hintColor),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'Created By: $createdBy',
                              style: textTheme.bodySmall?.copyWith(color: hintColor),
                            ),
                          ],
                        ),
                      ),

                      // ➡️ Single image preview
                      PreviewImageItem(imagePath: imagePaths!.first),
                    ],
                  );
                } else {
                  return Wrap(
                    spacing: 20,
                    runSpacing: 12,
                    crossAxisAlignment: WrapCrossAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Creation Date: $createdAt',
                            style: textTheme.bodySmall?.copyWith(color: hintColor),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'Created By: $createdBy',
                            style: textTheme.bodySmall?.copyWith(color: hintColor),
                          ),
                        ],
                      ),
                      if (imagePaths != null && imagePaths!.isNotEmpty)
                        Wrap(
                          spacing: 10,
                          children: imagePaths!
                              .map((path) => PreviewImageItem(imagePath: path))
                              .toList(),
                        ),
                    ],
                  );
                }
              },
            ),
          ),

          const SizedBox(height: 10),

          if (!isLast)
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(width: 200, child: Divider()),
              ],
            ),
        ],
      ),
    );
  }
}
