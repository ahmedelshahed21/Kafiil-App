import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:kafiil_app/Features/register/data/models/register_model.dart';
import 'package:kafiil_app/Features/register/presentation/manager/register_cubit/register_cubit.dart';
import 'package:kafiil_app/Features/register/presentation/manager/register_cubit/register_state.dart';
import 'package:kafiil_app/Features/register/presentation/views/register_view.dart';
import 'package:kafiil_app/Features/register/presentation/views/widgets/add_avatar.dart';
import 'package:kafiil_app/core/functions/custom_snack_bar.dart';
import 'package:kafiil_app/core/models/dependencies_model.dart';
import 'package:kafiil_app/core/repos/dependencies_repo.dart';
import 'package:kafiil_app/core/shared_components/custom_text_button.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:kafiil_app/core/utils/assets_app.dart';
import 'package:kafiil_app/core/shared_components/custom_text_form_field.dart';
import 'package:kafiil_app/core/utils/constants.dart';
import 'package:kafiil_app/core/utils/styles_app.dart';
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
  late DependenciesRepoImpl dependenciesRepo;
  DependenciesModel? dependencies;
  bool isLoading = true;
  String? errorMessage;
  final GlobalKey<FormState> _formKey2 = GlobalKey<FormState>();

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

    List<MultiSelectItem<String>> skillItems = dependencies!.tags
        .map((tag) => MultiSelectItem<String>(tag.label, tag.label))
        .toList();

    return Form(
      key: _formKey2,
      child: Column(
        children: [
          const AddAvatar(),
          const SizedBox(height: 12),
          CustomTextFormField(
            fieldName: 'About',
            minLines: 4,
            controller: aboutController,
            maxLength: 1000,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'About is required';
              } else if (value.length < 10) {
                return 'About must be at least 8 characters long';
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
                        heroTag: 'minus',
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
                        heroTag: 'plus',
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
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'BirthDate is required';
              }
              final selectedDate = DateTime.parse(value);
              final today = DateTime.now();
              if (selectedDate.year == today.year &&
                  selectedDate.month == today.month &&
                  selectedDate.day == today.day) {
                return 'Birth date cannot be today';
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
                        gender = false;
                      });
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Radio(
                            value: false,
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
                        gender = true;
                      });
                    },
                    child: Row(
                      children: [
                        Radio(
                            value: true,
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
                      items: skillItems,
                      onConfirm: (values) {
                        setState(() {
                          selectedSkills = values.cast<String>();
                          print(selectedSkills);
                          print('1000000000000000000000000000');

                        });
                      },
                      chipDisplay: MultiSelectChipDisplay(
                        chipColor: kPrimary100Color,
                        textStyle: StylesApp.styleMedium12(context)
                            .copyWith(color: kPrimary900Color),
                        onTap: (value) {
                          setState(() {
                            selectedSkills.remove(value);
                          });
                        },
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Skills is required';
                        }
                        return null;
                      },
                      autovalidateMode: AutovalidateMode.onUserInteraction,
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
                    if (isFacebookSelected == true) {
                      isInstagramSelected=false;
                      isXSelected=false;
                      favouriteSocialMedia[0]='facebook';
                    }
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
                            if (isFacebookSelected == true) {
                              isInstagramSelected=false;
                              isXSelected=false;
                              favouriteSocialMedia[0]='facebook';
                            }
                          });
                        },
                      ),
                      const Icon(
                        FontAwesomeIcons.facebook,
                        color: Colors.blueAccent,
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
                    isXSelected=!isXSelected;
                    if (isXSelected == true) {
                      isInstagramSelected=false;
                      isFacebookSelected=false;
                      favouriteSocialMedia[0]='x';
                    }
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
                            if (isXSelected == true) {
                              isInstagramSelected=false;
                              isFacebookSelected=false;
                              favouriteSocialMedia[0]='x';
                            }
                          });
                        },
                      ),
                      const Icon(FontAwesomeIcons.x),
                      const SizedBox(width: 5),
                      Text(
                        'X',
                        style: StylesApp.styleMedium14(context),
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: (){
                  setState(() {
                    isInstagramSelected=!isInstagramSelected;
                    if (isInstagramSelected == true) {
                      isXSelected=false;
                      isFacebookSelected=false;
                      favouriteSocialMedia[0]='instagram';
                    }

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
                            if (isInstagramSelected == true) {
                              isXSelected=false;
                              isFacebookSelected=false;
                              favouriteSocialMedia[0]='instagram';
                            }
                          });
                        },
                      ),
                      const Icon(
                        FontAwesomeIcons.instagram,
                        color: Colors.redAccent,
                      ),
                      const SizedBox(width: 5),
                      Text(
                        'Instagram',
                        style: StylesApp.styleMedium14(context),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 30),
          BlocProvider(
            create: (context) => RegisterCubit(),
            child: BlocConsumer<RegisterCubit, RegisterState>(
              builder: (context, state) {
                if (state is RegisterLoadingState){
                  return Center(
                    child: SizedBox(
                      height: MediaQuery.sizeOf(context).height * 0.09,
                      width: double.infinity,
                      child: const CustomTextButton(
                        child: CircularProgressIndicator(
                          color: kBackgroundColor,
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
                        text: 'Submit',
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
                        text: 'Submit',
                        onPressed: () {
                          if (_formKey2.currentState!.validate()) {
                           if (dependencies != null) {
                             for (int i = 0; i < dependencies!.tags.length; i++) {
                               if (selectedSkills.contains(dependencies!.tags[i].label)) {
                                 tags.add(dependencies!.tags[i].value);
                               }
                             }
                           }
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
                            customSnackBar(context, 'Fill the required fields');
                          }
                        },
                      ),
                    ),
                  );
                }
              },
              listener: (context, state) {
                if (state is RegisterLoadingState) {
                  isLoading = true;
                } else if (state is RegisterSuccessState) {
                  isLoading = false;
                  GoRouter.of(context).pop();
                } else if (state is RegisterFailureState) {
                  isLoading = false;
                  customSnackBar(context, '${state.errorMessage.toString()}');
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
