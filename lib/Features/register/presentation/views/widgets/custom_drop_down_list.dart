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
  final List<String> _userTypes = ['Seller', 'Buyer', 'Both'];
  String? _userType;

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
          items: _userTypes.map((String type) {
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
              _userType = newValue;
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
            _userType = value;
          },
        ),
      ],
    );
  }
}
