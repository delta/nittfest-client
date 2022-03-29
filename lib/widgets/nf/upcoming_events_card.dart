import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/instance_manager.dart';
import 'package:nittfest/controllers/events_controller.dart';
import 'package:nittfest/models/events_response.dart';
import 'package:nittfest/widgets/events/event_details.dart';

class UpcomingEventsCard extends StatelessWidget {
  final Event event;
  final int index;
  const UpcomingEventsCard({Key? key, required this.event, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        width: size.width / 2.5,
        decoration: BoxDecoration(
          border: Border.all(width: 1.0, color: Colors.white),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          color: Colors.black54,
        ),
        child: InkWell(
            onTap: () => Get.to(EventDetails(event: event)),
            child: Center(
                child: Stack(
              children: [
                Container(
                    width: size.width,
                    height: 175,
                    foregroundDecoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.5),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                          image: NetworkImage(getImage()),
                          fit: BoxFit.fill,
                          onError: (context, stackTrace) => const Center(
                                child: Text('Unable to fetch image'),
                              )),
                    )),
                Positioned(
                    left: 10,
                    bottom: 10,
                    child: Text(event.name!,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontWeight: FontWeight.w900,
                          fontFamily: 'Riffic',
                          fontSize: 30,
                        )))
              ],
            ))));
  }

  String getImage() {
    String cluster = '';
    final controller = Get.find<EventController>();
    for (EventResponse clusters in controller.totalEvents) {
      for (Event event in clusters.events) {
        if (event.name == this.event.name) {
          cluster = clusters.cluster ?? '';
        }
      }
    }
    switch (cluster) {
      case 'Arts':
        return 'https://i.imgur.com/fJ1Rr3e.png';
      case 'Culturals':
        return 'https://i.imgur.com/cxQ0BFS.png';
      case 'Gaming':
        return 'https://i.imgur.com/UB609vt.png';
      case 'Design and Media':
        return 'https://i.imgur.com/XfITMdN.png';
      case 'Hindi Lits':
        return 'https://i.imgur.com/f20cFKb.png';
      case 'English Lits':
        return 'https://i.imgur.com/CD6lhwF.png';
      case 'Tamil Lits':
        return 'https://i.imgur.com/i3dTrnV.png';
      case 'Telugu Lits':
        return 'https://i.imgur.com/wlVuNb2.png';
      default:
        return 'https://i.imgur.com/i3dTrnV.png';
    }
  }
}
