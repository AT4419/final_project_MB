class ItemUser {
  final int id;
  final String name;
  final String userName;
  final String email;

  ItemUser({
    required this.id,
    required this.name,
    required this.userName,
    required this.email,
  });

  factory ItemUser.fromJson(Map<String, dynamic> json) {
    return ItemUser(
      id: json['id'],
      name: json['name'],
      userName: json['username'],
      email: json['email'],
    );
  }
}
