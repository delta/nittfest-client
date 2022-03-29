import 'dart:convert';

import 'package:nittfest/models/events_response.dart';

DashboardResponse dashboardFromJson(String str) =>
    DashboardResponse.fromJson(json.decode(str));

String dashboardToJson(DashboardResponse data) => json.encode(data.toJson());

class DashboardResponse {
  DashboardResponse({
    required this.department,
    required this.point,
    required this.position,
    required this.upcomingEvents,
  });

  final String department;
  final double point;
  final int position;
  final List<Event> upcomingEvents;

  factory DashboardResponse.fromJson(Map<String, dynamic> json) =>
      DashboardResponse(
        department: json['department'],
        point: json['point'],
        position: json['position'],
        // ignore: unnecessary_lambdas
        upcomingEvents: json['upcoming_events'] == null
            ? []
            : List<Event>.from(
                json['upcoming_events'].map(Event.fromJson)),
      );

  Map<String, dynamic> toJson() => {
        'department': department,
        'point': point,
        'position': position,
        'upcoming_events':
            List<dynamic>.from(upcomingEvents.map((x) => x.toJson())),
      };
}
