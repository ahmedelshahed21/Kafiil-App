import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:kafiil_app/Features/splash/presentation/views/widgets/sliding_text.dart';
import 'package:kafiil_app/core/constants/app_assets.dart';
import 'package:kafiil_app/core/utils/app_router.dart';

class SplashViewBody extends StatefulWidget{
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> with SingleTickerProviderStateMixin {

  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;

  @override
  void initState() {
    initSlidingAnimation();
    super.initState();

    navigationToHomeView();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
       Image.asset(AppAssets.logoApp),
        const SizedBox(height: 5),
        SlidingText(slidingAnimation: slidingAnimation)
      ],
    );
  }

  void initSlidingAnimation() {
    animationController=AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );
    slidingAnimation = Tween<Offset>(begin: const Offset(0,4),end: Offset.zero).animate(animationController);
    animationController.forward();
  }

  void navigationToHomeView() {
    Future.delayed(
        const Duration(seconds: 4),(){
          GoRouter.of(context).pushReplacement(AppRouter.kLoginView);
    });
  }

}

