import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nittfest/controllers/about_controller.dart';
import 'package:nittfest/widgets/about/department_card.dart';

class Departments extends GetView<DepartmentController> {
  const Departments({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => controller.obx(
      (departments) => Container(
          margin: const EdgeInsets.symmetric(
            vertical: 16,
          ),
          child: Container(
              margin: const EdgeInsets.only(top: 10),
              height: 200,
              child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: departments!.departments
                      .asMap()
                      .map((i, event) => MapEntry(
                          i,
                          DepartmentsCard(
                            index: i,
                            department: event,
                          )))
                      .values
                      .toList()))),
      onEmpty: Container(
        child: const Center(
          child: Text('Unable To Fetch Departments'),
        ),
        margin: const EdgeInsets.only(top: 20),
      ));
}
