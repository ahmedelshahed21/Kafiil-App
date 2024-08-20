import 'package:flutter/material.dart';
import 'package:kafiil_app/core/constants/app_strings.dart';
import 'package:kafiil_app/core/theme/app_styles.dart';

class SlidingText extends StatelessWidget {
  const SlidingText({
    super.key,
    required this.slidingAnimation,
  });

  final Animation<Offset> slidingAnimation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: slidingAnimation,
        builder: (context,_){
          return SlideTransition(
            position: slidingAnimation,
            child: Text('Welcome to ${AppStrings.appName}',
              style: AppStyles.styleMedium14(context).copyWith(
                fontSize: 16
              ),
              textAlign: TextAlign.center,
            ),
          );
        }
    );
  }
}