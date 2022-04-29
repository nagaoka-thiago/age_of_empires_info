import 'cost.dart';

class Unit {
  int? id;
  String? name;
  String? description;
  String? expansion;
  String? age;
  String? createdIn;
  Cost? cost;
  int? buildTime;
  double? reloadTime;
  double? movementRate;
  int? lineOfSight;
  int? hitPoints;
  int? attack;
  String? armor;
  List<String>? attackBonus;

  Unit(
      {this.id,
      this.name,
      this.description,
      this.expansion,
      this.age,
      this.createdIn,
      this.cost,
      this.buildTime,
      this.reloadTime,
      this.movementRate,
      this.lineOfSight,
      this.hitPoints,
      this.attack,
      this.armor,
      this.attackBonus});

  Unit.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    expansion = json['expansion'];
    age = json['age'];
    createdIn = json['created_in'];
    cost = json['cost'] != null ? Cost.fromJson(json['cost']) : null;
    buildTime = json['build_time'];
    reloadTime = json['reload_time'];
    movementRate = json['movement_rate'];
    lineOfSight = json['line_of_sight'];
    hitPoints = json['hit_points'];
    attack = json['attack'];
    armor = json['armor'];
    attackBonus = json.containsKey('attack_bonus')
        ? json['attack_bonus'].cast<String>()
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['expansion'] = expansion;
    data['age'] = age;
    data['created_in'] = createdIn;
    if (cost != null) {
      data['cost'] = cost!.toJson();
    }
    data['build_time'] = buildTime;
    data['reload_time'] = reloadTime;
    data['movement_rate'] = movementRate;
    data['line_of_sight'] = lineOfSight;
    data['hit_points'] = hitPoints;
    data['attack'] = attack;
    data['armor'] = armor;
    data['attack_bonus'] = attackBonus;
    return data;
  }
}
