import 'package:flutter/material.dart';
import 'package:kafiil_app/Features/register/presentation/views/register_view.dart';
import 'package:kafiil_app/core/constants/app_strings.dart';
import 'package:kafiil_app/core/theme/app_colors.dart';
import 'package:kafiil_app/core/theme/app_styles.dart';
import 'package:kafiil_app/core/utils/helpers/functions/outline_input_border.dart';


class CustomDropDownList extends StatefulWidget {
  const CustomDropDownList({super.key});

  @override
  State<CustomDropDownList> createState() => _CustomDropDownListState();
}

class _CustomDropDownListState extends State<CustomDropDownList> {
  final List<String> userTypes = ['buyer', 'seller', 'both'];
  String? userType;


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          AppStrings.userType,
          style: AppStyles.styleMedium12(context),
        ),
        const SizedBox(height: 10),
        DropdownButtonFormField<String>(
          decoration: InputDecoration(
            filled: true,
            fillColor: AppColors.kGrey50Color,
            enabledBorder: buildOutlineInputBorder(),
            focusedBorder: buildOutlineInputBorder(),
            errorBorder: buildOutlineInputBorder(color: Colors.red),
            focusedErrorBorder: buildOutlineInputBorder(color: Colors.red),
            contentPadding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 12.0),
          ),
          icon: Transform.rotate(
              angle: -1.59,
              child: const Icon(Icons.arrow_back_ios_new,
                color: AppColors.kGrey300Color,
              )), // Change the icon and color here
          items: userTypes.map((String type) {
            return DropdownMenuItem<String>(
              value: type,
              child: Text(type,
                style: AppStyles.styleMedium16(context).copyWith(
                  color: AppColors.kGrey800Color,
                ),
              ),
            );
          }).toList(),
          onChanged: (newValue) {
            setState(() {
              userType = newValue;

              if (userType == 'buyer') {
                userTypeValue = 1;
              } if (userType == 'seller') {
                userTypeValue = 2;
              } if (userType == 'both') {
                userTypeValue = 3;
              }
            });
          },
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return AppStrings.userTypeIsRequired;
            }
            return null;
          },
          onSaved: (value) {
            setState(() {
              userType = value;
              if (userType == 'buyer') {
                userTypeValue = 1;
              } if (userType == 'seller') {
                userTypeValue = 2;
              } if (userType == 'both') {
                userTypeValue = 3;
              }
            });
          },
        ),
      ],
    );
  }
}
