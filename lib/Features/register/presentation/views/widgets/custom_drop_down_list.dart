import 'package:flutter/material.dart';
import 'package:kafiil_app/core/functions/outline_input_border.dart';
import 'package:kafiil_app/core/utils/constants.dart';
import 'package:kafiil_app/core/utils/styles_app.dart';

class CustomDropDownList extends StatefulWidget {
  const CustomDropDownList({super.key});

  @override
  State<CustomDropDownList> createState() => _CustomDropDownListState();
}

class _CustomDropDownListState extends State<CustomDropDownList> {
  final List<String> userTypes = ['Buyer', 'Seller', 'Both'];
  String? userType;
  int? userTypeValue=1;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          'User Type',
          style: StylesApp.styleMedium12(context),
        ),
        const SizedBox(height: 10),
        DropdownButtonFormField<String>(
          decoration: InputDecoration(
            filled: true,
            fillColor: kGrey50Color,
            enabledBorder: buildOutlineInputBorder(),
            focusedBorder: buildOutlineInputBorder(),
            errorBorder: buildOutlineInputBorder(color: Colors.red),
            focusedErrorBorder: buildOutlineInputBorder(color: Colors.red),
            contentPadding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 12.0),
          ),
          icon: Transform.rotate(
              angle: -1.59,
              child: const Icon(Icons.arrow_back_ios_new,
                color: kGrey300Color,
              )), // Change the icon and color here
          items: userTypes.map((String type) {
            return DropdownMenuItem<String>(
              value: type,
              child: Text(type,
                style: StylesApp.styleMedium16(context).copyWith(
                  color: kGrey800Color,
                ),
              ),
            );
          }).toList(),
          onChanged: (newValue) {
            setState(() {
              userType = newValue;
              // Map the selected value to the corresponding integer
              if (userType == 'Buyer') {
                userTypeValue = 1;
              } else if (userType == 'Seller') {
                userTypeValue = 2;
              } else if (userType == 'Both') {
                userTypeValue = 3;
              }
            });
          },
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please select a user type';
            }
            return null;
          },
          onSaved: (value) {
            userType = value;
            // Map the saved value to the corresponding integer
            if (userType == 'Buyer') {
              userTypeValue = 1;
            } else if (userType == 'Seller') {
              userTypeValue = 2;
            } else if (userType == 'Both') {
              userTypeValue = 3;
            }
          },
        ),
      ],
    );
  }
}
