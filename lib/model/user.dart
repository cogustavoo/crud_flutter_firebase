class User {
  final String id;
  final String name;
  final String age;
  final String gender;

  User(
      {this.id = '',
      required this.name,
      required this.age,
      required this.gender});

  factory User.fromJson(Map<String, dynamic> json) =>
      User(name: json['name'], age: json['age'], gender: json['gender']);

  Map<String, dynamic> toJson() => {'name': name, 'age': age, 'gender': gender};
}
