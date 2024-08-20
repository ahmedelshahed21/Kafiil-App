import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kafiil_app/Features/home/presentation/views/countries_view.dart';
import 'package:kafiil_app/Features/home/presentation/views/services_view.dart';
import 'package:kafiil_app/Features/home/presentation/views/who_am_i_view.dart';
import 'package:kafiil_app/core/constants/app_assets.dart';
import 'package:kafiil_app/core/constants/app_strings.dart';
import 'package:kafiil_app/core/theme/app_colors.dart';
import 'package:kafiil_app/core/theme/app_styles.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int selectedIndex = 0;
  List<Widget> views=[
    const WhoAmIView(),
    const CountriesView(),
    const ServicesView(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kGrey50Color,
      bottomNavigationBar: BottomNavigationBar(
        elevation: 4,
        backgroundColor: Colors.white,
        selectedItemColor: AppColors.kPrimary900Color,
        selectedLabelStyle: AppStyles.styleMedium12(context),
        unselectedLabelStyle: AppStyles.styleMedium12(context)
            .copyWith(fontWeight: FontWeight.w400),
        unselectedItemColor: AppColors.kGrey300Color,
        currentIndex: selectedIndex,
        onTap: (value) {
          setState(() {
            selectedIndex = value;
          });
        },
        items: [
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                AppAssets.whoAmIIcon,
                colorFilter: selectedIndex == 0 ? const ColorFilter.mode(AppColors.kPrimary900Color, BlendMode.srcIn):const ColorFilter.mode(AppColors.kGrey300Color, BlendMode.srcIn),
              ),
              label: AppStrings.whoAmI),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                AppAssets.countriesIcon,
                colorFilter: selectedIndex == 1 ? const ColorFilter.mode(AppColors.kPrimary900Color, BlendMode.srcIn):const ColorFilter.mode(AppColors.kGrey300Color, BlendMode.srcIn),
              ),
              label: AppStrings.countries),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                AppAssets.servicesIcon,
                colorFilter: selectedIndex == 2 ? const ColorFilter.mode(AppColors.kPrimary900Color, BlendMode.srcIn):const ColorFilter.mode(AppColors.kGrey300Color, BlendMode.srcIn),
              ),
              label: AppStrings.services),
        ],
      ),
      body: views.elementAt(selectedIndex),
    );
  }
}
