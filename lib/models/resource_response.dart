import 'dart:convert';

ResourceResponse resourceResponseFromJson(String str) =>
    ResourceResponse.fromJson(json.decode(str));

class ResourceResponse {
  final String? email;

  final String? name;

  final String? phoneNumber;

  final String? gender;
  final String? jwt;

  ResourceResponse(
      {this.email, this.name, this.phoneNumber, this.gender, this.jwt});

  factory ResourceResponse.fromRawJson(String str) =>
      ResourceResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ResourceResponse.fromJson(Map<String, dynamic> json) =>
      ResourceResponse(
        email: json['email'],
        name: json['name'],
        phoneNumber: json['phoneNumber'],
        gender: json['gender'],
        jwt: json['jwt'],
      );

  Map<String, dynamic> toJson() => {
        'email': email,
        'name': name,
        'phoneNumber': phoneNumber,
        'gender': gender,
        'jwt': jwt
      };
}
