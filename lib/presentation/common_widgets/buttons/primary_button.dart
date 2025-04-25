import 'package:amar_thikana/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color? backgroundColor;
  final Color? textColor;
  final double height;
  final double borderRadius;
  final TextStyle? textStyle;
  final Widget? leadingIcon;

  const PrimaryButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.backgroundColor,
    this.textColor,
    this.height = 50,
    this.borderRadius = 8,
    this.textStyle,
    this.leadingIcon,
  }) : super();

  @override
  Widget build(BuildContext context) {
    final Color bg = backgroundColor ?? AppColors.secondary;
    final Color txtColor = textColor ?? Colors.white;

    return SizedBox(
      width: double.infinity,
      height: height,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: bg,
          foregroundColor: txtColor,
          elevation: 1,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment:
              leadingIcon == null
                  ? MainAxisAlignment.center
                  : MainAxisAlignment.start,
          children: [
            if (leadingIcon != null) ...[
              leadingIcon!,
              const SizedBox(width: 12),
            ],
            Text(
              text,
              style:
                  textStyle ??
                  TextStyle(
                    color: txtColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
