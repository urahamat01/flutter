import 'dart:convert';

<<<<<<< HEAD

class Profile{
=======
class Profile {
>>>>>>> bloc
  int id;
  String name;
  String email;
  int age;

<<<<<<< HEAD
  Profile({this.id =0, this.name, this.email, this.age});

  factory Profile.fromJson(Map<String, dynamic> map){
    return Profile(
    id: map["id"],
      name: map["name"],
      email: map["email"],
      age: map["age"]);
  }

  Map<String, dynamic>toJson(){
    return{"id":id, "name":name, "email":email, "age":age};

=======
  Profile({this.id = 0, this.name, this.email, this.age});

  factory Profile.fromJson(Map<String, dynamic> map) {
    return Profile(
        id: map["id"], name: map["name"], email: map["email"], age: map["age"]);
  }

  Map<String, dynamic> toJson() {
    return {"id": id, "name": name, "email": email, "age": age};
>>>>>>> bloc
  }

  @override
  String toString() {
    return 'Profile{id: $id, name: $name, email: $email, age: $age}';
  }
<<<<<<< HEAD
  }

  List<Profile> profileFromJson(String jsonData) {
    final data = json.decode(jsonData);
    return List<Profile>.from(data.map((item) => Profile.fromJson(item)));
  }

  String profileToJson(Profile data){
    final jsonData = data.toJson();
    return json.encode(jsonData);
  }
=======
}

//data sourch
List<Profile> profileFromJson(String jsonData) {
  final data = json.decode(jsonData);
  return List<Profile>.from(data.map((item) => Profile.fromJson(item)));
}


String profileToJson(Profile data) {
  final jsonData = data.toJson();
  return json.encode(jsonData);
}
>>>>>>> bloc
