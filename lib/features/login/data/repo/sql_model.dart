class LoginModel {
  int? id;
  late String username;
  late String password;

  LoginModel({
    this.id,
    required this.username,
    required this.password,
});

  LoginModel.fromMap(Map<String,dynamic> map) {
    if (id != null)id = map['id'];
    username = map['username'];
    password = map['password'];
  }


  Map<String, Object?> toMap() {
    Map <String , dynamic> map = {};
    if (map['id'] != null)map['id'] = id;
    map['username'] = username;
    map['password'] = password;
    return map;
  }
}
