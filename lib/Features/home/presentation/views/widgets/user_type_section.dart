import 'package:flutter/material.dart';
import 'package:kafiil_app/core/constants/app_strings.dart';
import 'package:kafiil_app/core/theme/app_colors.dart';
import 'package:kafiil_app/core/theme/app_styles.dart';

class UserTypeSection extends StatelessWidget {

  final String? userType;
  final void Function(String?)? userTypeOnChanged;



  const UserTypeSection({
    super.key, this.userType, this.userTypeOnChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.bottomLeft,
          child: Text(
            AppStrings.userType,
            style: AppStyles.styleMedium12(context),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Radio(
              activeColor: AppColors.kPrimary900Color,
              value: 'seller',
              groupValue: userType,
              onChanged: userTypeOnChanged,
            ),
            Text(
              'seller',
              style: AppStyles.styleMedium16(context),
            ),
            const SizedBox(width: 10),
            Radio(
              activeColor: AppColors.kPrimary900Color,
              value: 'buyer',
              groupValue: userType,
              onChanged: userTypeOnChanged,
            ),
            Text(
              'buyer',
              style: AppStyles.styleMedium16(context),
            ),
            const SizedBox(width: 10),
            Radio(
              activeColor: AppColors.kPrimary900Color,
              value: 'both',
              groupValue: userType,
              onChanged: userTypeOnChanged
            ),
            Text(
              'both',
              style: AppStyles.styleMedium16(context),
            ),
          ],
        ),
      ],
    );
  }
}