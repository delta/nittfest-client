import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:nittfest/config/themes.dart';
import 'package:nittfest/controllers/dashboard_controller.dart';

class Profile extends GetView<DashboardController> {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => controller.obx(
        (scores) => Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(scores?.department ?? '',
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold)),
              Card(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  shadowColor: Colors.grey,
                  child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                          gradient: AppTheme.cardbg),
                      child: IntrinsicHeight(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ProfileDetails(
                                icon: Icons.leaderboard_outlined,
                                desc: 'Position',
                                value: scores?.position.toString() ?? ''),
                            const VerticalDivider(
                              color: Colors.white70,
                              thickness: 2,
                            ),
                            ProfileDetails(
                                icon: Icons.star_border_outlined,
                                desc: 'Points',
                                value: scores?.point.toString() ?? ''),
                          ],
                        ),
                      )))
            ]),
        onLoading: const Center(child: CircularProgressIndicator()),
        onEmpty: Container(
          child: const Center(
            child: Text('Unable To Fetch Position And Departments'),
          ),
          margin: const EdgeInsets.only(top: 40),
        ),
        onError: (error) => Text(error!),
      );
}

class ProfileDetails extends StatelessWidget {
  final IconData icon;
  final String desc;
  final String value;
  const ProfileDetails(
      {Key? key, required this.icon, required this.desc, required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Column(children: [
        Icon(
          icon,
          color: Colors.white,
          size: 35,
        ),
        Text(desc,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w400,
              color: Colors.white,
            )),
        Text(value,
            style: const TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            )),
      ]);
}
