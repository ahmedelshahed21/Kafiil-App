import 'package:flutter/material.dart';
import 'package:kafiil_app/core/theme/app_colors.dart';
import 'package:kafiil_app/core/theme/app_styles.dart';

class FavouriteSocialMediaItem extends StatelessWidget{

  final bool isSelected;
  final void Function()? onTap;
  final void Function(bool?)? onChange;
  final String text;
  final IconData iconData;
  final Color? iconColor;

  const FavouriteSocialMediaItem({super.key, required this.isSelected, this.onTap, this.onChange, required this.text, required this.iconData, required this.iconColor});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: Colors.transparent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Checkbox(
              activeColor: AppColors.kPrimary900Color,
              value: isSelected,
              onChanged: onChange
            ),
            Icon(iconData,
              color: iconColor,
            ),
            const SizedBox(width: 8),
            Text(
              text,
              style: AppStyles.styleMedium16(context),
            ),
          ],
        ),
      ),
    );
  }
}