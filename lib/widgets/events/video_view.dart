import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:nittfest/controllers/video_controller.dart';
import 'package:nittfest/models/events_response.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoView extends StatelessWidget {
  final Event event;
  const VideoView({Key? key, required this.event}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VideoController());
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text(event.name!),
          backgroundColor: Colors.black,
        ),
        body: Center(
            child: YoutubePlayer(
          controller: controller.videoController,
          showVideoProgressIndicator: true,
          progressIndicatorColor: Colors.blueAccent,
        )));
  }
}
