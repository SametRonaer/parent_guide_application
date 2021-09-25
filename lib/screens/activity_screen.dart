import 'package:flutter/material.dart';
import 'package:parent_guide_application/constants/dummy_activities.dart';
import 'package:parent_guide_application/widgets/video_widget.dart';

class ActivityScreen extends StatelessWidget {
  static final routeName = "/activity-screen";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blue.shade50,
        body: Column(
          children: [
            VideoWidget("nXL61RcVxJ8"),
            SizedBox(height: 5),
            _getPropertiesOfActivity(),
            _getTitleAndDescriptionField(),
            _getRowButtons(),
          ],
        ),
      ),
    );
  }

  Container _getTitleAndDescriptionField() {
    return Container(
      width: double.infinity,
      height: 150,
      color: Colors.blue.shade50,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            dActivityModel1.title.toString(),
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          Text(dActivityModel1.purpose.toString()),
        ],
      ),
    );
  }

  Row _getPropertiesOfActivity() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text("3 months and up"),
        Text("Physical"),
        Text("Curiosity Moves Us"),
      ],
    );
  }

  Container _getRowButtons() {
    return Container(
      width: double.infinity,
      height: 50,
      color: Colors.blue.shade50,
      padding: EdgeInsets.only(bottom: 5, left: 40, right: 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _getLabelledIconButton("Done", Icons.check_circle_outline),
          _getLabelledIconButton("Rate", Icons.star_rate),
          _getLabelledIconButton("Share", Icons.share),
        ],
      ),
    );
  }

  GestureDetector _getLabelledIconButton(String label, IconData iconData) {
    return GestureDetector(
      onTap: () {
        print("Pressed");
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            iconData,
            size: 26,
            color: Colors.lightBlue.shade700,
          ),
          Text(
            label,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.grey.shade600,
            ),
          )
        ],
      ),
    );
  }
}
