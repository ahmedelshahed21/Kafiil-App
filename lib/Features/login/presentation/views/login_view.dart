import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:kafiil_app/Features/login/data/repos/login_repo_impl.dart';
import 'package:kafiil_app/Features/login/presentation/manager/login_cubit/login_cubit.dart';
import 'package:kafiil_app/Features/login/presentation/manager/login_cubit/login_state.dart';
import 'package:kafiil_app/core/constants/app_strings.dart';
import 'package:kafiil_app/core/theme/app_colors.dart';
import 'package:kafiil_app/core/routing/app_router.dart';
import 'package:kafiil_app/core/theme/app_styles.dart';
import 'package:kafiil_app/core/utils/helpers/functions/custom_snack_bar.dart';
import 'package:kafiil_app/core/widgets/back_icon_button.dart';
import 'package:kafiil_app/features/login/presentation/views/widgets/have_no_account_section.dart';
import 'package:kafiil_app/features/login/presentation/views/widgets/login_form_section.dart';
import 'package:kafiil_app/features/login/presentation/views/widgets/login_picture.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(LoginRepoImpl()),
      child: BlocConsumer<LoginCubit,LoginState>(
          builder: (context,state){
            return ModalProgressHUD(
              inAsyncCall: isLoading,
              color: AppColors.kPrimary900Color,
              child: Scaffold(
                appBar: AppBar(
                  scrolledUnderElevation: 0,
                  leading: const BackIconButton(),
                  titleSpacing: -16,
                  title: Text(
                    AppStrings.accountLogin,
                    style: AppStyles.styleSemiBold18(context),
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
              ),
            );
          },
          listener: (context,state){
            if (state is LoginLoadingState) {
              isLoading = true;
            } else if (state is LoginSuccess) {
              GoRouter.of(context).pushReplacement(AppRouter.kHomeView);
              isLoading = false;
            } else {
              customSnackBar(context, AppStrings.loginFailure,
                  iconColor: Colors.red,
                  icon: FontAwesomeIcons.exclamation,
                  customDuration: 3
              );
              isLoading = false;
            }
          }
      ),
    );

  }
}
