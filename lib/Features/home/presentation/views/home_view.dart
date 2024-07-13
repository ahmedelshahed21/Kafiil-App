import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kafiil_app/Features/home/presentation/views/countries_view.dart';
import 'package:kafiil_app/Features/home/presentation/views/services_view.dart';
import 'package:kafiil_app/Features/home/presentation/views/who_am_i_view.dart';
import 'package:kafiil_app/core/utils/assets_app.dart';
import 'package:kafiil_app/core/utils/constants.dart';
import 'package:kafiil_app/core/utils/styles_app.dart';


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
      backgroundColor: kGrey50Color,
      bottomNavigationBar: BottomNavigationBar(
        elevation: 2,
        backgroundColor: Colors.white,
        selectedItemColor: kPrimary900Color,
        selectedLabelStyle: StylesApp.styleMedium12(context),
        unselectedLabelStyle: StylesApp.styleMedium12(context)
            .copyWith(fontWeight: FontWeight.w400),
        unselectedItemColor: kGrey300Color,
        currentIndex: selectedIndex,
        onTap: (value) {
          setState(() {
            selectedIndex = value;
          });
        },
        items: [
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                ImagesApp.whoAmIIcon,
                color: selectedIndex == 0 ? kPrimary900Color : kGrey300Color,
              ),
              label: 'Who Am I'),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                ImagesApp.countriesIcon,
                color: selectedIndex == 1 ? kPrimary900Color : kGrey300Color,
              ),
              label: 'Countries'),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                ImagesApp.servicesIcon,
                color: selectedIndex == 2 ? kPrimary900Color : kGrey300Color,
              ),
              label: 'Services'),
        ],
      ),
      body: views.elementAt(selectedIndex),
    );
  }
}
