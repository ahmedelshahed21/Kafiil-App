import 'package:flutter/material.dart';
import 'package:kafiil_app/core/utils/constants.dart';
import 'package:kafiil_app/core/utils/styles_app.dart';

class TitleProductItem extends StatelessWidget {
  const TitleProductItem({
    super.key,
    required this.title
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 6.0),
      child: Text(title,
        maxLines: 2,
        style: StylesApp.styleMedium12(context).copyWith(
          color: kGrey900Color,
          fontSize: 10,
        ),
      ),
    );
  }
}