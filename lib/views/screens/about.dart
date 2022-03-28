import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:nittfest/widgets/about/departments.dart';

class About extends StatelessWidget {
  const About({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => SafeArea(
      child: Scaffold(
          backgroundColor: Colors.black87,
          body: Column(children: [
            Expanded(
              child: CustomScrollView(
                slivers: [
                  SliverAppBar(
                      expandedHeight: 200,
                      flexibleSpace:
                          Image.asset('assets/bg.jpeg', fit: BoxFit.cover)),
                  SliverToBoxAdapter(
                    child: Container(
                        padding: const EdgeInsets.only(
                          left: 14,
                          top: 14,
                        ),
                        child: const Text('Departments',
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.w900))),
                  ),
                  const SliverToBoxAdapter(
                    child: Departments(),
                  ),
                  const SliverToBoxAdapter(
                    child: SizedBox(
                      height: 30,
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: getExpandable(
                        'About Us',
                        const Text(
                            'NITT has always believed in the philosophy that the development of an individual is not accomplished through pedantic learning alone but should be complimented by a healthy dose of co-curricular and extra curricular activities too. The foremost example of this philosophy is NITTFEST - an annual extravaganza of fine arts!')),
                  ),
                  SliverToBoxAdapter(
                      child: getExpandable('Contact Us',
                          textValuePair('Santhosh:', '+919500064685'))),
                ],
              ),
              flex: 4,
            ),
          ])));
}

Widget textValuePair(String title, String value) => Row(children: [
      Expanded(
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
          child: Text(title, textAlign: TextAlign.right),
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
