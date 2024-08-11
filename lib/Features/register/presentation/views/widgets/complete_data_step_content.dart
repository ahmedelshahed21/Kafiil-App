import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:kafiil_app/Features/register/presentation/views/register_view.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:kafiil_app/core/utils/assets_app.dart';
import 'package:kafiil_app/core/shared_components/custom_text_form_field.dart';
import 'package:kafiil_app/core/utils/constants.dart';
import 'package:kafiil_app/core/utils/styles_app.dart';
import 'package:kafiil_app/features/register/presentation/views/widgets/add_new_image.dart';
import 'package:kafiil_app/features/register/presentation/views/widgets/clickable_container.dart';
import 'package:kafiil_app/features/register/presentation/views/widgets/custom_floating_action_button.dart';

class CompleteDataStepContent extends StatefulWidget {
  const CompleteDataStepContent({super.key});

  @override
  State<CompleteDataStepContent> createState() =>
      _CompleteDataStepContentState();
}

int counter = 100;

class _CompleteDataStepContentState extends State<CompleteDataStepContent> {


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const AddNewImage(),
        const SizedBox(height: 12),
        CustomTextFormField(
          fieldName: 'About',
          minLines: 4,
          maxLength: 1000,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Password is required';
            }
            else if(value.length<10) {
              return 'Password must be at least 8 characters long';
            }
            return null;
          },
          maxLines: 4,
        ),
        const SizedBox(height: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Salary',
              style: StylesApp.styleMedium12(context),
            ),
            const SizedBox(height: 5),
            ClickableContainer(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CustomFloatingActionButton(
                      onPressed: () {
                        setState(() {
                          if (counter > 100) {
                            counter -= 100;
                          }
                        });
                      },
                      child: const Icon(
                        FontAwesomeIcons.minus,
                        color: kPrimary900Color,
                        size: 20,
                      )),
                  Text(
                    'SAR $counter',
                    style: StylesApp.styleMedium16(context).copyWith(
                      color: kGrey800Color,
                    ),
                  ),
                  CustomFloatingActionButton(
                      onPressed: () {
                        setState(() {
                          if(counter<1000){
                            counter += 100;
                          }
                        });
                      },
                      child: const Icon(
                        FontAwesomeIcons.plus,
                        color: kPrimary900Color,
                        size: 20,
                      )),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        CustomTextFormField(
          fieldName: 'Birth Date',
          controller: birthdateController,
          onTap: () async {
            DateTime? pickedDate = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(1900),
              lastDate: DateTime.now(),
            );
            if (pickedDate != null) {
              setState(() {
                birthdateController.text =
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
                          value: 'Male',
                          groupValue: gender,
                          onChanged: (value) {
                            setState(() {
                              gender = value!;
                            });
                          }),
                      Text(
                        'Male',
                        style: StylesApp.styleMedium16(context),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    setState(() {
                      gender='Female';
                    });
                  },
                  child: Row(
                    children: [
                      Radio(
                          value: 'Female',
                          groupValue: gender,
                          onChanged: (value) {
                            setState(() {
                              gender = value!;
                            });
                          }),
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
            const SizedBox(
              height: 12,
            ),
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
                      style: StylesApp.styleMedium16(context).copyWith(
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
                      textStyle: StylesApp.styleMedium12(context)
                          .copyWith(color: kPrimary900Color),
                      // Set the text color here
                      onTap: (value) {
                        setState(() {
                          selectedSkills.remove(value);
                        });
                      },
                    ),
                    initialValue: const ["Flutter", "Dart"],
                    itemsTextStyle: StylesApp.styleMedium12(context)
                        .copyWith(color: kPrimary900Color),
                    selectedItemsTextStyle: StylesApp.styleMedium12(context)
                        .copyWith(color: kPrimary900Color),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.transparent),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 30),
      ],
    );
  }
}