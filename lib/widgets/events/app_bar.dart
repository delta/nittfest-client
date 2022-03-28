import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nittfest/controllers/events_controller.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<EventController>();
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 24.0),
        height: 50,
        decoration: BoxDecoration(
          color: const Color(0xff121222),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          shape: BoxShape.rectangle,
          border: Border.all(color: Colors.white, width: 1),
        ),
        child: Obx(() =>
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Expanded(
                  flex: 3,
                  child: TextField(
                    onTap: () => controller.searchMode.value = true,
                    onChanged: (value) {
                      if (controller.searchMode.value) controller.searchEvent();
                    },
                    controller: controller.textEditingController,
                    cursorColor: Colors.white,
                    decoration: const InputDecoration(
                        hintStyle: TextStyle(color: Colors.white70),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.transparent,
                          ),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.transparent,
                          ),
                        ),
                        hintText: 'Search Events...'),
                    style: const TextStyle(color: Colors.white, fontSize: 14),
                  )),
              Flexible(
                  flex: 1,
                  child: IconButton(
                      onPressed: () {
                        if (!controller.searchMode.value) {
                          controller.searchMode.value = true;
                          controller.searchEvent();
                        } else {
                          controller.searchMode.value = false;
                          controller.clearSearch(context);
                        }
                      },
                      icon: Icon(
                        controller.searchMode.value
                            ? Icons.close
                            : Icons.search,
                        color: Colors.white,
                        size: 20,
                      )))
            ])));
  }
}
