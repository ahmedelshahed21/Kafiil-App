import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kafiil_app/core/constants/app_assets.dart';
import 'package:kafiil_app/core/theme/app_colors.dart';
import 'package:kafiil_app/core/theme/app_styles.dart';

class RatingSection extends StatelessWidget {
  const RatingSection({
    super.key, required this.rating, required this.salesCount,
  });

  final double rating,salesCount;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(FontAwesomeIcons.solidStar,
          color: AppColors.kWarning300Color,
          size: 16,
        ),
        const SizedBox(width: 5,),
        Text('($rating)',
          style: AppStyles.styleMedium12(context).copyWith(
              fontSize: 11,
              color: AppColors.kWarning300Color,
          ),
        ),
        const SizedBox(width: 5,),
        Text('|',
          style: AppStyles.styleMedium12(context).copyWith(
              fontSize: 10,
              color: AppColors.kWarning300Color,
          ),
        ),
        const SizedBox(width: 5,),
        SvgPicture.asset(AppAssets.groupIcon),
        const SizedBox(width: 5,),
        Text('$salesCount',
          style: AppStyles.styleMedium12(context).copyWith(
              fontSize: 10,
              color: AppColors.kWarning300Color,
          ),
        )
      ],
    );
  }
}