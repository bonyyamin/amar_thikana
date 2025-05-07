import 'package:flutter/material.dart';
import 'package:amar_thikana/core/theme/app_colors.dart';

class ConfirmationDialog extends StatelessWidget {
  final String title;
  final String message;
  final String confirmText;
  final String cancelText;
  final VoidCallback onConfirm;
  final bool isDestructive;

  const ConfirmationDialog({
    super.key,
    required this.title,
    required this.message,
    this.confirmText = 'Confirm',
    this.cancelText = 'Cancel',
    required this.onConfirm,
    this.isDestructive = false,
  });

  static Future<bool?> show({
    required BuildContext context,
    required String title,
    required String message,
    String confirmText = 'Confirm',
    String cancelText = 'Cancel',
    required VoidCallback onConfirm,
    bool isDestructive = false,
  }) {
    return showDialog<bool>(
      context: context,
      builder:
          (context) => ConfirmationDialog(
            title: title,
            message: message,
            confirmText: confirmText,
            cancelText: cancelText,
            onConfirm: onConfirm,
            isDestructive: isDestructive,
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        title,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
      content: Text(message),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(false),
          child: Text(cancelText, style: TextStyle(color: Colors.grey[600])),
        ),
        TextButton(
          onPressed: () {
            onConfirm();
            Navigator.of(context).pop(true);
          },
          child: Text(
            confirmText,
            style: TextStyle(
              color: isDestructive ? Colors.red : AppColors.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
