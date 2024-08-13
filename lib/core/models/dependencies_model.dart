class DependenciesModel {
  final List<TypeModel> types;
  final List<TagModel> tags;

  DependenciesModel({
    required this.types,
    required this.tags,
  });

  factory DependenciesModel.fromJson(Map<String, dynamic> json) {
    return DependenciesModel(
      types: List<TypeModel>.from(json['data']['types'].map((x) => TypeModel.fromJson(x))),
      tags: List<TagModel>.from(json['data']['tags'].map((x) => TagModel.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'types': List<dynamic>.from(types.map((x) => x.toJson())),
      'tags': List<dynamic>.from(tags.map((x) => x.toJson())),
    };
  }
}

class TypeModel {
  final int value;
  final String label;

  TypeModel({
    required this.value,
    required this.label,
  });

  factory TypeModel.fromJson(Map<String, dynamic> json) {
    return TypeModel(
      value: json['value'],
      label: json['label'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'value': value,
      'label': label,
    };
  }
}

class TagModel {
  final int value;
  final String label;

  TagModel({
    required this.value,
    required this.label,
  });

  factory TagModel.fromJson(Map<String, dynamic> json) {
    return TagModel(
      value: json['value'],
      label: json['label'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'value': value,
      'label': label,
    };
  }
}
