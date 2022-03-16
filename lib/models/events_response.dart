// ignore_for_file: unnecessary_lambdas

import 'dart:convert';

List<EventResponse> eventResponseFromJson(String? str) =>
    List<EventResponse>.from(
        json.decode(str!).map((x) => EventResponse.fromJson(x)));

String? eventResponseToJson(List<EventResponse> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class EventResponse {
  EventResponse({
    this.cluster,
    required this.events,
  });

  final String? cluster;
  final List<Event> events;

  factory EventResponse.fromJson(Map<String?, dynamic> json) => EventResponse(
        cluster: json['cluster'],
        events: List<Event>.from(json['events'].map((x) => Event.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        'cluster': cluster,
        'events': List<dynamic>.from(events.map((x) => x.toJson())),
      };
}

class Event {
  Event({
    this.name,
    this.description,
    this.rules,
    this.formLink,
    this.eventLink,
    this.imageLink,
    this.startTime,
    this.endTime,
    this.date,
    this.isRegCompleted,
    this.isEventCompleted,
    required this.points,
  });

  final String? name;
  final String? description;
  final String? rules;
  final String? formLink;
  final String? eventLink;
  final String? imageLink;
  final String? startTime;
  final String? endTime;
  final String? date;
  final bool? isRegCompleted;
  final bool? isEventCompleted;
  final List<Point> points;

  factory Event.fromJson(Map<String?, dynamic> json) => Event(
        name: json['name'],
        description: json['description'],
        rules: json['rules'],
        formLink: json['form_link'],
        eventLink: json['event_link'],
        imageLink: json['image_link'],
        startTime: json['start_time'],
        endTime: json['end_time'],
        date: json['date'],
        isRegCompleted: json['is_reg_completed'],
        isEventCompleted: json['is_event_completed'],
        points: List<Point>.from(json['points'].map((x) => Point.fromJson(x))),
      );

  Map<String?, dynamic> toJson() => {
        'name': name,
        'description': description,
        'rules': rules,
        'form_link': formLink,
        'event_link': eventLink,
        'image_link': imageLink,
        'start_time': startTime,
        'end_time': endTime,
        'date': date,
        'is_reg_completed': isRegCompleted,
        'is_event_completed': isEventCompleted,
        'points': List<dynamic>.from(points.map((x) => x.toJson())),
      };
}

class Point {
  Point({
    this.point,
    this.position,
    this.department,
  });

  final double? point;
  final int? position;
  final String? department;

  factory Point.fromJson(Map<String?, dynamic> json) => Point(
        point: json['point'],
        position: json['position'],
        department: json['department'],
      );

  Map<String?, dynamic> toJson() => {
        'point': point,
        'position': position,
        'department': department,
      };
}
