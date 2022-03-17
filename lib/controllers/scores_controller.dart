import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:nittfest/models/scores_response.dart';
import 'package:nittfest/services/api_services.dart';
import 'package:nittfest/services/storage_services.dart';

class ScoresController extends GetxController
    with StateMixin<List<ScoresResponse>> {
  final api = Get.find<ApiServices>().api;
  final storage = Get.find<StorageServices>();
  final expandedIndex = (-1).obs;

  @override
  void onReady() {
    getScores();
    super.onReady();
  }

  Future<void> getScores() async {
    api.getScores(storage).then((response) {
      change(sort(response), status: RxStatus.success());
    }, onError: (err) {
      change(null, status: RxStatus.error(err.toString()));
      Get.snackbar('Failed To Get Events', 'Check Your Internet Connection');
    });
  }

  List<ScoresResponse> sort(List<ScoresResponse> scores) {
    scores.sort((a, b) => b.totalPoints.compareTo(a.totalPoints));
    int pos = 1;
    int prevScore = scores[0].totalPoints;
    scores[0].position = twoDigitPosition(pos);
    for (var score in scores) {
      if (score.totalPoints == prevScore) {
        score.position = twoDigitPosition(pos);
      } else {
        score.position = twoDigitPosition(++pos);
      }
    }
    return scores;
  }

  List<String> getProfile(List<ScoresResponse> scores) {
    List<String> profile = [];
    const dept = 'ICE';
    var response = scores.where((element) => element.department == dept).first;
    profile.add(response.department);
    profile.add(response.position);
    profile.add(response.totalPoints.toString());
    return profile;
  }

  String twoDigitPosition(int pos) {
    if (pos < 10) {
      return '0' + pos.toString();
    }
    return pos.toString();
  }
}
