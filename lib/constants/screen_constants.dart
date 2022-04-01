import 'package:flutter/material.dart';
import 'package:nittfest/views/screens/about.dart';
import 'package:nittfest/views/screens/events.dart';
import 'package:nittfest/views/screens/nf.dart';
import 'package:nittfest/views/screens/scores.dart';

List<String> iconItems = [
  'assets/event.png',
  'assets/scores.png',
  'assets/logo_nf.png',
  'assets/more.png'
];

List<Widget> widgetItems = const [
  Events(),
  Scores(),
  NF(),
  About(),
];

List<String> labelItems = const [
  'EVENTS',
  'SCORES',
  'NITTFEST',
  'ABOUT',
];
