import 'package:flutter/material.dart';
import 'package:kafiil_app/core/theme/app_styles.dart';


void customSnackBar(BuildContext context, String message, {IconData? icon, Color? iconColor, TextStyle? textStyle,int? customDuration}) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: Colors.black.withOpacity(0.8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(100),
      ),
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      duration: Duration(seconds: customDuration??2),
      content: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon ?? Icons.warning_amber_rounded,
              color: iconColor ?? Colors.yellow,
              size: 30,
            ),
            const SizedBox(width: 5),
            Flexible(
              child: FittedBox(
                child: Text(message,
                    style: textStyle ?? AppStyles.styleSemiBold14(context).copyWith(color: Colors.yellowAccent)
                ),
              ),
            ),
          ],
        ),
      )));
}
