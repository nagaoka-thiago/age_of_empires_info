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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['expansion'] = this.expansion;
    data['army_type'] = this.armyType;
    data['unique_unit'] = this.uniqueUnit;
    data['unique_tech'] = this.uniqueTech;
    data['team_bonus'] = this.teamBonus;
    data['civilization_bonus'] = this.civilizationBonus;
    return data;
  }
}
