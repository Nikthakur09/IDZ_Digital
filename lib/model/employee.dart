class Employee {
  late String name;
  late int age;
  late int salary;

  Employee({required this.name, required this.age, required this.salary});

  factory Employee.fromJSON(Map<String, dynamic> json) {
    return Employee(
        name: json['name'], age: json['age'], salary: json['salary']);
  }
  static List<Employee> fromJSONArray(List<dynamic> jsonArray) {
    return jsonArray.map((json) => Employee.fromJSON(json)).toList();
  }
}
