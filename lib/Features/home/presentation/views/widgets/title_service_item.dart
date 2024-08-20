import 'package:flutter/material.dart';
import 'package:kafiil_app/core/theme/app_colors.dart';
import 'package:kafiil_app/core/theme/app_styles.dart';

class TitleServiceItem extends StatelessWidget {
  const TitleServiceItem({
    super.key,
    required this.title
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 6.0),
      child: Text(title,
        maxLines: 2,
        style: AppStyles.styleMedium12(context).copyWith(
          color: AppColors.kGrey900Color,
          fontSize: 10,
        ),
      ),
    );
  }
}