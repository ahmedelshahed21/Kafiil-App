import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:kafiil_app/Features/home/presentation/manager/who_am_i_cubit/who_am_i_cubit.dart';
import 'package:kafiil_app/Features/home/presentation/manager/who_am_i_cubit/who_am_i_state.dart';
import 'package:kafiil_app/Features/home/presentation/views/widgets/favourite_social_media_section.dart';
import 'package:kafiil_app/Features/home/presentation/views/widgets/gender_section.dart';
import 'package:kafiil_app/Features/home/presentation/views/widgets/name_section.dart';
import 'package:kafiil_app/Features/home/presentation/views/widgets/skills_section.dart';
import 'package:kafiil_app/Features/home/presentation/views/widgets/user_type_section.dart';
import 'package:kafiil_app/Features/home/presentation/views/widgets/who_am_i_loading_effect.dart';
import 'package:kafiil_app/core/constants/app_assets.dart';
import 'package:kafiil_app/core/constants/app_strings.dart';
import 'package:kafiil_app/core/theme/app_colors.dart';
import 'package:kafiil_app/core/theme/app_styles.dart';
import 'package:kafiil_app/core/utils/widgets/custom_text_form_field.dart';
import 'package:kafiil_app/features/register/presentation/views/widgets/add_new_image.dart';

class WhoAmIView extends StatefulWidget {
  const WhoAmIView({super.key});

  @override
  State<WhoAmIView> createState() => _WhoAmIViewState();
}

class _WhoAmIViewState extends State<WhoAmIView> {
  final TextEditingController _birthdateController = TextEditingController();
  bool isFacebookSelected = false;
  bool isXSelected = false;
  bool isInstagramSelected = false;
  bool isSecure = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Container(
          color: AppColors.kBackgroundColor,
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppStrings.whoAmI,
                  style: AppStyles.styleSemiBold18(context),
                ),
                const SizedBox(height: 30),
                BlocBuilder<WhoAmICubit, WhoAmIState>(
                  builder: (context, state) {
                    if (state is WhoAmILoading) {
                      return const WhoAmILoadingEffect();
                    } else if (state is WhoAmISuccess) {
                      var whoAmI = state.whoAmI;
                      int gender = whoAmI.gender;
                      String userType = whoAmI.type.name;
                      for (int i = 0; i < state.whoAmI.favoriteSocialMedia.length; i++) {
                        if (state.whoAmI.favoriteSocialMedia[i] == 'x') {
                          isXSelected = true;
                        }
                        if (state.whoAmI.favoriteSocialMedia[i] == 'facebook') {
                          isFacebookSelected = true;
                        }
                        if (state.whoAmI.favoriteSocialMedia[i] == 'instagram') {
                          isInstagramSelected = true;
                        }
                      }
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(child: AddNewImage(image: whoAmI.avatar)),
                          const SizedBox(height: 30),
                          NameSection(
                            firstNameInitialValue: whoAmI.firstName,
                            lastNameInitialValue: whoAmI.lastName,
                          ),
                          const SizedBox(height: 12),
                          CustomTextFormField(
                            fieldName: AppStrings.email,
                            initialValue: whoAmI.email,
                            maxLength: 240,
                            validator: (v) {
                              return null;
                            },
                          ),
                          const SizedBox(height: 12),
                          CustomTextFormField(
                            fieldName: AppStrings.password,
                            initialValue: '01068192572',
                            suffixIcon: IconButton(
                              icon: isSecure
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
                                  isSecure = !isSecure;
                                });
                              },
                            ),
                            obscureText: isSecure,
                            validator: (v) {
                              return null;
                            },
                          ),
                          const SizedBox(height: 12),
                          UserTypeSection(
                            userType: userType,
                            userTypeOnChanged: (value){
                                userType=value!;
                            },
                          ),
                          const SizedBox(height: 12),
                          CustomTextFormField(
                            fieldName: 'About',
                            initialValue: whoAmI.about,
                            minLines: 4,
                            maxLength: 1200,
                            validator: (v) {
                              return null;
                            },
                            maxLines: 4,
                          ),
                          const SizedBox(height: 12),
                          CustomTextFormField(
                            fieldName: AppStrings.salary,
                            prefix: const Text('SAR '),
                            validator: (v) {
                              return null;
                            },
                            initialValue: whoAmI.salary.toString(),
                            contentPadding: const EdgeInsets.only(left: 40, top: 18, bottom: 18),
                          ),
                          const SizedBox(height: 12),
                          CustomTextFormField(
                            fieldName: AppStrings.birthDate,
                            hintText: whoAmI.birthDate,
                            controller: _birthdateController,
                            onTap: () async {
                              DateTime? pickedDate = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(1900),
                                lastDate: DateTime.now(),
                              );
                              if (pickedDate != null) {
                                setState(() {
                                  _birthdateController.text = DateFormat('yyyy-MM-dd').format(pickedDate);
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
                          GenderSection(
                            gender: gender,
                            genderOnChange: (value){
                              gender=value!;
                            },
                          ),
                          const SizedBox(height: 12.0),
                          SkillsSection(skills: state.whoAmI.tags),
                          const SizedBox(height: 12.0),
                          FavouriteSocialMediaSection(
                              isFacebookSelected: isFacebookSelected,
                              isXSelected: isXSelected,
                              isInstagramSelected: isInstagramSelected,
                            onChange: (value){
                                isFacebookSelected=value!;
                                isXSelected=value;
                                isInstagramSelected=value;
                            },
                          ),
                          const SizedBox(height: 50),
                        ],
                      );
                    } else if (state is WhoAmIFailure) {
                      return const Center(
                        child: Text('Error'),
                      );
                    } else {
                      return const SizedBox.shrink();
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


