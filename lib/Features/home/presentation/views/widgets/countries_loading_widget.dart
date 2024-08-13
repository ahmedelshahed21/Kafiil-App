import 'package:flutter/material.dart';
import 'package:kafiil_app/core/utils/constants.dart';
import 'package:kafiil_app/core/utils/styles_app.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class CountriesLoadingWidget extends StatelessWidget {
  const CountriesLoadingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            LoadingAnimationWidget.prograssiveDots(
              size: 80,
              color: kPrimary900Color,
            ),
            const SizedBox(width: 10,),
            Text('Data Loading',
              style: StylesApp.styleMedium12(context).copyWith(
                  color: kGrey500Color
              ),
            )
          ],
        ),
        Text('Please, Wait',
          style: StylesApp.styleMedium16(context).copyWith(
              fontSize: 20
          ),
        )
      ],
    );
  }
}