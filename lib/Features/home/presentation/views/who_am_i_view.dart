import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:kafiil_app/core/shared_components/custom_text_form_field.dart';
import 'package:kafiil_app/core/utils/assets_app.dart';
import 'package:kafiil_app/core/utils/constants.dart';
import 'package:kafiil_app/core/utils/styles_app.dart';
import 'package:kafiil_app/features/register/presentation/views/widgets/clickable_container.dart';
import 'package:kafiil_app/features/register/presentation/views/widgets/add_new_image.dart';
import 'package:multi_select_flutter/chip_display/multi_select_chip_display.dart';
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';

class WhoAmIView extends StatefulWidget {
  const WhoAmIView({super.key});

  @override
  State<WhoAmIView> createState() => _WhoAmIViewState();
}

class _WhoAmIViewState extends State<WhoAmIView> {
  final TextEditingController _birthdateController = TextEditingController();
  String gender = 'Male';
  String userType = 'Seller';
  bool isFacebookSelected = true;
  bool isTwitterSelected = false;
  bool isLinkedInSelected = false;
  List<String> selectedSkills = [];
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
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Who Am I',
                  style: StylesApp.styleSemiBold18(context),
                ),
                const SizedBox(height: 30),
                const Center(
                    child: AddNewImage(
                        image: ImagesApp.whoAmIImage)),
                const SizedBox(height: 30),
                Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: CustomTextFormField(
                            fieldName: 'First Name',
                            initialValue: 'Ahmed',
                            validator: (v) {
                              return null;
                            },
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: CustomTextFormField(
                            fieldName: 'Last Name',
                            initialValue: 'El-Shahed',
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
                      initialValue: 'ahmed.elshahed.pro@gmail.com',
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
                      validator: (v) {
                        return null;
                      },
                    ),
                    const SizedBox(height: 12),
                  ],
                ),
                Column(
                  children: [
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
                        GestureDetector(
                          onTap: (){
                            setState(() {
                              userType='Seller';
                            });
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Radio(
                                activeColor: kPrimary900Color,
                                value: 'Seller',
                                groupValue: userType,
                                onChanged: (value) {
                                  setState(() {
                                    userType = value!;
                                  });
                                },
                              ),
                              Text(
                                'Seller',
                                style: StylesApp.styleMedium16(context),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 10),
                        GestureDetector(
                          onTap: (){
                            setState(() {
                              userType='Buyer';
                            });

                          },
                          child: Row(
                            children: [
                              Radio(
                                activeColor: kPrimary900Color,
                                value: 'Buyer',
                                groupValue: userType,
                                onChanged: (value) {
                                  setState(() {
                                    userType = value!;
                                  });
                                },
                              ),
                              Text(
                                'Buyer',
                                style: StylesApp.styleMedium16(context),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 10),
                        GestureDetector(
                          onTap: (){
                            setState(() {
                              userType='Both';
                            });
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Radio(
                                activeColor: kPrimary900Color,
                                value: 'Both',
                                groupValue: userType,
                                onChanged: (value) {
                                  setState(() {
                                    userType = value!;
                                  });
                                },
                              ),
                              Text(
                                'Both',
                                style: StylesApp.styleMedium16(context),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  children: [
                    const SizedBox(height: 12),
                    CustomTextFormField(
                      fieldName: 'About',
                      initialValue:
                          'Lorem ipsum dolor sit amet consectetur. Odio urna sed velit et sed quis. Enim ut sed. sed quis. Enim ut sed.',
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
                      initialValue: '4500',
                      contentPadding:
                          const EdgeInsets.only(left: 40, top: 18, bottom: 18),
                    ),
                    const SizedBox(height: 12),
                    CustomTextFormField(
                      fieldName: 'Birth Date',
                      hintText: '2001-01-02',
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
                            _birthdateController.text =
                                DateFormat('yyyy-MM-dd').format(pickedDate);
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
                    Column(
                      children: [
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
                            GestureDetector(
                              onTap: (){
                                setState(() {
                                  gender='Male';
                                });
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Radio(
                                    activeColor: kPrimary900Color,
                                    value: 'Male',
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
                                ],
                              ),
                            ),
                            const SizedBox(width: 10),
                            GestureDetector(
                              onTap: (){
                                setState(() {
                                  gender='Female';
                                });
                              },
                              child: Row(
                                children: [
                                  Radio(
                                    activeColor: kPrimary900Color,
                                    value: 'Female',
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
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 12.0),
                    Column(
                      children: [
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            'Skills',
                            style: StylesApp.styleMedium12(context),
                          ),
                        ),
                        const SizedBox(height: 12),
                        ClickableContainer(
                          child: Column(
                            children: [
                              MultiSelectDialogField(
                                buttonIcon: const Icon(
                                  Icons.account_circle_sharp,
                                  color: kGrey50Color,
                                ),
                                backgroundColor: kPrimary100Color,
                                selectedColor: kPrimary900Color,
                                title: const Text("Skills"),
                                buttonText: Text(
                                  "Select",
                                  style:
                                      StylesApp.styleMedium16(context).copyWith(
                                    color: kGrey50Color,
                                  ),
                                ),
                                items: [
                                  MultiSelectItem("Flutter", "Flutter"),
                                  MultiSelectItem("Dart", "Dart"),
                                  MultiSelectItem("Python", "Python"),
                                  MultiSelectItem("Java", "Java"),
                                  MultiSelectItem("Video Production", "Video Production"),
                                ],
                                onConfirm: (values) {
                                  setState(() {
                                    selectedSkills = values.cast<String>();
                                  });
                                },
                                chipDisplay: MultiSelectChipDisplay(

                                  items: [
                                    MultiSelectItem("Flutter", "Flutter"),
                                    MultiSelectItem("Dart", "Dart"),
                                    MultiSelectItem("Python", "Python"),
                                    MultiSelectItem("Java", "Java"),
                                    MultiSelectItem("Video Production", "Video Production"),
                                  ],
                                  chipColor: kPrimary100Color,
                                  textStyle: StylesApp.styleMedium12(context).copyWith(color: kPrimary900Color),
                                  // Set the text color here
                                  onTap: (value) {
                                    setState(() {
                                      selectedSkills.remove(value);
                                    });
                                  },
                                ),
                                itemsTextStyle: StylesApp.styleMedium12(context).copyWith(color: kPrimary900Color),
                                selectedItemsTextStyle:StylesApp.styleMedium12(context).copyWith(color: kPrimary900Color),
                                initialValue: const ["Flutter","Dart"],
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.transparent),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12.0),
                    Column(
                      children: [
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
                                SvgPicture.asset(
                                  ImagesApp.facebookIcon,
                                  height: 24,
                                ),
                                const SizedBox(width: 5),
                                Text(
                                  'Facebook',
                                  style: StylesApp.styleMedium14(context),
                                ),
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isTwitterSelected = !isTwitterSelected;
                            });
                          },
                          child: Container(
                            color: Colors.transparent,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Checkbox(
                                  activeColor: kPrimary900Color,
                                  value: isTwitterSelected,
                                  onChanged: (value) {
                                    setState(() {
                                      isTwitterSelected = value!;
                                    });
                                  },
                                ),
                                SvgPicture.asset(
                                  ImagesApp.twitterIcon,
                                  height: 24,
                                ),
                                const SizedBox(width: 5),
                                Text(
                                  'Twitter',
                                  style: StylesApp.styleMedium14(context),
                                ),
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isLinkedInSelected = !isLinkedInSelected;
                            });
                          },
                          child: Container(
                            color: Colors.transparent,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Checkbox(
                                  activeColor: kPrimary900Color,
                                  value: isLinkedInSelected,
                                  onChanged: (value) {
                                    setState(() {
                                      isLinkedInSelected = value!;
                                    });
                                  },
                                ),
                                const FaIcon(
                                  FontAwesomeIcons.linkedin,
                                  color: kLinkedInColor,
                                ),
                                const SizedBox(width: 5),
                                Text(
                                  'LinkedIn',
                                  style: StylesApp.styleMedium14(context),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
