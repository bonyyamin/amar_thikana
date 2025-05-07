import 'package:flutter/material.dart';
import 'package:amar_thikana/core/theme/app_colors.dart';

class CustomAlertDialog extends StatelessWidget {
  final String title;
  final String message;
  final String buttonText;
  final VoidCallback? onPressed;
  final bool isError;

  const CustomAlertDialog({
    super.key,
    required this.title,
    required this.message,
    this.buttonText = 'OK',
    this.onPressed,
    this.isError = false,
  });

  static Future<void> show({
    required BuildContext context,
    required String title,
    required String message,
    String buttonText = 'OK',
    VoidCallback? onPressed,
    bool isError = false,
  }) {
    return showDialog(
      context: context,
      builder:
          (context) => CustomAlertDialog(
            title: title,
            message: message,
            buttonText: buttonText,
            onPressed: onPressed,
            isError: isError,
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Row(
        children: [
          Icon(
            isError ? Icons.error_outline : Icons.info_outline,
            color: isError ? Colors.red : AppColors.primary,
          ),
          const SizedBox(width: 8),
          Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: isError ? Colors.red : Colors.black87,
            ),
          ),
        ],
      ),
      content: Text(message),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
            onPressed?.call();
          },
          child: Text(
            buttonText,
            style: TextStyle(
              color: isError ? Colors.red : AppColors.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
