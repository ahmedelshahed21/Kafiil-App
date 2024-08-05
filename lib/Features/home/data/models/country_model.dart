class Country {
  final int id;
  final String countryCode;
  final String name;
  final String capital;

  Country({
    required this.id,
    required this.countryCode,
    required this.name,
    required this.capital,
  });

  // Factory method to create a Country instance from a JSON map
  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      id: json['id'] as int,
      countryCode: json['country_code'] as String,
      name: json['name'] as String,
      capital: json['capital'] as String,
    );
  }

  // Method to convert a Country instance to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'country_code': countryCode,
      'name': name,
      'capital': capital,
    };
  }
}
