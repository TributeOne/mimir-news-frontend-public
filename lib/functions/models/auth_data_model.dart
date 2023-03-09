class AuthData {
  int? id;
  String? firstName;
  String? lastName;
  String? email;
  List<String>? roles;
  int? iat;
  int? exp;

  AuthData(
      {this.id,
      this.firstName,
      this.lastName,
      this.email,
      this.roles,
      this.iat,
      this.exp});

  AuthData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    roles = json['roles'].cast<String>();
    iat = json['iat'];
    exp = json['exp'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['email'] = email;
    data['roles'] = roles;
    data['iat'] = iat;
    data['exp'] = exp;
    return data;
  }
}
