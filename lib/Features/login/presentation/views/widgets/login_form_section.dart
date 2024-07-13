import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kafiil_app/core/shared_components/custom_text_button.dart';
import 'package:kafiil_app/core/shared_components/custom_text_form_field.dart';
import 'package:kafiil_app/core/utils/app_router.dart';
import 'package:kafiil_app/core/utils/constants.dart';
import 'package:kafiil_app/core/utils/styles_app.dart';

class LoginFormSection extends StatefulWidget {
  const LoginFormSection({super.key});

  @override
  State<LoginFormSection> createState() => _LoginFormSectionState();
}

class _LoginFormSectionState extends State<LoginFormSection> {
  bool isSecure=true;
  bool isSelected=true;
  static final GlobalKey<FormState> formKey=GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          CustomTextFormField(
            fieldName: 'Email Address',
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
            obscureText: isSecure,
            suffixIcon: IconButton(
              icon: isSecure
                  ? const Icon(Icons.visibility_off_outlined)
                  : const Icon(Icons.remove_red_eye_outlined),
              onPressed: () {
                setState(() {
                  isSecure = !isSecure;
                });
              },
            ),
            fieldName: 'Password',
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Checkbox(
                      activeColor: kPrimary900Color,
                      value: isSelected,
                      onChanged: (value){
                        setState(() {
                          isSelected=value!;
                        });
                      }
                  ),
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        isSelected=!isSelected;
                      });

                    },
                    child: Text('Remember me',
                      style: StylesApp.styleMedium12(context),
                    ),
                  ),
                ],
              ),
              Text('Forgot Password?',
                style: StylesApp.styleMedium12(context),
              ),
            ],
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.09,
            width: double.infinity,
            child: CustomTextButton(
              text: 'Login',
              onPressed: () {
                if(formKey.currentState!.validate()){
                  GoRouter.of(context).pushReplacement(AppRouter.kHomeView);
                }
              },
            ),
          ),
          const SizedBox(height: 12),
        ],
      ),
    );
  }
}