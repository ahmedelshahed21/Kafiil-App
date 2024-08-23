import 'package:flutter/material.dart';
import 'package:kafiil_app/Features/register/presentation/views/register_view.dart';
import 'package:kafiil_app/core/constants/app_strings.dart';
import 'package:kafiil_app/core/theme/app_styles.dart';

class GenderSection extends StatefulWidget{
  const GenderSection({super.key});

  @override
  State<GenderSection> createState() => _GenderSectionState();
}

class _GenderSectionState extends State<GenderSection> {


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.bottomLeft,
          child: Text(
            AppStrings.gender,
            style: AppStyles.styleMedium12(context),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  userProfile.gender = false;
                });
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Radio(
                      value: false,
                      groupValue: userProfile.gender ,
                      onChanged: (value) {
                        setState(() {
                          userProfile.gender = value!;
                        });
                      }),
                  Text(
                    AppStrings.male,
                    style: AppStyles.styleMedium16(context),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  userProfile.gender  = true;
                });
              },
              child: Row(
                children: [
                  Radio(
                      value: true,
                      groupValue: userProfile.gender ,
                      onChanged: (value) {
                        setState(() {
                          userProfile.gender = value!;
                        });
                      }),
                  Text(
                    AppStrings.female,
                    style: AppStyles.styleMedium16(context),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}