import 'package:flutter/material.dart';
import 'package:kafiil_app/core/theme/app_styles.dart';
import 'package:kafiil_app/core/theme/app_colors.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    super.key,
    this.onPressed,
    this.radius,
    this.backgroundColor,
    this.text,
    this.child,
    this.borderRadius,
  });

  final String? text;
  final void Function()? onPressed;
  final double? radius;
  final BorderRadius? borderRadius;
  final Widget? child;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: TextButton.styleFrom(
            backgroundColor: backgroundColor ?? AppColors.kPrimary900Color,
            shape: RoundedRectangleBorder(
                borderRadius: borderRadius ??BorderRadius.circular(radius ?? 12))),
        onPressed: onPressed,
        child: child ?? Text(
          text??'',
          style: AppStyles.styleMedium15(context),
        ));
  }
}
