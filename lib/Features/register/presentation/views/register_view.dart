import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:kafiil_app/Features/register/data/models/register_model.dart';
import 'package:kafiil_app/Features/register/presentation/manager/register_cubit/register_cubit.dart';
import 'package:kafiil_app/Features/register/presentation/manager/register_cubit/register_state.dart';
import 'package:kafiil_app/core/functions/custom_snack_bar.dart';
import 'package:kafiil_app/core/shared_components/back_icon_button.dart';
import 'package:kafiil_app/core/shared_components/custom_text_button.dart';
import 'package:kafiil_app/core/utils/constants.dart';
import 'package:kafiil_app/features/register/presentation/views/widgets/complete_data_step_content.dart';
import 'package:kafiil_app/features/register/presentation/views/widgets/register_step_content.dart';
import 'package:kafiil_app/core/utils/styles_app.dart';
import 'package:kafiil_app/features/register/presentation/views/widgets/error_container.dart';

TextEditingController firstNameController=TextEditingController();
TextEditingController lastNameController=TextEditingController();
TextEditingController emailAddressController=TextEditingController();
TextEditingController passwordController=TextEditingController();
TextEditingController passwordConfirmationController=TextEditingController();
int userTypeValue=1;
TextEditingController aboutController=TextEditingController();
TextEditingController birthdateController = TextEditingController();
bool gender = false;
int counter = 100;
List<String> selectedSocialMedia = ['facebook'];
List<int> selectedSkills = [1];
bool isFacebookSelected = false;
bool isXSelected = false;
bool isInstagramSelected = false;
late RegisterModel registerModel;


class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  RegisterViewState createState() => RegisterViewState();
}

class RegisterViewState extends State<RegisterView> {


  int _currentStep = 0;
  final _formKey = GlobalKey<FormState>();
  final _formKey2 = GlobalKey<FormState>();
  String _errorMessage = '';


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        titleSpacing: -16,
        title: Text(
          'Register',
          style: StylesApp.styleSemiBold18(context),
        ),
        leading: BackIconButton(
          onPressed: () {
            if (_currentStep > 0) {
              setState(() {
                _currentStep -= 1;
              });
            } else {
              Navigator.pop(context);
            }
          },
        ),
      ),
      body: Column(
        children: [
          if (_errorMessage.isNotEmpty)
            ErrorContainer(errorMessage: _errorMessage),
          Expanded(
            child: Theme(
              data: ThemeData(
                colorScheme: const ColorScheme.light(
                  primary: kPrimary900Color,
                ),
              ),
              child: Stepper(
                physics: const BouncingScrollPhysics(),
                elevation: 0,
                type: StepperType.horizontal,
                currentStep: _currentStep,
                onStepContinue: () {
                  if (_currentStep < 1) {
                    if (_formKey.currentState!.validate()) {
                      setState(() {
                        _currentStep += 1;
                        _errorMessage = '';
                      });
                    } else {
                      setState(() {
                        _errorMessage = 'Fill the required fields';
                      });
                    }
                  } else {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      _errorMessage = '';
                    } else {
                      setState(() {
                        _errorMessage = 'Fill the required fields';
                      });
                    }
                  }

                  if (_currentStep <= 1) {
                    if (_formKey2.currentState!.validate()) {
                      setState(() {
                        _currentStep += 1;
                        _errorMessage = '';
                      });
                    }
                  } else {
                    if (_formKey2.currentState!.validate()) {
                      _formKey2.currentState!.save();
                      _errorMessage = '';
                    } else {
                      setState(() {
                        _errorMessage = 'Fill the required fields';
                      });
                    }
                  }
                },
                onStepCancel: () {
                  if (_currentStep > 0) {
                    setState(() {
                      _currentStep -= 1;
                      _errorMessage = '';
                    });
                  }
                },
                controlsBuilder: stepperControl,
                steps: [
                  buildRegisterStep(),
                  buildCompleteDataStep(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }



  Step buildCompleteDataStep() {
    return Step(
      title: Text('Complete Data',
        style: StylesApp.styleSemiBold12(context),
      ),
      content: CompleteDataStepContent(
        formKey: _formKey2,
      ),
      isActive: _currentStep >= 1,
      state: _currentStep >= 1 ? StepState.indexed : StepState.disabled,
    );
  }

  Step buildRegisterStep() {
    return Step(
      title: Text('Register',
        style: StylesApp.styleSemiBold12(context),
      ),
      content: RegisterStepContent(
          formKey: _formKey
      ),
      isActive: _currentStep >= 0,
      state: _currentStep > 0 ? StepState.complete : StepState.indexed,
    );
  }



  bool isLoading=false;
  Widget stepperControl(BuildContext context, ControlsDetails details) {
    return Row(
      children: [
        if (_currentStep == 1)
          BlocProvider(
            create: (context) => RegisterCubit(),
            child: BlocConsumer<RegisterCubit, RegisterState>(
              builder: (context, state) {
                return Expanded(
                  child: Center(
                    child: SizedBox(
                      height: MediaQuery.sizeOf(context).height * 0.09,
                      width: double.infinity,
                      child: CustomTextButton(
                        text: 'Submit',
                        onPressed: () {
                          if (_formKey2.currentState!.validate()) {
                            registerModel = RegisterModel(
                              firstName: firstNameController.text,
                              lastName: lastNameController.text,
                              about: aboutController.text,
                              tags: selectedSkills,
                              favoriteSocialMedia: selectedSocialMedia,
                              salary: counter,
                              password: passwordController.text,
                              email: emailAddressController.text,
                              birthDate: birthdateController.text,
                              type: userTypeValue,
                              passwordConfirmation: passwordConfirmationController.text,
                              avatar: null, // Handle avatar if necessary
                            );
                            BlocProvider.of<RegisterCubit>(context).registerUser(registerModel);
                          } else {
                            customSnackBar(context, 'Fill the required fields');
                          }
                        },
                      ),
                    ),
                  ),
                );
              },
              listener: (context, state) {
                if (state is RegisterLoadingState) {
                  isLoading = true;
                } else if (state is RegisterSuccessState) {
                  isLoading = false;
                  GoRouter.of(context).pop();
                } else if (state is RegisterFailureState) {
                  isLoading = false;
                  customSnackBar(context, 'The given data was invalid');
                }
              },
            ),
          )
        else
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: MediaQuery.sizeOf(context).width * 0.4),
              child: SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.09,
                child: CustomTextButton(
                  text: 'Next',
                  onPressed: details.onStepContinue,
                ),
              ),
            ),
          ),
      ],
    );
  }
}