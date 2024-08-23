import 'package:flutter/material.dart';
import 'package:kafiil_app/core/theme/app_colors.dart';
import 'package:kafiil_app/core/theme/app_styles.dart';
import 'package:shimmer/shimmer.dart';

class ItemLoadingEffect extends StatelessWidget{

  const ItemLoadingEffect({super.key, required this.itemName, this.height=60});
  final String itemName;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(itemName,
          style: AppStyles.styleMedium12(context),
        ),
        const SizedBox(height: 12.0),
        Shimmer.fromColors(
          baseColor: AppColors.kGrey50Color,
          highlightColor: AppColors.kBackgroundColor,
          child: Container(
            height: height,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: AppColors.kGrey50Color,
            ),
          ),
        )
      ],
    );
  }
}