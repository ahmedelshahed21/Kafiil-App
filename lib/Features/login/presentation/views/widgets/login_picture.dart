import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kafiil_app/core/utils/assets_app.dart';

class LoginPicture extends StatelessWidget {
  const LoginPicture({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(child: ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: 225,
        maxWidth: 225,
      ),
      child: AspectRatio(
        aspectRatio: 1,
        child: SvgPicture.asset(ImagesApp.loginImage),
      ),
    ));
  }
}