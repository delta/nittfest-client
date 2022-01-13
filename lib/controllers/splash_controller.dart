import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:rive/rive.dart';

class SplashController extends GetxController {
  late SMINumber growInput;
  void onRiveTreeInit(Artboard artboard) {
    final treeController =
        StateMachineController.fromArtboard(artboard, 'State Machine 1')!;
    artboard.addController(treeController);
    growInput = treeController.findInput<double>('input') as SMINumber;
    growInput.change(0);
  }

  void treeGrow() =>
      (growInput.value) < 100 ? growInput.change((growInput.value) + 10) : 100;

  void treeShrink() =>
      (growInput.value) >= 10 ? growInput.change((growInput.value) - 10) : 0;
}
