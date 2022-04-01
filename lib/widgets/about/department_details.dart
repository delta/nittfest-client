import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nittfest/models/department_response.dart';

class DepartmentDetails extends StatelessWidget {
  final Department department;
  const DepartmentDetails({Key? key, required this.department})
      : super(key: key);

  @override
  Widget build(BuildContext context) => SafeArea(
      child: Scaffold(
          backgroundColor: Colors.black87,
          body: CustomScrollView(slivers: [
            SliverAppBar(
                toolbarHeight: 50,
                collapsedHeight: 50,
                leading: IconButton(
                    onPressed: Get.back,
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.amber,
                    )),
                expandedHeight: 200,
                flexibleSpace:
                    Image.asset('assets/bg.jpeg', fit: BoxFit.cover)),
            SliverToBoxAdapter(
              child: Container(
                  padding: const EdgeInsets.only(bottom: 14, top: 14),
                  child: Text(department.name,
                      style: const TextStyle(
                          fontSize: 24, fontWeight: FontWeight.w900),
                      textAlign: TextAlign.center)),
            ),
            SliverToBoxAdapter(
              child: Container(
                  margin: const EdgeInsets.only(left: 15, right: 15),
                  child: Text(
                    department.description,
                    style: const TextStyle(fontSize: 16),
                  )),
            )
          ])));
}
