import 'package:flutter/material.dart';
import 'package:kafiil_app/Features/register/presentation/views/register_view.dart';
import 'package:kafiil_app/core/constants/app_strings.dart';
import 'package:kafiil_app/core/theme/app_colors.dart';
import 'package:kafiil_app/core/utils/widgets/custom_text_form_field.dart';
import 'package:kafiil_app/features/register/presentation/views/widgets/custom_drop_down_list.dart';


class RegisterStepContent extends StatefulWidget {

  final GlobalKey<FormState> formKey;
  const RegisterStepContent({super.key, required this.formKey});

  @override
  State<RegisterStepContent> createState() => _RegisterStepContentState();
}
class _RegisterStepContentState extends State<RegisterStepContent> {
  bool isPasswordSecure = true;
  bool isConfirmationPasswordSecure = true;

  @override
  Widget build(BuildContext context) {

    return Form(
      key: widget.formKey,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: CustomTextFormField(
                  fieldName: AppStrings.firstName,
                  controller: firstNameController,
                  maxLength: 50,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: CustomTextFormField(
                  fieldName: AppStrings.lastName,
                  maxLength: 50,
                  controller: lastNameController,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          CustomTextFormField(
            fieldName: AppStrings.email,
            maxLength: 64,
            controller: emailAddressController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return AppStrings.emailIsRequired;
              }
              String pattern = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
              RegExp regex = RegExp(pattern);
              if (!regex.hasMatch(value)) {
                return AppStrings.emailIsInvalid;
              }
              return null;
            },
          ),
          const SizedBox(height: 12),
          CustomTextFormField(
            fieldName: AppStrings.password,
            controller: passwordController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return AppStrings.passwordIsRequired;
              } else if (value.length < 8) {
                return AppStrings.passwordLength;
              }
              return null;
            },
            suffixIcon: IconButton(
              icon: isPasswordSecure
                  ? const Icon(
                Icons.visibility_off_outlined,
                color: AppColors.kGrey400Color
              )
                  : const Icon(
                Icons.remove_red_eye_outlined,
                color: AppColors.kGrey400Color,
              ),
              onPressed: () {
                setState(() {
                  isPasswordSecure = !isPasswordSecure;
                });
              },
            ),
            obscureText: isPasswordSecure,
          ),
          const SizedBox(height: 12),
          CustomTextFormField(
            fieldName: AppStrings.confirmPassword,
            controller: passwordConfirmationController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return AppStrings.confirmPasswordIsRequired;
              }
              if (value != passwordController.text) {
                return AppStrings.matchPasswordWithConfirmPassword;
              }
              return null;
            },
            suffixIcon: IconButton(
              icon: isConfirmationPasswordSecure
                  ? const Icon(
                Icons.visibility_off_outlined,
                color: AppColors.kGrey400Color,
              )
                  : const Icon(
                Icons.remove_red_eye_outlined,
                color: AppColors.kGrey400Color,
              ),
              onPressed: () {
                setState(() {
                  isConfirmationPasswordSecure = !isConfirmationPasswordSecure;
                });
              },
            ),
            obscureText: isConfirmationPasswordSecure,
          ),
          const SizedBox(height: 12),
          const CustomDropDownList(),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}