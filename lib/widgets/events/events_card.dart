import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:nittfest/models/events_response.dart';
import 'package:nittfest/widgets/events/event_details.dart';

class EventCard extends StatelessWidget {
  final Event event;
  final int index;
  final String cluster;
  const EventCard(
      {Key? key,
      required this.event,
      required this.index,
      required this.cluster})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      height: 175,
      child: InkWell(
          onTap: () => Get.to(EventDetails(event: event)),
          child: Center(
              child: Stack(
            children: [
              Container(
                  foregroundDecoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.5),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(getImage(),
                        errorBuilder: (context, error, stackTrace) =>
                            const Center(
                              child: Text('Unable to fetch image'),
                            )),
                  )),
              Positioned(
                  left: 10,
                  bottom: 10,
                  child: Text(
                    event.name ?? '',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontWeight: FontWeight.w900,
                      fontFamily: 'Riffic',
                      fontSize: 32,
                    ),
                  ))
            ],
          ))));
  String getImage() {
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
