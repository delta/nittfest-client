// To parse this JSON data, do
//
//     final scoresResponse = scoresResponseFromMap(jsonString);

// ignore_for_file: unnecessary_lambdas

import 'dart:convert';

List<ScoresResponse> scoresResponseFromMap(String str) =>
    List<ScoresResponse>.from(
        json.decode(str).map((x) => ScoresResponse.fromMap(x)));

String scoresResponseToMap(List<ScoresResponse> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class ScoresResponse {
  ScoresResponse({
    required this.department,
    this.position = '00',
    required this.totalPoints,
    required this.clusterPoints,
  });

  final String department;
  String position;
  final int totalPoints;
  final List<ClusterPoint> clusterPoints;

  factory ScoresResponse.fromMap(Map<String, dynamic> json) => ScoresResponse(
        department: json['department'],
        totalPoints: json['total_points'],
        clusterPoints: List<ClusterPoint>.from(
            json['cluster_points'].map((x) => ClusterPoint.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        'department': department,
        'total_points': totalPoints,
        'cluster_points':
            List<dynamic>.from(clusterPoints.map((x) => x.toMap())),
      };
}

class ClusterPoint {
  ClusterPoint({
    required this.cluster,
    required this.points,
  });

  final String cluster;
  final int points;

  factory ClusterPoint.fromMap(Map<String, dynamic> json) => ClusterPoint(
        cluster: json['cluster'],
        points: json['points'],
      );

  Map<String, dynamic> toMap() => {
        'cluster': cluster,
        'points': points,
      };
}
