import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class EventsController extends GetxController {
  var clusterIndex = 0.obs;
  var eventIndex = 0.obs;
  var startAnimation = false.obs;
  
  // key that is used to access the Animated List
  final GlobalKey<AnimatedListState> listKey = GlobalKey<AnimatedListState>();

  // This holds the items
  List<int> eventItems = [];

  // This holds the item count
  int counter = 0;
  
  initialTimer() async {
    await Future.delayed(const Duration(milliseconds: 500));
    startAnimation.value = true;
  }
}
