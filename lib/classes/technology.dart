import 'cost.dart';

class Technology {
  int? id;
  String? name;
  String? description;
  String? expansion;
  String? age;
  String? developsIn;
  Cost? cost;
  int? buildTime;
  List<String>? appliesTo;

  Technology(
      {this.id,
      this.name,
      this.description,
      this.expansion,
      this.age,
      this.developsIn,
      this.cost,
      this.buildTime,
      this.appliesTo});

  Technology.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    expansion = json['expansion'];
    age = json['age'];
    developsIn = json['develops_in'];
    cost = json['cost'] != null ? Cost.fromJson(json['cost']) : null;
    buildTime = json['build_time'];
    appliesTo = json['applies_to'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['expansion'] = expansion;
    data['age'] = age;
    data['develops_in'] = developsIn;
    if (cost != null) {
      data['cost'] = cost!.toJson();
    }
    data['build_time'] = buildTime;
    data['applies_to'] = appliesTo;
    return data;
  }
}
