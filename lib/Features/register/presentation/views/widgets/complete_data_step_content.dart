import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:kafiil_app/Features/register/data/models/register_model.dart';
import 'package:kafiil_app/Features/register/data/repos/register_repo_impl.dart';
import 'package:kafiil_app/Features/register/presentation/manager/register_cubit/register_cubit.dart';
import 'package:kafiil_app/Features/register/presentation/manager/register_cubit/register_state.dart';
import 'package:kafiil_app/Features/register/presentation/views/register_view.dart';
import 'package:kafiil_app/Features/register/presentation/views/widgets/add_avatar.dart';
import 'package:kafiil_app/Features/register/presentation/views/widgets/favourite_social_media_section.dart';
import 'package:kafiil_app/Features/register/presentation/views/widgets/gender_section.dart';
import 'package:kafiil_app/Features/register/presentation/views/widgets/salary_section.dart';
import 'package:kafiil_app/Features/register/presentation/views/widgets/skills_section.dart';
import 'package:kafiil_app/core/constants/app_assets.dart';
import 'package:kafiil_app/core/constants/app_strings.dart';
import 'package:kafiil_app/core/theme/app_colors.dart';
import 'package:kafiil_app/core/utils/helpers/functions/custom_snack_bar.dart';
import 'package:kafiil_app/core/utils/widgets/custom_text_button.dart';
import 'package:kafiil_app/core/utils/widgets/custom_text_form_field.dart';
import 'package:kafiil_app/core/theme/app_styles.dart';


class CompleteDataStepContent extends StatefulWidget {
  const CompleteDataStepContent({super.key});

  @override
  State<CompleteDataStepContent> createState() => _CompleteDataStepContentState();
}

class _CompleteDataStepContentState extends State<CompleteDataStepContent> {
  final GlobalKey<FormState> _formKey2 = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    return Form(
      key: _formKey2,
      child: Column(
        children: [
          const AddAvatar(),
          const SizedBox(height: 12),
          CustomTextFormField(
            fieldName: AppStrings.about,
            minLines: 4,
            controller: aboutController,
            maxLength: 1000,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return AppStrings.aboutIsRequired;
              } else if (value.length < 10) {
                return AppStrings.aboutLength;
              }
              return null;
            },
            maxLines: 4,
          ),
          const SizedBox(height: 12),
          const SalarySection(),
          const SizedBox(height: 12),
          CustomTextFormField(
            fieldName: AppStrings.birthDate,
            controller: birthdateController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return AppStrings.birthdateIsRequired;
              }
              final selectedDate = DateTime.parse(value);
              final today = DateTime.now();
              if (selectedDate.year == today.year &&
                  selectedDate.month == today.month &&
                  selectedDate.day == today.day) {
                return AppStrings.birthdateCanNotBeToday;
              }
              return null;
            },
            onTap: () async {
              DateTime? pickedDate = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(1900),
                lastDate: DateTime.now(),
              );
              if (pickedDate != null && pickedDate != DateTime.now()) {
                setState(() {
                  birthdateController.text = DateFormat('yyyy-MM-dd').format(pickedDate);
                });
              }
            },
            suffixIcon: Padding(
              padding: const EdgeInsets.all(12.0),
              child: SvgPicture.asset(AppAssets.calendarIcon),
            ),
            readOnly: true,
          ),
          const SizedBox(height: 12.0),
          const GenderSection(),
          const SizedBox(height: 12.0),
          const SkillsSection2(),
          const SizedBox(height: 12.0),
          const FavouriteSocialMediaSection(),
          const SizedBox(height: 30),
          BlocProvider(
            create: (context) => RegisterCubit(RegisterRepoImpl()),
            child: BlocConsumer<RegisterCubit, RegisterState>(
              builder: (context, state) {
                if (state is RegisterLoadingState){
                  return Center(
                    child: SizedBox(
                      height: MediaQuery.sizeOf(context).height * 0.09,
                      width: double.infinity,
                      child: const CustomTextButton(
                        child: CircularProgressIndicator(
                          color: AppColors.kBackgroundColor,
                        )
                      ),
                    ),
                  );
                }
                else if(state is RegisterSuccessState){
                  return Center(
                    child: SizedBox(
                      height: MediaQuery.sizeOf(context).height * 0.09,
                      width: double.infinity,
                      child: const CustomTextButton(
                        text: AppStrings.submitButton,
                      ),
                    ),
                  );
                }
                else{
                  return Center(
                    child: SizedBox(
                      height: MediaQuery.sizeOf(context).height * 0.09,
                      width: double.infinity,
                      child: CustomTextButton(
                        text: AppStrings.submitButton,
                        onPressed: () {
                          if (_formKey2.currentState!.validate()) {
                           RegisterModel registerModel;
                            registerModel = RegisterModel(
                              firstName: firstNameController.text,
                              lastName: lastNameController.text,
                              about: aboutController.text,
                              tags: tags,
                              favoriteSocialMedia: favouriteSocialMedia,
                              salary: counter,
                              password: passwordController.text,
                              email: emailAddressController.text,
                              birthDate: birthdateController.text,
                              type: userTypeValue,
                              gender: gender,
                              passwordConfirmation: passwordConfirmationController.text,
                              avatar: avatar,
                            );

                            print(registerModel.firstName);
                            print(registerModel.lastName);
                            print(registerModel.email);
                            print(registerModel.password);
                            print(registerModel.passwordConfirmation);
                            print(registerModel.type);
                            print(registerModel.about);
                            print(registerModel.salary);
                            print(registerModel.birthDate);
                            print(registerModel.favoriteSocialMedia);
                            print(registerModel.tags);
                            print(registerModel.gender);
                            BlocProvider.of<RegisterCubit>(context)
                                .registerUser(registerModel);

                          } else {
                            customSnackBar(context, AppStrings.fillRequiredFields);
                          }
                        },
                      ),
                    ),
                  );
                }
              },
              listener: (context, state) {
                if (state is RegisterLoadingState) {}
                else if (state is RegisterSuccessState) {
                  customSnackBar(context, AppStrings.registrationComplete, icon: Icons.check_circle, iconColor: AppColors.kPrimary900Color, textStyle: AppStyles.styleSemiBold14(context).copyWith(color: Colors.greenAccent));
                  GoRouter.of(context).pop();
                } else if (state is RegisterFailureState) {
                  customSnackBar(context,state.errorMessage.toString(),iconColor: Colors.red, icon: FontAwesomeIcons.exclamation, customDuration:3);
                }
                else{

                }
              },
            ),
          )
        ],
      ),
    );
  }
}
