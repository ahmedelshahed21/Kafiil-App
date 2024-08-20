import 'package:flutter/material.dart';
import 'package:kafiil_app/core/theme/app_colors.dart';
import 'package:kafiil_app/core/theme/app_styles.dart';


class ImageSourceCard extends StatelessWidget {
  const ImageSourceCard(
      {super.key,
        required this.icon,
        required this.iconColor,
        required this.onPressed,
        required this.name});

  final void Function() onPressed;
  final IconData icon;
  final Color iconColor;
  final String name;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: AppColors.kPrimary100Color, borderRadius: BorderRadius.circular(16)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: Icon(icon),
            iconSize: 55,
            color: iconColor,
            onPressed: onPressed,
          ),
          Text(name,
              style: AppStyles.styleSemiBold14(context)
                  .copyWith(color: Colors.black, letterSpacing: 3,fontWeight: FontWeight.w800
              )
          ),
        ],
      ),
    );
  }
}