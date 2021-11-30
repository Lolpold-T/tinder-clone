class UserModel {
  String? img;
  String? name;
  String? age;
  String? likes;

  UserModel({this.img, this.name, this.age, this.likes});

  UserModel.fromJson(Map<String, dynamic> json) {
    this.img = json["img"];
    this.name = json["name"];
    this.age = json["age"];
    this.likes = json["likes"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["img"] = this.img;
    data["name"] = this.name;
    data["age"] = this.age;
    data["likes"] = this.likes;
    return data;
  }
}
