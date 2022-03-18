import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class EventsController extends GetxController
    with GetSingleTickerProviderStateMixin {
  var clusterIndex = 0.obs;
  var eventIndex = 0.obs;
  var startAnimation = false.obs;

  // key that is used to access the Animated List
  final GlobalKey<AnimatedListState> listKey = GlobalKey<AnimatedListState>();

  // This holds the items
  List<int> eventItems = [];

  // This holds the item count
  int counter = 0;

  late final AnimationController animcontroller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  );
  late final Animation<Offset> offsetAnimation = Tween<Offset>(
    end: Offset.zero,
    begin: const Offset(1.5, 0.0),
  ).animate(CurvedAnimation(
    parent: animcontroller,
    curve: Curves.easeIn,
  ));

  initialTimer() async {
    await Future.delayed(const Duration(milliseconds: 500));
    startAnimation.value = true;
  }
}
