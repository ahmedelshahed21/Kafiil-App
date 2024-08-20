import 'package:flutter/material.dart';
import 'package:kafiil_app/core/theme/app_colors.dart';


class ClickableContainer extends StatelessWidget{
  const ClickableContainer({super.key, this.onTap, this.child});
  final void Function()? onTap;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        decoration: BoxDecoration(
          color: AppColors.kGrey50Color,
          borderRadius: BorderRadius.circular(16)
        ),
        child: child,
      ),
    );
  }

}