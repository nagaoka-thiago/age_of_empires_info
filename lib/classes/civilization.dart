class Civilization {
  int? id;
  String? name;
  String? expansion;
  String? armyType;
  List<String>? uniqueUnit;
  List<String>? uniqueTech;
  String? teamBonus;
  List<String>? civilizationBonus;

  Civilization(
      {this.id,
      this.name,
      this.expansion,
      this.armyType,
      this.uniqueUnit,
      this.uniqueTech,
      this.teamBonus,
      this.civilizationBonus});

  Civilization.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    expansion = json['expansion'];
    armyType = json['army_type'];
    uniqueUnit = json['unique_unit'].cast<String>();
    uniqueTech = json['unique_tech'].cast<String>();
    teamBonus = json['team_bonus'];
    civilizationBonus = json['civilization_bonus'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['name'] = name;
    data['expansion'] = expansion;
    data['army_type'] = armyType;
    data['unique_unit'] = uniqueUnit;
    data['unique_tech'] = uniqueTech;
    data['team_bonus'] = teamBonus;
    data['civilization_bonus'] = civilizationBonus;
    return data;
  }
}
