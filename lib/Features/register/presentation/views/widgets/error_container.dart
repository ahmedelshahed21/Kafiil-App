import 'package:flutter/material.dart';
import 'package:kafiil_app/core/theme/app_colors.dart';
import 'package:kafiil_app/core/theme/app_styles.dart';

class ErrorContainer extends StatelessWidget {
  const ErrorContainer({
    super.key,
    required String errorMessage,
  }) : _errorMessage = errorMessage;

  final String _errorMessage;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      decoration: BoxDecoration(
          color: AppColors.kError50Color, borderRadius: BorderRadius.circular(4)),
      child: Row(
        children: [
          const Icon(
            Icons.error_outline,
            color: AppColors.kError300Color,
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            _errorMessage,
            style: AppStyles.styleMedium12(context)
                .copyWith(color: AppColors.kError300Color),
          ),
        ],
      ),
    );
  }
}