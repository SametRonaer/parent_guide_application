import 'package:flutter/material.dart';
import 'package:parent_guide_application/constants/dummy_activities.dart';
import 'package:parent_guide_application/widgets/activity_widget.dart';

class HomeScreen extends StatelessWidget {
  List<Widget> activities = [
    ActivityWidget(dActivityModel1),
    ActivityWidget(dActivityModel1),
    ActivityWidget(dActivityModel1),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView.builder(
          itemBuilder: (context, index) => activities[index],
          itemCount: activities.length,
        ),
        // SingleChildScrollView(
        //   scrollDirection: Axis.vertical,
        //   child: Column(
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     children: [
        //       ActivityWidget(dActivityModel1),
        //       ActivityWidget(dActivityModel1),
        //       ActivityWidget(dActivityModel1),
        //     ],
        //   ),
        // ),
      ),
    );
  }
}
