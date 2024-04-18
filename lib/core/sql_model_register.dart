class AccountModel {
  int? id;
  String? username;
  String? email;
  String? password;

  AccountModel({
    this.id,
    required this.username,
    required this.email,
    required this.password,
});

  AccountModel.fromMap(Map<String,dynamic> map) {
    if (id != null)id = map['id'];
    username = map['username'];
    email = map['email'];
    password = map['password'];
  }

  Map<String, Object?> toMap() {
    Map <String , dynamic> map = {};
    if (map['id'] != null)map['id'] = id;
    map['username'] = username;
    map['email'] = email;
    map['password'] = password;
    return map;
  }
}
