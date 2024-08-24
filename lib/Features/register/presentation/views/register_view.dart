import 'package:flutter/material.dart';
import 'package:kafiil_app/Features/register/data/models/register_model/user_profile.dart';
import 'package:kafiil_app/core/constants/app_strings.dart';
import 'package:kafiil_app/core/theme/app_colors.dart';
import 'package:kafiil_app/core/widgets/back_icon_button.dart';
import 'package:kafiil_app/core/widgets/custom_text_button.dart';
import 'package:kafiil_app/features/register/presentation/views/widgets/complete_data_step_content.dart';
import 'package:kafiil_app/features/register/presentation/views/widgets/register_step_content.dart';
import 'package:kafiil_app/core/theme/app_styles.dart';
import 'package:kafiil_app/features/register/presentation/views/widgets/error_container.dart';




final UserProfile userProfile = UserProfile();
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
          AppStrings.register,
          style: AppStyles.styleSemiBold18(context),
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
                  primary: AppColors.kPrimary900Color
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
                        _errorMessage = AppStrings.fillRequiredFields;
                      });
                    }
                  } else {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      _errorMessage = '';
                    } else {
                      setState(() {
                        _errorMessage = AppStrings.fillRequiredFields;
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


  Step buildRegisterStep() {
    return Step(
      title: Text(AppStrings.register,
        style: AppStyles.styleSemiBold12(context),
      ),
      content: RegisterStepContent(
          formKey: _formKey
      ),
      isActive: _currentStep >= 0,
      state: _currentStep > 0 ? StepState.complete : StepState.indexed,
    );
  }

  Step buildCompleteDataStep() {
    return Step(
      title: Text(AppStrings.completeData,
        style: AppStyles.styleSemiBold12(context),
      ),
      content: const CompleteDataStepContent(),
      isActive: _currentStep >= 1,
      state: _currentStep >= 1 ? StepState.indexed : StepState.disabled,
    );
  }

  Widget stepperControl(BuildContext context, ControlsDetails details) {
    return Row(
      children: [
        if (_currentStep < 1)
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: MediaQuery.sizeOf(context).width * 0.4),
              child: SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.09,
                child: CustomTextButton(
                  text: AppStrings.nextButton,
                  onPressed: details.onStepContinue,
                ),
              ),
            ),
          ),
      ],
    );
  }
}