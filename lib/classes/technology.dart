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
    cost = json['cost'] != null ? new Cost.fromJson(json['cost']) : null;
    buildTime = json['build_time'];
    appliesTo = json['applies_to'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['expansion'] = this.expansion;
    data['age'] = this.age;
    data['develops_in'] = this.developsIn;
    if (this.cost != null) {
      data['cost'] = this.cost!.toJson();
    }
    data['build_time'] = this.buildTime;
    data['applies_to'] = this.appliesTo;
    return data;
  }
}
