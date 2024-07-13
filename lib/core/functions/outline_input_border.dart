import 'package:flutter/material.dart';
import 'package:kafiil_app/core/utils/constants.dart';

OutlineInputBorder buildOutlineInputBorder({Color? color}) {
  return OutlineInputBorder(
      borderSide: BorderSide(
        color: color ?? kGrey50Color,
      ),
      borderRadius: BorderRadius.circular(16)
  );
}
