import 'dart:convert';

Preferences preferencesFromJson(String str) =>
    Preferences.fromJson(json.decode(str).map((x) => Preferences.fromJson(x)));

String preferencesToJson(Preferences data) => json.encode(data.toJson());

class Preferences {
  Preferences(
      {required this.preference1,
      required this.preference2,
      required this.preference3});

  final String preference1;
  final String preference2;
  final String preference3;

  factory Preferences.fromJson(Map<String, dynamic> json) => Preferences(
        preference1: json['preference_1'],
        preference2: json['preference_2'],
        preference3: json['preference_3'],
      );

  Map<String, dynamic> toJson() => {
        'preference_1': preference1,
        'preference_2': preference2,
        'preference_3': preference3,
      };
}
