import 'package:flutter/material.dart';
import 'package:kafiil_app/core/theme/app_colors.dart';
import 'package:kafiil_app/core/theme/app_styles.dart';
import 'package:kafiil_app/core/utils/helpers/functions/outline_input_border.dart';


class CustomTextFormField extends StatelessWidget {
  final String? fieldName;
  final String? hintText;
  final bool? obscureText;
  final int? maxLength;
  final int? maxLines;
  final int? minLines;
  final TextInputType? textInputType;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final Widget? prefix;
  final Widget? prefixIcon;
  final Widget? suffix;
  final Widget? suffixIcon;
  final void Function()? suffixOnPressed;
  final EdgeInsetsGeometry? contentPadding;
  final TextEditingController? controller;

  final void Function()? onTap;
  final bool? readOnly;
  final String? initialValue; // New parameter for initial value

  const CustomTextFormField({
    super.key,
    this.hintText,
    this.textInputType,
    this.validator,
    this.onChanged,
    this.suffixIcon,
    this.suffixOnPressed,
    this.obscureText,
    this.contentPadding,
    this.maxLength,
    this.maxLines,
    this.controller,
    this.fieldName,
    this.minLines,
    this.onTap,
    this.readOnly,
    this.initialValue, this.prefix, this.suffix, this.prefixIcon, // Initialize here
  });

  String? validateMessage() {
    switch (fieldName) {
    case 'First Name' : return 'First Name';
    case 'Last Name' : return 'Last Name';
    case 'Email Address' : return 'Email Address';
    case 'Password' : return 'Password';
    }
    return 'Field';
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          fieldName ?? '',
          style: AppStyles.styleMedium12(context),
        ),
        const SizedBox(height: 5.0),
        TextFormField(
          onChanged: onChanged,
          onTap: onTap,
          readOnly: readOnly ?? false,
          style: AppStyles.styleMedium16(context).copyWith(
            color: AppColors.kGrey800Color,
          ),
          keyboardType: textInputType,
          obscureText: obscureText ?? false,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: validator ??
                  (data) {
                if (data!.isEmpty) {
                  return '${validateMessage()} is required';
                }
                return null;
              },
          cursorColor: AppColors.kPrimary900Color,
          cursorRadius: const Radius.circular(16),
          cursorHeight: 28,
          cursorWidth: 2,
          maxLength: maxLength ?? 24,
          minLines: minLines ?? 1,
          maxLines: maxLines ?? 1,
          initialValue: initialValue,
          decoration: InputDecoration(
            counterText: '',
            contentPadding: contentPadding ?? const EdgeInsets.symmetric(vertical: 18.0, horizontal: 12.0),
            filled: true,
            fillColor: AppColors.kGrey50Color,
            prefix: prefix,
            suffix: suffix,
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            suffixIconColor: AppColors.kGrey500Color,
            hintText: hintText,
            hintStyle: AppStyles.styleMedium16(context).copyWith(color: AppColors.kGrey800Color,),
            enabledBorder: buildOutlineInputBorder(),
            focusedBorder: buildOutlineInputBorder(),
            errorBorder: buildOutlineInputBorder(color: Colors.red),
            focusedErrorBorder: buildOutlineInputBorder(color: Colors.red),
          ),
          controller: controller,
        ),
      ],
    );
  }
}
