class User {
  User(
      {required this.name,
      required this.email,
      required this.photoUrl,
      required this.id});
  late String name;
  late String email;
  late String photoUrl;
  late String id;

  User.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    email = json["email"];
    photoUrl = json["photo_url"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["name"] = name;
    data["email"] = email;
    data["photo_url"] = photoUrl;
    return data;
  }
}
