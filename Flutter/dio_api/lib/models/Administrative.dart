class Administrative {
  int? id;
  String code;
  String name;
  int level;
  int? parentId;
  List<Administrative>? childrens;

  Administrative({
    this.id,
    required this.code,
    required this.name,
    required this.level,
    this.parentId,
    this.childrens,
  });

  factory Administrative.fromJson(Map<String, dynamic> json) {
    return Administrative(
      id: json["id"] ?? 0,
      code: json['code'] ?? '',
      name: json['name'] ?? '',
      level: json['level'] ?? 0,
      parentId: json['parentId'],
      childrens: (json['childrens'] as List<dynamic>?)
          ?.map((e) => Administrative.fromJson(e)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'code': code,
      'name': name,
      'level': level,
      'parentId': parentId
    };
  }
}
