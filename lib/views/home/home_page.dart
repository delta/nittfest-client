import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:nittfest/config/environment.dart';
import 'package:nittfest/controllers/loader_controller.dart';

class HomePage extends GetView<LoaderController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      const Center(child: Text(Environment.clientId));
}
