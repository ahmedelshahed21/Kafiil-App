import 'package:flutter/material.dart';
import 'package:kafiil_app/Features/home/data/models/country_model.dart';
import 'package:kafiil_app/core/utils/constants.dart';
import 'package:kafiil_app/core/utils/styles_app.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:syncfusion_flutter_core/theme.dart';

class CountriesView extends StatelessWidget {
  const CountriesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 63,bottom: 20),
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
  final List<Country> _countries;
  final int _rowsPerPage = 8;

  CountryDataSource(this._countries) {
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
    dataGridRows = _paginatedCountries.map<DataGridRow>((countryInfo) {
      return DataGridRow(cells: [
        DataGridCell(columnName: 'country', value: countryInfo.country),
        DataGridCell(columnName: 'capital', value: countryInfo.capital),
      ]);
    }).toList(growable: false);
  }
}

class PaginatedCountriesTable extends StatefulWidget {
  const PaginatedCountriesTable({super.key});

  @override
  _PaginatedCountriesTableState createState() =>
      _PaginatedCountriesTableState();
}

class _PaginatedCountriesTableState extends State<PaginatedCountriesTable> {
  final List<Country> countries = [
    Country(country: 'Egypt', capital: 'Cairo'),
    Country(country: 'Egypt', capital: 'Cairo'),
    Country(country: 'Egypt', capital: 'Cairo'),
    Country(country: 'Egypt', capital: 'Cairo'),
    Country(country: 'Egypt', capital: 'Cairo'),
    Country(country: 'Egypt', capital: 'Cairo'),
    Country(country: 'Egypt', capital: 'Cairo'),
    Country(country: 'Egypt', capital: 'Cairo'),
    Country(country: 'Afghanistan', capital: 'Kabul'),
    Country(country: 'Albania', capital: 'Tirana'),
    Country(country: 'Algeria', capital: 'Algiers'),
    Country(country: 'Andorra', capital: 'Andorra la Vella'),
    Country(country: 'Angola', capital: 'Luanda'),
    Country(country: 'Antigua and Barbuda', capital: 'Saint John\'s'),
    Country(country: 'Argentina', capital: 'Buenos Aires'),
    Country(country: 'Armenia', capital: 'Yerevan'),
    Country(country: 'Australia', capital: 'Canberra'),
    Country(country: 'Austria', capital: 'Vienna'),
    Country(country: 'Azerbaijan', capital: 'Baku'),
    Country(country: 'Bahamas', capital: 'Nassau'),
    Country(country: 'Bahrain', capital: 'Manama'),
    Country(country: 'Bangladesh', capital: 'Dhaka'),
    Country(country: 'Barbados', capital: 'Bridgetown'),
    Country(country: 'Belarus', capital: 'Minsk'),
    Country(country: 'Belgium', capital: 'Brussels'),
    Country(country: 'Belize', capital: 'Belmopan'),
    Country(country: 'Benin', capital: 'Porto-Novo'),
    Country(country: 'Bhutan', capital: 'Thimphu'),
    Country(country: 'Bolivia', capital: 'Sucre'),
    Country(country: 'Bosnia and Herzegovina', capital: 'Sarajevo'),
    Country(country: 'Botswana', capital: 'Gaborone'),
    Country(country: 'Brazil', capital: 'Brasília'),
    Country(country: 'Brunei', capital: 'Bandar Seri Begawan'),
    Country(country: 'Bulgaria', capital: 'Sofia'),
    Country(country: 'Burkina Faso', capital: 'Ouagadougou'),
    Country(country: 'Burundi', capital: 'Gitega'),
    Country(country: 'Cabo Verde', capital: 'Praia'),
    Country(country: 'Cambodia', capital: 'Phnom Penh'),
    Country(country: 'Cameroon', capital: 'Yaoundé'),
    Country(country: 'Canada', capital: 'Ottawa'),
    Country(country: 'Central African Republic', capital: 'Bangui'),
    Country(country: 'Chad', capital: 'N\'Djamena'),
    Country(country: 'Chile', capital: 'Santiago'),
    Country(country: 'China', capital: 'Beijing'),
    Country(country: 'Colombia', capital: 'Bogotá'),
    Country(country: 'Comoros', capital: 'Moroni'),
    Country(country: 'Congo', capital: 'Brazzaville'),
    Country(country: 'Costa Rica', capital: 'San José'),
    Country(country: 'Croatia', capital: 'Zagreb'),
    Country(country: 'Cuba', capital: 'Havana'),
    Country(country: 'Cyprus', capital: 'Nicosia'),
    Country(country: 'Czech Republic', capital: 'Prague'),
    Country(country: 'Denmark', capital: 'Copenhagen'),
    Country(country: 'Djibouti', capital: 'Djibouti'),
    Country(country: 'Dominica', capital: 'Roseau'),
    Country(country: 'Dominican Republic', capital: 'Santo Domingo'),
    Country(country: 'Ecuador', capital: 'Quito'),
    Country(country: 'Egypt', capital: 'Cairo'),
    Country(country: 'El Salvador', capital: 'San Salvador'),
    Country(country: 'Equatorial Guinea', capital: 'Malabo'),
    Country(country: 'Eritrea', capital: 'Asmara'),
    Country(country: 'Estonia', capital: 'Tallinn'),
    Country(country: 'Eswatini', capital: 'Mbabane'),
    Country(country: 'Ethiopia', capital: 'Addis Ababa'),
    Country(country: 'Fiji', capital: 'Suva'),
    Country(country: 'Finland', capital: 'Helsinki'),
    Country(country: 'France', capital: 'Paris'),
    Country(country: 'Gabon', capital: 'Libreville'),
    Country(country: 'Gambia', capital: 'Banjul'),
    Country(country: 'Georgia', capital: 'Tbilisi'),
    Country(country: 'Germany', capital: 'Berlin'),
    Country(country: 'Ghana', capital: 'Accra'),
    Country(country: 'Ghana', capital: 'Accra'),
    Country(country: 'Greece', capital: 'Athens'),
    Country(country: 'Grenada', capital: 'St. George\'s'),
    Country(country: 'Guatemala', capital: 'Guatemala City'),
    Country(country: 'Guinea', capital: 'Conakry'),
    Country(country: 'Guinea-Bissau', capital: 'Bissau'),
    Country(country: 'Guyana', capital: 'Georgetown'),
    Country(country: 'Haiti', capital: 'Port-au-Prince'),
  ];

  late int _rowsPerPage;
  late double _dataPagerHeight;
  late List<Country> _paginatedCountries;
  late int _totalPages;
  late int _currentPageIndex;

  @override
  void initState() {
    super.initState();
    _rowsPerPage = 8;
    _dataPagerHeight = 60.0;
    _calculatePages();
    _currentPageIndex = 1;
    _paginatedCountries = _getPaginatedData(_currentPageIndex);
  }

  void _calculatePages() {
    _totalPages = (countries.length / _rowsPerPage).ceil();
  }

  List<Country> _getPaginatedData(int pageIndex) {
    final startIndex = pageIndex * _rowsPerPage;
    final endIndex = startIndex + _rowsPerPage;
    if (startIndex < countries.length) {
      return countries
          .getRange(startIndex, endIndex.clamp(0, countries.length))
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
                    delegate: CountryDataSource(_paginatedCountries),
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
      source: CountryDataSource(_paginatedCountries),
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
