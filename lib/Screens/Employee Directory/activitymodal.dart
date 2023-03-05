class ActivityModel {
  late String id,name;
 late List<String> plans;

  ActivityModel({required this.id, required this.name});

  ActivityModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}