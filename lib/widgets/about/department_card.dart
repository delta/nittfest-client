import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/instance_manager.dart';
import 'package:nittfest/models/department_response.dart';
import 'package:nittfest/widgets/about/department_details.dart';

class DepartmentsCard extends StatelessWidget {
  final Department department;
  final int index;
  const DepartmentsCard(
      {Key? key, required this.department, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: InkWell(
            onTap: () => Get.to(DepartmentDetails(department: department)),
            child: Center(
                child: Stack(
              children: [
                Container(
                  width: size.width / 2.5,
                  height: 175,
                  foregroundDecoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.5),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image:
                          const NetworkImage('https://i.imgur.com/cxQ0BFS.png'),
                      onError: (context, stackTrace) => const Center(
                        child: Text('Unable to fetch image'),
                      ),
                    ),
                  ),
                ),
                Positioned(
                    left: 10,
                    bottom: 10,
                    child: Text(
                      department.name,
                      textAlign: TextAlign.center,
                    ))
              ],
            ))));
  }
}
