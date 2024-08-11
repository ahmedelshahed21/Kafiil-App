import 'package:flutter/material.dart';

import 'package:kafiil_app/core/utils/styles_app.dart';


void customSnackBar(BuildContext context, String message,
    {IconData? icon, Color? iconColor}) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: Colors.black.withOpacity(0.7),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(100),
      ),
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      duration: const Duration(seconds: 2),
      content: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon ?? Icons.warning_amber_rounded,
              color: iconColor ?? Colors.yellow,
              size: 30,
            ),
            const SizedBox(width: 10,),
            Flexible(
              child: Text(message,
                  style: StylesApp.styleMedium12(context)
                      .copyWith(color: Colors.yellow)),
            ),
          ],
        ),
      )));
}
