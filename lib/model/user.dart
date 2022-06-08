class User {
  final String id;
  final String name;
  final int age;
  final String gender;

  User(
      {this.id = '',
      required this.name,
      required this.age,
      required this.gender});
}
