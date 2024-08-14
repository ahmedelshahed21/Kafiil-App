import 'package:flutter/material.dart';
import 'package:kafiil_app/core/utils/constants.dart';
import 'package:kafiil_app/core/utils/styles_app.dart';

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
            backgroundColor: backgroundColor ?? kPrimary900Color,
            shape: RoundedRectangleBorder(
                borderRadius: borderRadius ??BorderRadius.circular(radius ?? 12))),
        onPressed: onPressed,
        child: child ?? Text(
          text??'',
          style: StylesApp.styleMedium15(context),
        ));
  }
}
