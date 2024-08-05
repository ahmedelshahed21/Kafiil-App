import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:kafiil_app/Features/home/data/models/country_model.dart';
import 'package:kafiil_app/core/utils/constants.dart';
import 'package:kafiil_app/core/utils/styles_app.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:http/http.dart' as http;

class CountriesView extends StatelessWidget {
  const CountriesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 63, bottom: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Countries',
            style: StylesApp.styleSemiBold18(context),
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

class CountryDataSource extends DataGridSource {
  List<Country> _countries;
  final int _rowsPerPage;

  CountryDataSource(this._countries, this._rowsPerPage) {
    _paginatedCountries = _countries.take(_rowsPerPage).toList(growable: false);
    buildPaginatedDataGridRows();
  }

  List<DataGridRow> dataGridRows = [];
  List<Country> _paginatedCountries = [];

  @override
  List<DataGridRow> get rows => dataGridRows;

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    return DataGridRowAdapter(
      cells: row.getCells().map<Widget>((dataGridCell) {
        final columnName = dataGridCell.columnName;
        final value = dataGridCell.value;
        return Container(
          color: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          alignment: getColumnAlignment(columnName),
          child: Text(
            getCellValue(columnName, value),
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                fontFamily: 'Montserrat',
                color: kGrey900Color),
          ),
        );
      }).toList(),
    );
  }

  Alignment getColumnAlignment(String columnName) {
    switch (columnName) {
      case 'country':
        return Alignment.center;
      case 'capital':
        return Alignment.center;
      default:
        return Alignment.center;
    }
  }

  String getCellValue(String columnName, dynamic value) {
    switch (columnName) {
      case 'country':
        return (value as String?) ?? '';
      case 'capital':
        return (value as String?) ?? '';
      default:
        return '';
    }
  }

  @override
  Future<bool> handlePageChange(int oldPageIndex, int newPageIndex) async {
    int startIndex = newPageIndex * _rowsPerPage;
    int endIndex = startIndex + _rowsPerPage;
    if (startIndex <= _countries.length && endIndex <= _countries.length) {
      _paginatedCountries =
          _countries.getRange(startIndex, endIndex).toList(growable: false);
      buildPaginatedDataGridRows();
      notifyListeners();
    } else {
      _paginatedCountries = [];
    }

    return true;
  }

  void buildPaginatedDataGridRows() {
    dataGridRows = _paginatedCountries.map<DataGridRow>((country) {
      return DataGridRow(cells: [
        DataGridCell(columnName: 'country', value: country.name),
        DataGridCell(columnName: 'capital', value: country.capital),
      ]);
    }).toList(growable: false);
  }
}

class PaginatedCountriesTable extends StatefulWidget {
  const PaginatedCountriesTable({super.key});

  @override
  PaginatedCountriesTableState createState() => PaginatedCountriesTableState();
}

class PaginatedCountriesTableState extends State<PaginatedCountriesTable> {
  List<Country> _countries = [];
  late int _rowsPerPage;
  late double _dataPagerHeight;
  late List<Country> _paginatedCountries;
  late int _totalPages;
  late int _currentPageIndex;

  @override
  void initState() {
    super.initState();
    _rowsPerPage = 10;
    _dataPagerHeight = 60.0;
    _currentPageIndex = 0;
    _fetchCountries();
  }

  Future<void> _fetchCountries() async {
    List<Country> allCountries = [];
    var currentPage = 1;
    final int totalPages = 25;

    while (currentPage <= totalPages) {
      final response = await http.get(Uri.parse('https://test.kafiil.com/api/test/country?page=$currentPage'));

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body) as Map<String, dynamic>;
        final List<dynamic> countriesJson = jsonData['data'] as List<dynamic>;

        allCountries.addAll(
          countriesJson
              .map((json) => Country.fromJson(json as Map<String, dynamic>))
              .toList(),
        );

        currentPage++;
      } else {
        // Handle error
        throw Exception('Failed to load countries');
      }
    }

    setState(() {
      _countries = allCountries;
      _calculatePages();
      _paginatedCountries = _getPaginatedData(_currentPageIndex);
    });
  }

  void _calculatePages() {
    _totalPages = (_countries.length / _rowsPerPage).ceil();
  }

  List<Country> _getPaginatedData(int pageIndex) {
    final startIndex = pageIndex * _rowsPerPage;
    final endIndex = startIndex + _rowsPerPage;
    if (startIndex < _countries.length) {
      return _countries
          .getRange(startIndex, endIndex.clamp(0, _countries.length))
          .toList();
    } else {
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData.light().copyWith(
        colorScheme: const ColorScheme.light(
            primary: kPrimary900Color, secondary: kBackgroundColor),
      ),
      child: LayoutBuilder(
        builder: (context, constraint) {
          return Column(
            children: [
              SizedBox(
                height: constraint.maxHeight - _dataPagerHeight,
                child: _buildDataTable(),
              ),
              SizedBox(
                height: _dataPagerHeight,
                child: SfDataPagerTheme(
                  data: SfDataPagerThemeData(
                    itemColor: Colors.white,
                    disabledItemColor: Colors.white,
                    selectedItemColor: kPrimary900Color,
                    selectedItemTextStyle: StylesApp.styleMedium14(context)
                        .copyWith(color: kBackgroundColor),
                    itemBorderRadius: BorderRadius.circular(7),
                    itemTextStyle: StylesApp.styleMedium14(context)
                        .copyWith(color: kGrey800Color),
                    itemBorderColor: kGrey200Color,
                    itemBorderWidth: 1.5,
                  ),
                  child: SfDataPager(
                    delegate: CountryDataSource(_paginatedCountries, _rowsPerPage),
                    pageCount: _totalPages.toDouble(),
                    onPageNavigationStart: (int newPageIndex) {
                      setState(() {
                        _currentPageIndex = newPageIndex;
                        _paginatedCountries =
                            _getPaginatedData(_currentPageIndex);
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

  Widget _buildDataTable() {
    return SfDataGrid(
      source: CountryDataSource(_paginatedCountries, _rowsPerPage),
      columnWidthMode: ColumnWidthMode.fill,
      columns: <GridColumn>[
        GridColumn(
          columnName: 'country',
          label: buildLabel('Country', Alignment.center),
        ),
        GridColumn(
          columnName: 'capital',
          label: buildLabel('Capital', Alignment.center),
        ),
      ],
    );
  }

  Widget buildLabel(String title, Alignment alignment) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      alignment: alignment,
      decoration: BoxDecoration(
          color: kGrey50Color, borderRadius: BorderRadius.circular(10)),
      child: Text(
        title,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(
          fontSize: 12,
          color: kGrey500Color,
          fontWeight: FontWeight.w500,
          fontFamily: 'Montserrat',
        ),
      ),
    );
  }
}
