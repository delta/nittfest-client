import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:nittfest/controllers/scores_controller.dart';

class Profile extends GetView<ScoresController> {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => controller.obx(
        (scores) {
          List<String> profile = controller.getProfile(scores!);
          return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(profile[0],
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold)),
                Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 24),
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        border: Border.all(width: 1.0, color: Colors.white),
                        gradient: const LinearGradient(colors: [
                          Color.fromARGB(255, 43, 24, 86),
                          Color.fromARGB(255, 79, 45, 140),
                          Color.fromARGB(255, 43, 24, 86),
                        ])),
                    child: IntrinsicHeight(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ProfileDetails(
                              icon: Icons.leaderboard_outlined,
                              desc: 'Position',
                              value: profile[1]),
                          const VerticalDivider(
                            color: Colors.white70,
                            thickness: 2,
                          ),
                          ProfileDetails(
                              icon: Icons.star_border_outlined,
                              desc: 'Points',
                              value: profile[2]),
                        ],
                      ),
                    ))
              ]);
        },
        onLoading: const Center(child: CircularProgressIndicator()),
        onEmpty: const Text('No data found'),
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
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w400)),
        Text(value,
            style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
      ]);
}
