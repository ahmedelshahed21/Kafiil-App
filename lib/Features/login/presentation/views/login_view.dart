import 'package:flutter/material.dart';
import 'package:kafiil_app/core/shared_components/back_icon_button.dart';
import 'package:kafiil_app/core/utils/styles_app.dart';
import 'package:kafiil_app/features/login/presentation/views/widgets/haveNoAccountSection.dart';
import 'package:kafiil_app/features/login/presentation/views/widgets/login_form_section.dart';
import 'package:kafiil_app/features/login/presentation/views/widgets/login_picture.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        leading: const BackIconButton(),
        titleSpacing: -16,
        title: Text(
          'Account Login',
          style: StylesApp.styleSemiBold18(context),
        ),
      ),
      body: const SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 20),
              LoginPicture(),
              SizedBox(height: 20),
              LoginFormSection(),
              HaveNoAccountSection()
            ],
          ),
        ),
      ),
    );
  }
}
