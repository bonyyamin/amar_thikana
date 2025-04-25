import 'package:amar_thikana/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class HomeHeadingText extends StatelessWidget {
  const HomeHeadingText({super.key});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: 'Find\n',
        style: TextStyle(
          fontSize: 26,
          fontWeight: FontWeight.w500,
          color: AppColors.textPrimary,
        ),
        children: [
          TextSpan(
            text: 'best place ',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w300,
              color: AppColors.textPrimary,
            ),
          ),
          TextSpan(
            text: 'nearby',
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.w500,
              color: AppColors.primaryLight,
            ),
          ),
          const WidgetSpan(
            child: Padding(
              padding: EdgeInsets.only(left: 4),
              child: Text('👌', style: TextStyle(fontSize: 24)),
            ),
          ),
        ],
      ),
    );
  }
}
