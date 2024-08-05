import 'package:flutter/material.dart';
import 'package:kafiil_app/Features/home/data/models/country_model.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class CountryDataSource extends DataGridSource {
  final List<CountryModel> _countries;
  final int _rowsPerPage;

  CountryDataSource(this._countries, this._rowsPerPage) {
    _paginatedCountries = _countries.take(_rowsPerPage).toList(growable: false);
    buildPaginatedDataGridRows();
  }

  List<DataGridRow> dataGridRows = [];
  List<CountryModel> _paginatedCountries = [];

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
                color: Colors.black),
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
