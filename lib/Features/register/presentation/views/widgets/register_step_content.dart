import 'package:flutter/material.dart';
import 'package:kafiil_app/Features/register/presentation/views/register_view.dart';
import 'package:kafiil_app/core/utils/constants.dart';
import 'package:kafiil_app/features/register/presentation/views/widgets/custom_drop_down_list.dart';
import 'package:kafiil_app/core/shared_components/custom_text_form_field.dart';

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
                  fieldName: 'First Name',
                  controller: firstNameController,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: CustomTextFormField(
                  fieldName: 'Last Name',
                  controller: lastNameController,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          CustomTextFormField(
            fieldName: 'Email Address',
            maxLength: 64,
            controller: emailAddressController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Email Address is required';
              }
              String pattern = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
              RegExp regex = RegExp(pattern);
              if (!regex.hasMatch(value)) {
                return 'Invalid Email Address';
              }
              return null;
            },
          ),
          const SizedBox(height: 12),
          CustomTextFormField(
            fieldName: 'Password',
            controller: passwordController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Password is required';
              } else if (value.length < 8) {
                return 'Password must be at least 8 characters long';
              }
              return null;
            },
            suffixIcon: IconButton(
              icon: isPasswordSecure
                  ? const Icon(
                Icons.visibility_off_outlined,
                color: kGrey400Color,
              )
                  : const Icon(
                Icons.remove_red_eye_outlined,
                color: kGrey400Color,
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
            fieldName: 'Confirm Password',
            controller: passwordConfirmationController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Confirm Password is required';
              }
              if (value != passwordController.text) {
                return 'Password and Confirm Password do not match';
              }
              return null;
            },
            suffixIcon: IconButton(
              icon: isConfirmationPasswordSecure
                  ? const Icon(
                Icons.visibility_off_outlined,
                color: kGrey400Color,
              )
                  : const Icon(
                Icons.remove_red_eye_outlined,
                color: kGrey400Color,
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