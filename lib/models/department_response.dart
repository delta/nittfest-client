import 'dart:convert';

DepartmentResponse departmentResponseFromJson(String str) =>
    DepartmentResponse.fromJson(json.decode(str));

String departmentResponseToJson(DepartmentResponse data) =>
    json.encode(data.toJson());

class DepartmentResponse {
  DepartmentResponse({
    required this.departments,
  });

  final List<Department> departments;

  factory DepartmentResponse.fromJson(Map<String, dynamic> json) =>
      DepartmentResponse(
        departments:
            // ignore: unnecessary_lambdas
            List<Department>.from(json['departments'].map(Department.fromJson)),
      );

  Map<String, dynamic> toJson() => {
        'departments': List<dynamic>.from(departments.map((x) => x.toJson())),
      };
}

class Department {
  Department({
    required this.name,
    required this.description,
  });

  final String name;
  final String description;

  factory Department.fromJson(Map<String, dynamic> json) => Department(
        name: json['name'],
        description: json['description'],
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'description': description,
      };
}
