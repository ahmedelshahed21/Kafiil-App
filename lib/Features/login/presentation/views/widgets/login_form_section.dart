import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kafiil_app/Features/login/presentation/manager/login_cubit/login_cubit.dart';
import 'package:kafiil_app/core/constants/app_strings.dart';
import 'package:kafiil_app/core/theme/app_colors.dart';
import 'package:kafiil_app/core/theme/app_styles.dart';
import 'package:kafiil_app/core/utils/helpers/functions/custom_snack_bar.dart';
import 'package:kafiil_app/core/utils/widgets/custom_text_button.dart';
import 'package:kafiil_app/core/utils/widgets/custom_text_form_field.dart';

class LoginFormSection extends StatefulWidget {
  const LoginFormSection({super.key});

  @override
  State<LoginFormSection> createState() => _LoginFormSectionState();
}

class _LoginFormSectionState extends State<LoginFormSection> {
  bool isSecure=true;
  bool isSelected=true;
  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  static final GlobalKey<FormState> formKey=GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          CustomTextFormField(
            fieldName: AppStrings.email,
            controller: emailController,
            maxLength: 64,
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
            obscureText: isSecure,
            controller: passwordController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return AppStrings.passwordIsRequired;
              }
              else if(value.length<8) {
                return AppStrings.passwordLength;
              }
              return null;
            },
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
            fieldName: AppStrings.password,

          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Checkbox(
                      activeColor: AppColors.kPrimary900Color,
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
                    child: Text(AppStrings.rememberMe,
                      style: AppStyles.styleMedium12(context),
                    ),
                  ),
                ],
              ),
              Text(AppStrings.forgotPassword,
                style: AppStyles.styleMedium12(context),
              ),
            ],
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.09,
            width: double.infinity,
            child: CustomTextButton(
              text: AppStrings.loginButton,
              onPressed: () {
                if(formKey.currentState!.validate()){
                  BlocProvider.of<LoginCubit>(context).loginUser(emailController.text, passwordController.text);
                }
                else{
                  customSnackBar(context, AppStrings.fillRequiredFields);
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