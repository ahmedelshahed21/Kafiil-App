import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
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
TextEditingController confirmationPasswordController=TextEditingController();
bool isPasswordSecure = true;
bool isConfirmationPasswordSecure = true;
final TextEditingController birthdateController = TextEditingController();
String gender = 'Male';
bool isFacebookSelected = true;
bool isTwitterSelected = true;
bool isLinkedInSelected = false;
List<String> selectedSkills = [];


class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  RegisterViewState createState() => RegisterViewState();
}

class RegisterViewState extends State<RegisterView> {

  int _currentStep = 0;
  final _formKey = GlobalKey<FormState>();
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
      content: const CompleteDataStepContent(),
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




  Widget stepperControl(BuildContext context, ControlsDetails details) {
    return Row(
      children: [
        if (_currentStep == 1)
          Expanded(
            child: Center(
              child: SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.09,
                width: double.infinity,
                child: CustomTextButton(
                  text: 'Submit',
                  onPressed: (){
                    GoRouter.of(context).pop();
                  },
                ),
              ),
            ),
          )
        else
          Expanded(
              child: Padding(
                padding:
                EdgeInsets.only(left: MediaQuery.sizeOf(context).width * 0.4),
                child: SizedBox(
                  height: MediaQuery.sizeOf(context).height * 0.09,
                  child: CustomTextButton(
                    text: 'Next',
                    onPressed: details.onStepContinue,
                  ),
                ),
              )),
      ],
    );
  }
}