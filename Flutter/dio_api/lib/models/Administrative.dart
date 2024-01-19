
class Administrative {
  int? id;
  String code;
  String name;
  int level;

  Administrative({
    this.id,
    required this.code,
    required this.name,
    required this.level
  });

  factory Administrative.fromJson(Map<String, dynamic> json) {
    return Administrative(
      id: json["id"] ?? 0,
      code: json['code'] ?? '',
      name: json['name'] ?? '',
      level: json['level'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'code': code,
      'name': name,
      'level': level,
    };
  }
}