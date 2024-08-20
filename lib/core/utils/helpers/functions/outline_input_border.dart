import 'package:flutter/material.dart';
import 'package:kafiil_app/core/theme/app_colors.dart';


OutlineInputBorder buildOutlineInputBorder({Color? color}) {
  return OutlineInputBorder(
      borderSide: BorderSide(
        color: color ?? AppColors.kGrey50Color,
      ),
      borderRadius: BorderRadius.circular(16)
  );
}
