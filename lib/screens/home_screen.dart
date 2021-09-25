import 'package:flutter/material.dart';
import 'package:parent_guide_application/constants/dummy_activities.dart';
import 'package:parent_guide_application/widgets/activity_widget.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ActivityWidget(dActivityModel1),
            ],
          ),
        ),
      ),
    );
  }
}
