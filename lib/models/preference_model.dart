import 'dart:convert';

Preferences preferencesFromJson(String str) =>
    Preferences.fromJson(json.decode(str).map((x) => Preferences.fromJson(x)));

String preferencesToJson(Preferences data) => json.encode(data.toJson());

class Preferences {
  Preferences(
      {required this.preference1,
      required this.preference2,
      required this.preference3,
      required this.preference4,
      required this.preference5,
      required this.preference6});

  final String preference1;
  final String preference2;
  final String preference3;
  final String preference4;
  final String preference5;
  final String preference6;

  factory Preferences.fromJson(Map<String, dynamic> json) => Preferences(
        preference1: json['preference_1'],
        preference2: json['preference_2'],
        preference3: json['preference_3'],
        preference4: json['preference_4'],
        preference5: json['preference_5'],
        preference6: json['preference_6'],
      );

  Map<String, dynamic> toJson() => {
        'preference_1': preference1,
        'preference_2': preference2,
        'preference_3': preference3,
        'preference_4': preference4,
        'preference_5': preference5,
        'preference_6': preference6,
      };
}
