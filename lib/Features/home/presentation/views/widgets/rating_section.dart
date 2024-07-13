import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kafiil_app/core/utils/assets_app.dart';
import 'package:kafiil_app/core/utils/constants.dart';
import 'package:kafiil_app/core/utils/styles_app.dart';

class RatingSection extends StatelessWidget {
  const RatingSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(FontAwesomeIcons.solidStar,
          color: kWarning300Color,
          size: 16,
        ),
        const SizedBox(width: 5,),
        Text('(4.5)',
          style: StylesApp.styleMedium12(context).copyWith(
              fontSize: 11,
              color: kWarning300Color
          ),
        ),
        const SizedBox(width: 5,),
        Text('|',
          style: StylesApp.styleMedium12(context).copyWith(
              fontSize: 10,
              color: kGrey300Color
          ),
        ),
        const SizedBox(width: 5,),
        SvgPicture.asset(ImagesApp.groupIcon),
        const SizedBox(width: 5,),
        Text('20',
          style: StylesApp.styleMedium12(context).copyWith(
              fontSize: 10,
              color: kGrey600Color
          ),
        )
      ],
    );
  }
}