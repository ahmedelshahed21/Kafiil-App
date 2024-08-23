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
              userProfile.isFacebookSelected = !userProfile.isFacebookSelected;
              if (userProfile.isFacebookSelected == true) {
                userProfile.favouriteSocialMedia.add('facebook');
                userProfile.isXSelected=false;
                userProfile.isInstagramSelected=false;
                userProfile.favouriteSocialMedia.remove('x');
                userProfile.favouriteSocialMedia.remove('instagram');
              }
              if (userProfile.isFacebookSelected == false) {
                userProfile.favouriteSocialMedia.remove('facebook');
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
                  value: userProfile.isFacebookSelected,
                  onChanged: (value) {
                    setState(() {
                      userProfile.isFacebookSelected = value!;
                      if (userProfile.isFacebookSelected == true) {
                        userProfile.isInstagramSelected=false;
                        userProfile.isXSelected=false;
                        userProfile.favouriteSocialMedia.add('facebook');
                        userProfile.favouriteSocialMedia.remove('x');
                        userProfile.favouriteSocialMedia.remove('instagram');
                      }
                      if (userProfile.isFacebookSelected == false) {
                        userProfile.favouriteSocialMedia.remove('facebook');
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
              userProfile.isXSelected=!userProfile.isXSelected;
              if (userProfile.isXSelected == true) {
                userProfile.isFacebookSelected=false;
                userProfile.isInstagramSelected=false;
                userProfile.favouriteSocialMedia.add('x');
                userProfile.favouriteSocialMedia.remove('instagram');
                userProfile.favouriteSocialMedia.remove('facebook');
              }
              if (userProfile.isXSelected == false) {
                userProfile.favouriteSocialMedia.remove('x');
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
                  value: userProfile.isXSelected,
                  onChanged: (value) {
                    setState(() {
                      userProfile.isXSelected = value!;
                      if (userProfile.isXSelected == true) {
                        userProfile.isFacebookSelected=false;
                        userProfile.isInstagramSelected=false;
                        userProfile.favouriteSocialMedia.remove('instagram');
                        userProfile.favouriteSocialMedia.remove('facebook');
                        userProfile.favouriteSocialMedia.add('x');
                      }
                      if (userProfile.isXSelected == false) {
                        userProfile.favouriteSocialMedia.remove('x');
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
              userProfile.isInstagramSelected=!userProfile.isInstagramSelected;
              if (userProfile.isInstagramSelected == true) {
                userProfile.isFacebookSelected=false;
                userProfile.isXSelected=false;
                userProfile.favouriteSocialMedia.remove('x');
                userProfile.favouriteSocialMedia.remove('facebook');
                userProfile.favouriteSocialMedia.add('instagram');
              }
              if (userProfile.isInstagramSelected == false) {
                userProfile.favouriteSocialMedia.remove('instagram');
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
                  value: userProfile.isInstagramSelected,
                  onChanged: (value) {
                    setState(() {
                      userProfile.isInstagramSelected = value!;
                      if (userProfile.isInstagramSelected == true) {
                        userProfile.isFacebookSelected=false;
                        userProfile.isXSelected=false;
                        userProfile.favouriteSocialMedia.remove('x');
                        userProfile.favouriteSocialMedia.remove('facebook');
                        userProfile.favouriteSocialMedia.add('instagram');
                      }
                      if (userProfile.isInstagramSelected == false) {
                        userProfile.favouriteSocialMedia.remove('instagram');
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