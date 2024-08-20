import 'package:flutter/material.dart';
import 'package:kafiil_app/core/constants/app_strings.dart';
import 'package:kafiil_app/core/theme/app_colors.dart';
import 'package:kafiil_app/core/theme/app_styles.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class CountriesLoadingWidget extends StatelessWidget {
  const CountriesLoadingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            LoadingAnimationWidget.prograssiveDots(
              size: 80,
              color: AppColors.kPrimary900Color
            ),
            const SizedBox(width: 10,),
            Text(AppStrings.dataLoading,
              style: AppStyles.styleMedium12(context)
            )
          ],
        ),
        Text(AppStrings.wait,
          style: AppStyles.styleMedium16(context).copyWith(
              fontSize: 20
          ),
        )
      ],
    );
  }
}