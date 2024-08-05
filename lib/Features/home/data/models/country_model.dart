class CountryModel {
  final int id;
  final String countryCode;
  final String name;
  final String capital;

  CountryModel({
    required this.id,
    required this.countryCode,
    required this.name,
    required this.capital,
  });

  factory CountryModel.fromJson(Map<String, dynamic> json) {
    return CountryModel(
      id: json['id'],
      countryCode: json['country_code'],
      name: json['name'],
      capital: json['capital'],
    );
  }
}
