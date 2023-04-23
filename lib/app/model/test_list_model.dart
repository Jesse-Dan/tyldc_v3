// ignore_for_file: public_member_api_docs, sort_constructors_first
class TestDataModel {
  String name;
  String email;
  int age;
  TestDataModel({required this.age, required this.email, required this.name});

  TestDataModel copyWith({
    String? name,
    String? email,
    int? age,
  }) {
    return TestDataModel(
      name: name ?? this.name,
      email: email ?? this.email,
      age: age ?? this.age,
    );
  }
}
