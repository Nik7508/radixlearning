class BreakingBadCharacterModel {
  int? charId;
  String? name;
  String? birthday;
  List<String>? occupation;
  String? img;
  String? status;
  String? nickname;
  List<int>? appearance;
  String? portrayed;
  String? category;
  List<dynamic>? betterCallSaulAppearance;

  BreakingBadCharacterModel(
      {this.charId,
      this.name,
      this.birthday,
      this.occupation,
      this.img,
      this.status,
      this.nickname,
      this.appearance,
      this.portrayed,
      this.category,
      this.betterCallSaulAppearance});

  BreakingBadCharacterModel.fromJson(Map<String, dynamic> json) {
    if (json["char_id"] is int) charId = json["char_id"];
    if (json["name"] is String) name = json["name"];
    if (json["birthday"] is String) birthday = json["birthday"];
    if (json["occupation"] is List) {
      occupation = json["occupation"] == null
          ? null
          : List<String>.from(json["occupation"]);
    }
    if (json["img"] is String) img = json["img"];
    if (json["status"] is String) status = json["status"];
    if (json["nickname"] is String) nickname = json["nickname"];
    if (json["appearance"] is List) {
      appearance = json["appearance"] == null
          ? null
          : List<int>.from(json["appearance"]);
    }
    if (json["portrayed"] is String) portrayed = json["portrayed"];
    if (json["category"] is String) category = json["category"];
    if (json["better_call_saul_appearance"] is List) {
      betterCallSaulAppearance = json["better_call_saul_appearance"] ?? [];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["char_id"] = charId;
    data["name"] = name;
    data["birthday"] = birthday;
    if (occupation != null) data["occupation"] = occupation;
    data["img"] = img;
    data["status"] = status;
    data["nickname"] = nickname;
    if (appearance != null) data["appearance"] = appearance;
    data["portrayed"] = portrayed;
    data["category"] = category;
    if (betterCallSaulAppearance != null) {
      data["better_call_saul_appearance"] = betterCallSaulAppearance;
    }
    return data;
  }
}
