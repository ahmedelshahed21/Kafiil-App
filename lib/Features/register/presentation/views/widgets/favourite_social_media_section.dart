import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kafiil_app/Features/register/presentation/views/register_view.dart';
import 'package:kafiil_app/core/constants/app_strings.dart';
import 'package:kafiil_app/core/theme/app_colors.dart';
import 'package:kafiil_app/core/theme/app_styles.dart';

class FavouriteSocialMediaSection extends StatefulWidget{
  const FavouriteSocialMediaSection({super.key});

  @override
  State<FavouriteSocialMediaSection> createState() => _FavouriteSocialMediaSectionState();
}

class _FavouriteSocialMediaSectionState extends State<FavouriteSocialMediaSection> {
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
        GestureDetector(
          onTap: () {
            setState(() {
              isFacebookSelected = !isFacebookSelected;
              if (isFacebookSelected == true) {
                favouriteSocialMedia.add('facebook');
              }
              if (isFacebookSelected == false) {
                favouriteSocialMedia.remove('facebook');
              }
            });
          },
          child: Container(
            color: Colors.transparent,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Checkbox(
                  activeColor: AppColors.kPrimary900Color,
                  value: isFacebookSelected,
                  onChanged: (value) {
                    setState(() {
                      isFacebookSelected = value!;
                      if (isFacebookSelected == true) {
                        favouriteSocialMedia.add('facebook');
                      }
                      if (isFacebookSelected == false) {
                        favouriteSocialMedia.remove('facebook');
                      }
                    });
                  },
                ),
                const Icon(
                  FontAwesomeIcons.facebook,
                  color: Colors.blueAccent,
                ),
                const SizedBox(width: 5),
                Text(
                  AppStrings.facebook,
                  style: AppStyles.styleMedium14(context),
                ),
              ],
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              isXSelected=!isXSelected;
              if (isXSelected == true) {
                favouriteSocialMedia.add('x');
              }
              if (isXSelected == false) {
                favouriteSocialMedia.remove('x');
              }
            });
          },
          child: Container(
            color: Colors.transparent,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Checkbox(
                  activeColor: AppColors.kPrimary900Color,
                  value: isXSelected,
                  onChanged: (value) {
                    setState(() {
                      isXSelected = value!;
                      if (isXSelected == true) {
                        favouriteSocialMedia.add('x');
                      }
                      if (isXSelected == false) {
                        favouriteSocialMedia.remove('x');
                      }
                    });
                  },
                ),
                const Icon(FontAwesomeIcons.x),
                const SizedBox(width: 5),
                Text(
                  AppStrings.x,
                  style: AppStyles.styleMedium14(context),
                ),
              ],
            ),
          ),
        ),
        GestureDetector(
          onTap: (){
            setState(() {
              isInstagramSelected=!isInstagramSelected;
              if (isInstagramSelected == true) {
                favouriteSocialMedia.add('instagram');
              }
              if (isInstagramSelected == false) {
                favouriteSocialMedia.remove('instagram');
              }

            });
          },
          child: Container(
            color: Colors.transparent,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Checkbox(
                  activeColor: AppColors.kPrimary900Color,
                  value: isInstagramSelected,
                  onChanged: (value) {
                    setState(() {
                      isInstagramSelected = value!;
                      if (isInstagramSelected == true) {
                        favouriteSocialMedia.add('instagram');
                      }
                      if (isInstagramSelected == false) {
                        favouriteSocialMedia.remove('instagram');
                      }
                    });
                  },
                ),
                const Icon(
                  FontAwesomeIcons.instagram,
                  color: Colors.redAccent,
                ),
                const SizedBox(width: 5),
                Text(
                  AppStrings.instagram,
                  style: AppStyles.styleMedium14(context),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}