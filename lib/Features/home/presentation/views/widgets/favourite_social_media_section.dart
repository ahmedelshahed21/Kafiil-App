import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kafiil_app/Features/home/presentation/views/widgets/favourite_social_media_item.dart';
import 'package:kafiil_app/core/constants/app_strings.dart';
import 'package:kafiil_app/core/theme/app_styles.dart';

class FavouriteSocialMediaSection extends StatelessWidget{
  const FavouriteSocialMediaSection({super.key, required this.isFacebookSelected, this.onTap, this.onChange, required this.isXSelected, required this.isInstagramSelected});
  final bool isFacebookSelected;
  final bool isXSelected;
  final bool isInstagramSelected;
  final void Function()? onTap;
  final void Function(bool?)? onChange;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.bottomLeft,
          child: Text(
            AppStrings.favouriteSocialMedia,
            style: AppStyles.styleMedium12(context),
          ),
        ),
        FavouriteSocialMediaItem(
            text: AppStrings.facebook,
            iconData: FontAwesomeIcons.facebook,
            iconColor: Colors.blueAccent,
            isSelected: isFacebookSelected,
            onTap: onTap,
            onChange: onChange,
        ),
        FavouriteSocialMediaItem(
          text: AppStrings.x,
          iconData: FontAwesomeIcons.x,
          iconColor: Colors.black,
          isSelected: isXSelected,
          onTap: onTap,
          onChange: onChange,
        ),
        FavouriteSocialMediaItem(
          text: AppStrings.instagram,
          iconData: FontAwesomeIcons.instagram,
          iconColor: Colors.redAccent,
          isSelected: isInstagramSelected,
          onTap: onTap,
          onChange: onChange,
        )
      ],
    );
  }
}