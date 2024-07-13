import 'package:flutter/material.dart';
import 'package:kafiil_app/core/utils/constants.dart';
import 'package:kafiil_app/features/register/presentation/views/widgets/custom_drop_down_list.dart';
import 'package:kafiil_app/core/shared_components/custom_text_form_field.dart';

class RegisterStepContent extends StatefulWidget{
  final Key formKey;

  const RegisterStepContent({super.key, required this.formKey});

  @override
  State<RegisterStepContent> createState() => _RegisterStepContentState();
}

class _RegisterStepContentState extends State<RegisterStepContent> {
  TextEditingController firstNameController=TextEditingController();

  TextEditingController lastNameController=TextEditingController();

  TextEditingController emailAddressController=TextEditingController();

  TextEditingController passwordController=TextEditingController();

  TextEditingController confirmationPasswordController=TextEditingController();

  bool isSecure = true;

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
                  )),
              const SizedBox(width: 16),
              Expanded(
                  child: CustomTextFormField(
                    fieldName: 'Last Name',
                    controller: lastNameController,
                  )),
            ],
          ),
          const SizedBox(
            height: 12,
          ),
          CustomTextFormField(
            fieldName: 'Email Address',
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
          const SizedBox(
            height: 12,
          ),
          CustomTextFormField(
            fieldName: 'Password',
            controller: passwordController,
            suffixIcon: IconButton(
              icon: isSecure
                  ? const Icon(Icons.visibility_off_outlined,
                color: kGrey400Color,
              )
                  : const Icon(Icons.remove_red_eye_outlined,
                color: kGrey400Color,
              ),
              onPressed: () {
                setState(() {
                  isSecure = !isSecure;
                });
              },
            ),
            obscureText: isSecure,
          ),
          const SizedBox(
            height: 12,
          ),
          CustomTextFormField(
            controller: confirmationPasswordController,
            fieldName: 'Confirm Password',
            validator: (value) {
              if (value!.isEmpty) {
                return 'Confirm Password is required';
              }
              if(value!=passwordController.text){
                return 'Password and Confirm Password do not match';
              }
              return null;
            },
            suffixIcon: IconButton(
              icon: isSecure
                  ? const Icon(Icons.visibility_off_outlined,
                color: kGrey400Color,
              )
                  : const Icon(Icons.remove_red_eye_outlined,
                color: kGrey400Color,
              ),
              onPressed: () {
                setState(() {
                  isSecure = !isSecure;
                });
              },
            ),
            obscureText: isSecure,
          ),
          const SizedBox(
            height: 12,
          ),
          const CustomDropDownList(),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}