import 'package:flutter/material.dart';
import 'package:kafiil_app/core/theme/app_colors.dart';

class BackIconButton extends StatelessWidget {

  final void Function()? onPressed;

  const BackIconButton({super.key, this.onPressed});
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed ?? (){},
      padding: EdgeInsets.zero,
      icon: const Icon(Icons.arrow_back_ios,
        color: AppColors.kGrey900Color,
      ),
    );
  }
}