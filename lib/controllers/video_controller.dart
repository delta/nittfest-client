import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoController extends GetxController {
  late YoutubePlayerController videoController;

  @override
  void onInit() {
    var args = Get.arguments;
    videoController = YoutubePlayerController(
        initialVideoId: YoutubePlayer.convertUrlToId(args[0])!,
        flags: const YoutubePlayerFlags());
    super.onInit();
  }

  @override
  void onClose() {
    videoController.dispose();
    super.onClose();
  }
}
