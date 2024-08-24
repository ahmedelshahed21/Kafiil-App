import 'package:flutter/material.dart';
import 'package:kafiil_app/Features/home/data/models/country_model.dart';
import 'package:kafiil_app/core/constants/app_strings.dart';
import 'package:kafiil_app/core/constants/constants.dart';
import 'package:kafiil_app/core/theme/app_colors.dart';
import 'package:kafiil_app/features/home/presentation/views/widgets/country_data_source.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:kafiil_app/core/theme/app_styles.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class CountriesTable extends StatefulWidget {
  final List<CountryModel> countries;

  const CountriesTable({required this.countries, super.key});

  @override
  CountriesTableState createState() => CountriesTableState();
}

class CountriesTableState extends State<CountriesTable> {
  late int _rowsPerPage;
  late double _dataPagerHeight;
  late int _totalPages;
  late int _currentPageIndex;

  @override
  void initState() {
    super.initState();
    _rowsPerPage = 10;
    _dataPagerHeight = 60.0;
    _currentPageIndex = 1;
    _calculatePages();
  }

  void _calculatePages() {
    _totalPages = (widget.countries.length / _rowsPerPage).ceil();
  }

  List<CountryModel> _getPaginatedData(int pageIndex) {
    final startIndex = pageIndex * _rowsPerPage;
    final endIndex = startIndex + _rowsPerPage;
    if (startIndex < widget.countries.length) {
      return widget.countries
          .getRange(startIndex, endIndex.clamp(0, widget.countries.length))
          .toList();
    } else {
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    final paginatedCountries = _getPaginatedData(_currentPageIndex);
    return Theme(
      data: ThemeData.light().copyWith(
        colorScheme: const ColorScheme.light(
            primary: AppColors.kPrimary900Color,
            secondary: AppColors.kBackgroundColor),
      ),
      child: LayoutBuilder(
        builder: (context, constraint) {
          return Column(
            children: [
              SizedBox(
                height: constraint.maxHeight - _dataPagerHeight,
                child: _buildDataTable(paginatedCountries),
              ),
              SizedBox(
                height: _dataPagerHeight,
                child: SfDataPagerTheme(
                  data: SfDataPagerThemeData(
                    itemColor: Colors.white,
                    disabledItemColor: Colors.white,
                    selectedItemColor: AppColors.kPrimary900Color,
                    selectedItemTextStyle: AppStyles.styleMedium14(context)
                        .copyWith(color: AppColors.kBackgroundColor),
                    itemBorderRadius: BorderRadius.circular(7),
                    itemTextStyle: AppStyles.styleMedium14(context)
                        .copyWith(color: AppColors.kGrey900Color),
                    itemBorderColor: AppColors.kGrey200Color,
                    itemBorderWidth: 1.5,
                  ),
                  child: SfDataPager(
                    delegate:
                        CountryDataSource(paginatedCountries, _rowsPerPage),
                    pageCount: _totalPages.toDouble(),
                    onPageNavigationStart: (int newPageIndex) {
                      setState(() {
                        _currentPageIndex = newPageIndex;
                      });
                    },
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildDataTable(List<CountryModel> paginatedCountries) {
    return SfDataGrid(
      source: CountryDataSource(paginatedCountries, _rowsPerPage),
      columnWidthMode: ColumnWidthMode.fill,
      columns: <GridColumn>[
        GridColumn(
          columnName: 'country',
          label: buildLabel(AppStrings.country, Alignment.center),
        ),
        GridColumn(
          columnName: 'capital',
          label: buildLabel(AppStrings.capital, Alignment.center),
        ),
      ],
    );
  }

  Widget buildLabel(String title, Alignment alignment) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      alignment: alignment,
      decoration: BoxDecoration(
          color: AppColors.kGrey50Color,
          borderRadius: BorderRadius.circular(10)),
      child: Text(
        title,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(
          fontSize: 12,
          color: AppColors.kGrey500Color,
          fontWeight: FontWeight.w500,
          fontFamily: montserratFont,
        ),
      ),
    );
  }
}
