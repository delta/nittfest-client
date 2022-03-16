import 'package:flutter/material.dart';
import 'package:nittfest/views/screens/about.dart';
import 'package:nittfest/views/screens/events.dart';
import 'package:nittfest/views/screens/game.dart';
import 'package:nittfest/views/screens/nf.dart';
import 'package:nittfest/views/screens/scores.dart';

List<String> iconItems = [
  'assets/event.png',
  'assets/scores.png',
  'assets/logo_nf.png',
  'assets/game.png',
  'assets/more.png'
];

List<Widget> widgetItems = const [
  Events(),
  Scores(),
  NF(),
  Games(),
  About(),
];

List<String> labelItems = const [
  'EVENTS',
  'SCORES',
  'NITTFEST',
  'GAMES',
  'ABOUT',
];
