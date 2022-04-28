class Cost {
  int? food;
  int? gold;

  Cost({this.food, this.gold});

  Cost.fromJson(Map<String, dynamic> json) {
    food = json['Food'];
    gold = json['Gold'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Food'] = this.food;
    data['Gold'] = this.gold;
    return data;
  }
}
