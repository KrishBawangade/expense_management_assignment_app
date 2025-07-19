import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:expense_management_assignment_app/features/sales_expense.dart/presentation/bottom_sheets/add_expense/controller/add_expense_controller.dart';
import 'package:expense_management_assignment_app/shared/providers/image_picker_provider.dart';

/// A reusable widget to upload and preview invoice images.
/// Uses AddExpenseController to manage selected image paths.
class UploadImagesWidget extends StatelessWidget {
  const UploadImagesWidget({super.key});

  /// Opens image picker via shared provider and adds selected image to controller
  Future<void> _pickImage(
    BuildContext context,
    AddExpenseController controller,
    ImagePickerProvider imagePickerProvider,
  ) async {
    await imagePickerProvider.pickImageFromGallery();
    final path = imagePickerProvider.selectedImage?.path;
    if (path != null) {
      controller.addImagePath(path);
    }
  }

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<AddExpenseController>();
    final imagePickerProvider = context.read<ImagePickerProvider>();

    final imagePaths = controller.uploadedImagePaths;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // External label
        const Text(
          'Upload Invoices/Images',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 8),

        // Image list + Add button at the end
        SizedBox(
          height: 80,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: imagePaths.length + 1, // last one is add icon
            separatorBuilder: (_, __) => const SizedBox(width: 16),
            itemBuilder: (context, index) {
              // For all image previews
              if (index < imagePaths.length) {
                final path = imagePaths[index];
                return Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Theme.of(context).hintColor.withAlpha(100)),
                    borderRadius: BorderRadius.circular(8)
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.file(
                      File(path),
                      width: 50,
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              }

              // Last item: "+" icon to pick image
              return GestureDetector(
                onTap: () => _pickImage(context, controller, imagePickerProvider),
                child: Container(
                  width: 50,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondary,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Center(
                    child: Icon(Icons.add, size: 32, color: Colors.white),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
