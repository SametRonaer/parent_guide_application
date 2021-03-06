import 'package:flutter/material.dart';
import 'package:parent_guide_application/constants/dummy_activities.dart';
import 'package:parent_guide_application/widgets/activity_widget.dart';

class MyPlanScreen extends StatelessWidget {
  static final routeName = "/my-plan-screen";
  List<Widget> activities = [
    ActivityWidget(dActivityModel1, "b4-b-6ZQWzU", 1, Colors.blue.shade500),
    ActivityWidget(dActivityModel1, "5f-teKd91lg", 2, Colors.yellow.shade800),
    ActivityWidget(dActivityModel1, "nXL61RcVxJ8", 3, Colors.red.shade500),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Jeremy's Plan", style: TextStyle(fontSize: 18)),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) => activities[index],
        itemCount: activities.length,
      ),
    );
  }
}
