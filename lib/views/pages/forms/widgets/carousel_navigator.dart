import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nittfest/controllers/forms_controller.dart';
import 'package:nittfest/views/themes/app_themes.dart';

class CarouselNavigator extends StatelessWidget {
  const CarouselNavigator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final FormsController controller = Get.find<FormsController>();
    return Container(
        decoration: BoxDecoration(
          color: AppTheme.bodycolor,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        child: Row(children: [
          Obx(() => IconButton(
                onPressed: controller.pageNumber.value > 1
                    ? controller.previousPage
                    : null,
                icon: Icon(
                  Icons.keyboard_arrow_up,
                  color: controller.pageNumber.value > 1
                      ? AppTheme.primaryColor
                      : AppTheme.primaryColorLight,
                ),
              )),
          const Divider(),
          Obx(() => IconButton(
              onPressed: controller.pageNumber.value < controller.maxPage
                  ? controller.nextPage
                  : null,
              icon: Icon(
                Icons.keyboard_arrow_down,
                color: controller.pageNumber.value < controller.maxPage
                    ? AppTheme.primaryColor
                    : AppTheme.primaryColorLight,
              ))),
        ]));
  }
}
