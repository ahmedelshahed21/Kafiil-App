import 'package:flutter/material.dart';
import 'package:kafiil_app/core/theme/app_colors.dart';
import 'package:kafiil_app/core/theme/app_styles.dart';

class GenderSection extends StatelessWidget{

  final int gender;
  final void Function(int?)? genderOnChange;

  const GenderSection({super.key, required this.gender, this.genderOnChange});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.bottomLeft,
          child: Text(
            'Gender',
            style: AppStyles.styleMedium12(context),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Radio(
              activeColor: AppColors.kPrimary900Color,
              value: 0,
              groupValue: gender,
              onChanged: genderOnChange
            ),
            Text(
              'Male',
              style: AppStyles.styleMedium16(context),
            ),
            const SizedBox(width: 10),
            Radio(
              activeColor: AppColors.kPrimary900Color,
              value: 1,
              groupValue: gender,
              onChanged: genderOnChange
            ),
            Text(
              'Female',
              style: AppStyles.styleMedium16(context),
            ),
          ],
        ),
      ],
    );
  }
}