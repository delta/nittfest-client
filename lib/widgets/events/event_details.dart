import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nittfest/controllers/events_controller.dart';
import 'package:nittfest/models/events_response.dart';
import 'package:expandable/expandable.dart';

class EventDetails extends StatelessWidget {
  final Event event;
  const EventDetails({Key? key, required this.event}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<EventController>();
    controller.updateisLaunchable(event.eventLink ?? '', event.formLink ?? '');
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.black87,
            body: Obx(() => CustomScrollView(
                  slivers: [
                    SliverAppBar(
                        toolbarHeight: 50,
                        collapsedHeight: 50,
                        leading: IconButton(
                            onPressed: Get.back,
                            icon: const Icon(
                              Icons.arrow_back,
                              color: Colors.amber,
                            )),
                        expandedHeight: 200,
                        flexibleSpace:
                            Image.asset('assets/bg.png', fit: BoxFit.cover)),
                    SliverToBoxAdapter(
                        child: Container(
                            margin: const EdgeInsets.only(top: 20, bottom: 45),
                            child: Text(event.name ?? '',
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w900)))),
                    if (controller.isRegisterButtonVisible.value ||
                        controller.isWatchButtonVisible.value)
                      SliverToBoxAdapter(
                        child: Row(
                          children: [
                            SizedBox(
                              width: size.width /
                                  ((controller.isRegisterButtonVisible.value &&
                                          controller.isWatchButtonVisible.value)
                                      ? 9
                                      : 3),
                              height: 45,
                            ),
                            if (controller.isRegisterButtonVisible.value)
                              getButton('REGISTER', size, controller),
                            if (controller.isRegisterButtonVisible.value &&
                                controller.isWatchButtonVisible.value)
                              SizedBox(
                                width: size.width / 9,
                                height: 45,
                              ),
                            if (controller.isWatchButtonVisible.value)
                              getButton('WATCH', size, controller)
                          ],
                        ),
                      ),
                    const SliverToBoxAdapter(
                      child: SizedBox(
                        height: 30,
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: getExpandable(
                          'Discription', Text(event.description ?? '')),
                    ),
                    SliverToBoxAdapter(
                        child: getExpandable(
                            'Rule Book', Text(event.rules ?? ''))),
                    SliverToBoxAdapter(
                        child: getExpandable(
                      'Time Line',
                      Column(
                        children: [
                          textValuePair(
                              'Start Time',
                              controller
                                  .formatTimeString(event.startTime ?? '')),
                          textValuePair('End Time ',
                              controller.formatTimeString(event.endTime ?? ''))
                        ],
                      ),
                    )),
                  ],
                ))));
  }

  Widget textValuePair(String title, String value) => Row(children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
            child: Text(title, textAlign: TextAlign.left),
          ),
          flex: 1,
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
            child: Text(value, textAlign: TextAlign.left),
          ),
          flex: 1,
        )
      ]);

  Widget getExpandable(String header, Widget child) => ExpandablePanel(
        expanded: Padding(
          child: child,
          padding: const EdgeInsets.only(left: 10, right: 10),
        ),
        collapsed: const Text(''),
        theme: ExpandableThemeData(
          iconColor: const Color.fromARGB(240, 255, 180, 10),
          animationDuration: const Duration(milliseconds: 500),
          headerAlignment: ExpandablePanelHeaderAlignment.center,
          tapHeaderToExpand: true,
          tapBodyToCollapse: true,
          inkWellBorderRadius: BorderRadius.circular(10),
        ),
        header: Padding(
          child: Text(
            header,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w900,
            ),
          ),
          padding: const EdgeInsets.only(left: 10, right: 10),
        ),
      );

  Widget getButton(String text, Size size, EventController controller) =>
      ElevatedButton(
        onPressed: () {
          (text == 'WATCH')
              ? controller.watchButtonPressed(
                  event.eventLink ?? '', event.isEventCompleted, event)
              : controller.registerButtonPressed(
                  event.formLink ?? '', event.isRegCompleted);
        },
        style: ElevatedButton.styleFrom(
            padding: EdgeInsets.zero,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
        child: Ink(
          decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [
                  Color.fromARGB(240, 255, 180, 10),
                  Color.fromARGB(220, 255, 100, 20)
                ],
              ),
              borderRadius: BorderRadius.circular(5)),
          child: Container(
            width: size.width / 3,
            height: 45,
            alignment: Alignment.center,
            child: Text(
              text,
              style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                  color: Colors.black),
            ),
          ),
        ),
      );
}
