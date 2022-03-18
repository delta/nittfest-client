import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:nittfest/models/events_response.dart';
import 'package:nittfest/services/api_services.dart';
import 'package:nittfest/services/storage_services.dart';
import 'package:nittfest/widgets/events/video_view.dart';
import 'package:url_launcher/url_launcher.dart';

class EventController extends GetxController
    with StateMixin<List<EventResponse>> {
  final api = Get.find<ApiServices>().api;
  final storage = Get.find<StorageServices>();
  final currentCluster = 0.obs;

  @override
  void onReady() {
    getEvents();
    super.onReady();
  }

  Future<void> getEvents() async {
    api.getEvents(storage).then((response) {
      change(response, status: RxStatus.success());
    }, onError: (err) {
      change(null, status: RxStatus.error(err.toString()));
      Get.snackbar('Failed To Get Events', 'Check Your Internet Connection');
    });
  }

  List<Event> upcomingEvents(List<EventResponse> events) {
    List<Event> upcomingEvents = [];
    for (var event in events) {
      upcomingEvents.addAll(event.events);
    }
    return upcomingEvents;
  }

  void playVideo(Event event) async {
    bool isLaunchable = await canLaunch(
        event.eventLink ?? 'https://www.youtube.com/watch?v=W-rHIsDFrzQ');
    if (isLaunchable) {
      Get.to(VideoView(event: event),
          arguments: ['https://www.youtube.com/watch?v=W-rHIsDFrzQ']);
    } else {
      Get.snackbar('Event is Not Started Yet!', '');
    }
  }
}
