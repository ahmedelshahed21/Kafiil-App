import 'package:flutter/material.dart';
import 'package:kafiil_app/core/constants/app_strings.dart';
import 'package:kafiil_app/core/widgets/custom_text_form_field.dart';

class NameSection extends StatelessWidget{

  final String? firstNameInitialValue;
  final String? lastNameInitialValue;

  const NameSection({super.key, this.firstNameInitialValue, this.lastNameInitialValue});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomTextFormField(
            fieldName: AppStrings.firstName,
            initialValue: firstNameInitialValue,
            validator: (v) {
              return null;
            },
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: CustomTextFormField(
            fieldName: AppStrings.lastName,
            initialValue: lastNameInitialValue,
            validator: (v) {
              return null;
            },
          ),
        ),
      ],
    );
  }

}