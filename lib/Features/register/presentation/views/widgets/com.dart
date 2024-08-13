import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:kafiil_app/core/models/dependencies_model.dart';
import 'package:kafiil_app/core/repos/dependencies_repo.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:kafiil_app/core/utils/assets_app.dart';
import 'package:kafiil_app/core/shared_components/custom_text_form_field.dart';
import 'package:kafiil_app/core/utils/constants.dart';
import 'package:kafiil_app/core/utils/styles_app.dart';
import 'package:kafiil_app/features/register/presentation/views/widgets/add_new_image.dart';
import 'package:kafiil_app/features/register/presentation/views/widgets/clickable_container.dart';
import 'package:kafiil_app/features/register/presentation/views/widgets/custom_floating_action_button.dart';
import 'package:http/http.dart' as http;

class CompleteDataStepContent extends StatefulWidget {
  const CompleteDataStepContent({super.key});

  @override
  State<CompleteDataStepContent> createState() =>
      _CompleteDataStepContentState();
}

class _CompleteDataStepContentState extends State<CompleteDataStepContent> {
  int counter = 100;
  String gender = 'Male';
  TextEditingController birthdateController = TextEditingController();
  bool isFacebookSelected = false;
  bool isTwitterSelected = false;
  bool isLinkedInSelected = false;
  List<String> selectedSkills = [];

  late DependenciesRepoImpl dependenciesRepo;
  DependenciesModel? dependencies;
  bool isLoading = true;
  String? errorMessage;

  @override
  void initState() {
    super.initState();
    dependenciesRepo = DependenciesRepoImpl(
      apiUrl: 'https://test.kafiil.com/api/test/dependencies',
      httpClient: http.Client(),
    );
    _fetchDependencies();
  }

  Future<void> _fetchDependencies() async {
    try {
      final result = await dependenciesRepo.fetchDependencies();
      setState(() {
        dependencies = result;
        isLoading = false;
      });
    } catch (error) {
      setState(() {
        errorMessage = error.toString();
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Center(child: CircularProgressIndicator());
    }

    if (errorMessage != null) {
      return Center(child: Text('Error: $errorMessage'));
    }

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
              return 'About is required';
            } else if (value.length < 10) {
              return 'About must be at least 10 characters long';
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
                          if (counter < 1000) {
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
                  onTap: () {
                    setState(() {
                      gender = 'Male';
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
                  onTap: () {
                    setState(() {
                      gender = 'Female';
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
            MultiSelectChipDisplay(
              items: dependencies!.tags
                  .map((skill) => MultiSelectItem<TagModel>(skill, skill.label))
                  .toList(),
              onTap: (value) {
                setState(() {
                  if (selectedSkills.contains(value)) {
                    selectedSkills.remove(value);
                  } else {
                    selectedSkills.add(value.label);
                  }
                });
              },
              chipColor: kPrimary100Color,
              textStyle: StylesApp.styleMedium14(context),
            ),
          ],
        ),
      ],
    );
  }
}
