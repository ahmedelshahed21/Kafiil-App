import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kafiil_app/Features/home/presentation/views/widgets/popular_services_list_view.dart';
import 'package:kafiil_app/core/constants/app_strings.dart';
import 'package:kafiil_app/core/theme/app_styles.dart';
import 'package:kafiil_app/features/home/presentation/views/widgets/services_list_view.dart';

class ServicesView extends StatelessWidget{
  const ServicesView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0,top: 63),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(AppStrings.services, style: AppStyles.styleSemiBold18(context)),
            const SizedBox(height: 50),
            const ServicesListView(),
            const SizedBox(height: 35),
            Text(AppStrings.popularServices, style: AppStyles.styleSemiBold18(context)),
            const SizedBox(height: 30),
            const PopularServicesListView()
          ],
        ),
      ),
    );
  }
}









