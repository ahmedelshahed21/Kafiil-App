import 'package:flutter/material.dart';
import 'package:kafiil_app/core/utils/styles_app.dart';

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
            child: Text('Welcome to Kafiil App',
              style: StylesApp.styleMedium14(context).copyWith(
                fontSize: 16
              ),
              textAlign: TextAlign.center,
            ),
          );
        }
    );
  }
}