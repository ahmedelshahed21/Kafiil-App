import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:kafiil_app/Features/home/presentation/manager/who_am_i_cubit/who_am_i_cubit.dart';
import 'package:kafiil_app/Features/home/presentation/manager/who_am_i_cubit/who_am_i_state.dart';
import 'package:kafiil_app/core/shared_components/custom_text_form_field.dart';
import 'package:kafiil_app/core/utils/assets_app.dart';
import 'package:kafiil_app/core/utils/constants.dart';
import 'package:kafiil_app/core/utils/styles_app.dart';
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
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Who Am I',
                  style: StylesApp.styleSemiBold18(context),
                ),
                const SizedBox(height: 30),
                BlocBuilder<WhoAmICubit, WhoAmIState>(
                  builder: (context, state) {
                    if (state is WhoAmILoading) {
                      return const Column(
                        children: [
                          Center(child: CircularProgressIndicator()),
                        ],
                      );
                    } else if (state is WhoAmISuccess) {
                      var whoAmI = state.whoAmI;
                      int gender = whoAmI.gender;

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
                      String userType = whoAmI.type.name;

                      return Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(child: AddNewImage(image: whoAmI.avatar)),
                          const SizedBox(height: 30),
                          Row(
                            children: [
                              Expanded(
                                child: CustomTextFormField(
                                  fieldName: 'First Name',
                                  initialValue: whoAmI.firstName,
                                  validator: (v) {
                                    return null;
                                  },
                                ),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: CustomTextFormField(
                                  fieldName: 'Last Name',
                                  initialValue: whoAmI.lastName,
                                  validator: (v) {
                                    return null;
                                  },
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          CustomTextFormField(
                            fieldName: 'Email Address',
                            initialValue: whoAmI.email,
                            maxLength: 240,
                            validator: (v) {
                              return null;
                            },
                          ),
                          const SizedBox(height: 12),
                          CustomTextFormField(
                            fieldName: 'Password',
                            initialValue: '01068192572',
                            suffixIcon: IconButton(
                              icon: isSecure
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
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Text(
                              'User Type',
                              style: StylesApp.styleMedium12(context),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Radio(
                                activeColor: kPrimary900Color,
                                value: 'seller',
                                groupValue: userType,
                                onChanged: (value) {
                                  setState(() {
                                    userType = value!;
                                  });
                                },
                              ),
                              Text(
                                'seller',
                                style: StylesApp.styleMedium16(context),
                              ),
                              const SizedBox(width: 10),
                              Radio(
                                activeColor: kPrimary900Color,
                                value: 'buyer',
                                groupValue: userType,
                                onChanged: (value) {
                                  setState(() {
                                    userType = value!;
                                  });
                                },
                              ),
                              Text(
                                'buyer',
                                style: StylesApp.styleMedium16(context),
                              ),
                              const SizedBox(width: 10),
                              Radio(
                                activeColor: kPrimary900Color,
                                value: 'both',
                                groupValue: userType,
                                onChanged: (value) {
                                  setState(() {
                                    userType = value!;
                                  });
                                },
                              ),
                              Text(
                                'both',
                                style: StylesApp.styleMedium16(context),
                              ),
                            ],
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
                            fieldName: 'Salary',
                            prefix: const Text('SAR '),
                            validator: (v) {
                              return null;
                            },
                            initialValue: whoAmI.salary.toString(),
                            contentPadding: const EdgeInsets.only(left: 40, top: 18, bottom: 18),
                          ),
                          const SizedBox(height: 12),
                          CustomTextFormField(
                            fieldName: 'Birth Date',
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
                              child: SvgPicture.asset(ImagesApp.calendarIcon),
                            ),
                            readOnly: true,
                          ),
                          const SizedBox(height: 12.0),
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Text(
                              'Gender',
                              style: StylesApp.styleMedium12(context),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Radio(
                                activeColor: kPrimary900Color,
                                value: 0,
                                groupValue: gender,
                                onChanged: (value) {
                                  setState(() {
                                    gender = value!;
                                  });
                                },
                              ),
                              Text(
                                'Male',
                                style: StylesApp.styleMedium16(context),
                              ),
                              const SizedBox(width: 10),
                              Radio(
                                activeColor: kPrimary900Color,
                                value: 1,
                                groupValue: gender,
                                onChanged: (value) {
                                  setState(() {
                                    gender = value!;
                                  });
                                },
                              ),
                              Text(
                                'Female',
                                style: StylesApp.styleMedium16(context),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12.0),
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Text(
                              'Skills',
                              style: StylesApp.styleMedium12(context),
                            ),
                          ),
                          const SizedBox(height: 12.0),
                          Container(
                            width: MediaQuery.sizeOf(context).width,
                            decoration: BoxDecoration(
                              color: kGrey50Color,
                              borderRadius: BorderRadius.circular(16)
                            ),
                            padding: const EdgeInsets.only(top: 12,bottom: 48,left: 6.0,right: 6.0),
                            child: Wrap(
                              spacing: 8.0,
                              runSpacing: 8.0,
                              children: [
                                for (var skill in state.whoAmI.tags)
                                  Chip(
                                    label: Text(skill.name),
                                    side: const BorderSide(
                                      width: 1.3,
                                      color: kPrimary100Color
                                    ),
                                    onDeleted: (){
                                      setState(() {
                                        whoAmI.tags.remove(skill);
                                      });
                                    },
                                    deleteIcon: const Icon(FontAwesomeIcons.xmark,
                                      size: 18,
                                    ),
                                    deleteIconColor: kPrimary900Color,
                                    backgroundColor: kPrimary100Color,
                                    labelStyle: StylesApp.styleMedium12(context).copyWith(
                                      color: kPrimary900Color,
                                    ),
                                  ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 12.0),
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Text(
                              'Favourite Social Media',
                              style: StylesApp.styleMedium12(context),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                isFacebookSelected = !isFacebookSelected;
                              });
                            },
                            child: Container(
                              color: Colors.transparent,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Checkbox(
                                    activeColor: kPrimary900Color,
                                    value: isFacebookSelected,
                                    onChanged: (value) {
                                      setState(() {
                                        isFacebookSelected = value!;
                                      });
                                    },
                                  ),
                                  const Icon(FontAwesomeIcons.facebook,
                                    color: Colors.blueAccent,
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    'Facebook',
                                    style: StylesApp.styleMedium16(context),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                isXSelected = !isXSelected;
                              });
                            },
                            child: Container(
                              color: Colors.transparent,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Checkbox(
                                    activeColor: kPrimary900Color,
                                    value: isXSelected,
                                    onChanged: (value) {
                                      setState(() {
                                        isXSelected = value!;
                                      });
                                    },
                                  ),
                                  const Icon(FontAwesomeIcons.x,color: Colors.black,),
                                  const SizedBox(width: 8),
                                  Text(
                                    'X',
                                    style: StylesApp.styleMedium16(context),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                isInstagramSelected = !isInstagramSelected;
                              });
                            },
                            child: Container(
                              color: Colors.transparent,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Checkbox(
                                    activeColor: kPrimary900Color,
                                    value: isInstagramSelected,
                                    onChanged: (value) {
                                      setState(() {
                                        isInstagramSelected = value!;
                                      });
                                    },
                                  ),
                                  const Icon(FontAwesomeIcons.instagram,
                                    color: Colors.redAccent,
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    'Instagram',
                                    style: StylesApp.styleMedium16(context),
                                  ),
                                ],
                              ),
                            ),
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
