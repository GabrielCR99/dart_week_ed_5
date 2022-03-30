class UserModel {
  final int id;
  final String name;
  final String email;
  final String password;

  const UserModel(this.id, this.name, this.email, this.password);

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      map['id']?.toInt() ?? 0,
      map['name'] ?? '',
      map['email'] ?? '',
      map['password'] ?? '',
    );
  }
}
