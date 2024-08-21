import 'package:flutter/material.dart';
import 'package:kafiil_app/core/theme/app_colors.dart';


class GreyContainer extends StatelessWidget{
  const GreyContainer({super.key,this.child});

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      decoration: BoxDecoration(
        color: AppColors.kGrey50Color,
        borderRadius: BorderRadius.circular(16)
      ),
      child: child,
    );
  }

}