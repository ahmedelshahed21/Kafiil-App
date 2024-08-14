import 'package:flutter/material.dart';

class CustomFloatingActionButton extends StatelessWidget{
  const CustomFloatingActionButton({super.key, required this.child, this.onPressed,required this.heroTag});
  final Widget? child;
  final Object heroTag;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        heroTag: heroTag,
        elevation: 1.5,
        mini: true,
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50)
        ),
        onPressed: onPressed,
        child: child,
    );
  }
}