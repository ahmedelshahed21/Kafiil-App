import 'package:flutter/material.dart';
import 'package:kafiil_app/Features/home/presentation/views/widgets/paginated_countries_table.dart';
import 'package:kafiil_app/core/constants/app_strings.dart';
import 'package:kafiil_app/core/theme/app_styles.dart';

class CountriesViewBody extends StatelessWidget {
  const CountriesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 63, bottom: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppStrings.countries,
            style: AppStyles.styleSemiBold18(context),
          ),
          const SizedBox(height: 50),
          const Expanded(
            child: PaginatedCountriesTable(),
          ),
        ],
      ),
    );
  }
}