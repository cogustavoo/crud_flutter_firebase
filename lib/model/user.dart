class User {
  String id;
  final String name;
  final String age;
  final String gender;

  User(
      {this.id = '',
      required this.name,
      required this.age,
      required this.gender});

  factory User.fromJson(Map<String, dynamic> data) => User(
      id: data['id'],
      name: data['name'],
      age: data['age'],
      gender: data['gender']);

  Map<String, dynamic> toJson() =>
      {'id': id, 'name': name, 'age': age, 'gender': gender};
}
