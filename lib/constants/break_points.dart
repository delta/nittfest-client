import 'package:get/get_state_manager/get_state_manager.dart';

class BreakPoints {
  static double desktop = 1200;
  static double tablet = 800;
  static double watch = 300;

  static ResponsiveScreenSettings getResponsiveScreenSettings() =>
      ResponsiveScreenSettings(
          desktopChangePoint: desktop,
          tabletChangePoint: tablet,
          watchChangePoint: watch);
}
