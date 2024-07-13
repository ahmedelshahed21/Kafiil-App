import 'package:flutter/material.dart';

class CustomFloatingActionButton extends StatelessWidget{
  const CustomFloatingActionButton({super.key, required this.child, this.onPressed});
  final Widget? child;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
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