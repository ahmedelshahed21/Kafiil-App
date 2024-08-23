import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kafiil_app/core/constants/app_strings.dart';
import 'package:kafiil_app/core/theme/app_colors.dart';
import 'package:kafiil_app/core/routing/app_router.dart';
import 'package:kafiil_app/core/theme/app_styles.dart';

class HaveNoAccountSection extends StatelessWidget{
  const HaveNoAccountSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(AppStrings.doNotHaveAnAccount,
          style: AppStyles.styleMedium14(context).copyWith(
              color: AppColors.kGrey500Color
          ),
        ),
        const SizedBox(width: 4,),
        GestureDetector(
          onTap: (){
            GoRouter.of(context).push(AppRouter.kRegisterView);
          },
          child: Text(AppStrings.register,
            style: AppStyles.styleSemiBold14(context),
          ),
        ),
      ],
    );
  }
}