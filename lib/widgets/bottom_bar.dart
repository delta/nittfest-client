import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:nittfest/config/themes.dart';
import 'package:nittfest/constants/screen_constants.dart';
import 'package:nittfest/controllers/home_controller.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();
    return Obx(() => CurvedNavigationBar(
        items: iconItems
            .asMap()
            .map((index, image) => MapEntry(
                index,
                Padding(
                    padding: const EdgeInsets.all(4),
                    child: Image.asset(image,
                        height:
                            controller.selectedIndex.value != index ? 20 : 26,
                        color: controller.selectedIndex.value != index
                            ? Colors.grey.shade600
                            : AppTheme.bottomIconColor))))
            .values
            .toList(),
        backgroundColor: Colors.transparent,
        color: AppTheme.bottombarBg,
        buttonBackgroundColor: AppTheme.bottomIconBg,
        index: controller.selectedIndex.value,
        height: 55,
        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(milliseconds: 600),
        onTap: (index) {
          controller.selectedIndex.value = index;
          controller.onPageChanged();
        }));
  }
}
