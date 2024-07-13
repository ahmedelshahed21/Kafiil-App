import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kafiil_app/core/utils/app_router.dart';
import 'package:kafiil_app/core/utils/constants.dart';
import 'package:kafiil_app/core/utils/styles_app.dart';

class HaveNoAccountSection extends StatelessWidget{
  const HaveNoAccountSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Don’t have an account ?  ',
          style: StylesApp.styleMedium14(context).copyWith(
              color: kGrey500Color
          ),
        ),
        GestureDetector(
          onTap: (){
            GoRouter.of(context).push(AppRouter.kRegisterView);
          },
          child: Text('Register',
            style: StylesApp.styleSemiBold14(context),
          ),
        ),
      ],
    );
  }
}