import 'package:flutter/material.dart';
import 'package:parent_guide_application/constants/dummy_activities.dart';
import 'package:parent_guide_application/models/activity_model.dart';
import 'package:parent_guide_application/screens/activity_screen.dart';
import 'package:parent_guide_application/widgets/video_widget.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class ActivityWidget extends StatelessWidget {
  final ActivityModel _activityModel;
  final String _videoID;
  ActivityWidget(this._activityModel, this._videoID);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      width: double.infinity,
      // height: 750,
      color: Colors.deepPurple,
      child: Column(
        children: [
          _getActivityTopBar(2),
          _getActivityExplanation(),
          _getVideo(),
          _getColumnButtons(context),
          _getRowButtons(),
          _getCommentsArea(),
        ],
      ),
    );
  }

  Container _getCommentsArea() {
    return Container(
      width: double.infinity,
      color: Colors.grey.shade300,
      padding: EdgeInsets.only(right: 10, left: 10, top: 10),
      child: _getCommentLines(),
    );
  }

  Column _getCommentLines() {
    List<Widget> commentRows = [];
    dComments.forEach((element) {
      commentRows.add(Column(
        children: [
          Row(
            children: [
              Text(
                element["name"] as String,
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
              ),
              Expanded(
                child: Text(
                  element["comment"] as String,
                  style: TextStyle(fontSize: 11, fontWeight: FontWeight.w400),
                ),
              ),
            ],
          ),
          Divider(color: Colors.grey.shade600),
        ],
      ));
    });
    return Column(
        mainAxisAlignment: MainAxisAlignment.center, children: commentRows);
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
          _getLabelledIconButton("Comments", Icons.message),
          _getLabelledIconButton("Change Act.", Icons.child_friendly_rounded),
          _getLabelledIconButton("Rate", Icons.star_rate),
        ],
      ),
    );
  }

  GestureDetector _getLabelledIconButton(String label, IconData iconData) {
    return GestureDetector(
      onTap: () {
        print("Pressed");
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            iconData,
            size: 26,
            color: Colors.grey.shade500,
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

  Container _getColumnButtons(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 130,
      color: Colors.blue.shade50,
      padding: EdgeInsets.symmetric(vertical: 6, horizontal: 4),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: Colors.green.shade600,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.check_circle_outline,
                  color: Colors.white70,
                  size: 33,
                ),
                SizedBox(width: 8),
                Text(
                  "Mark Activity as Completed",
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 10),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed(ActivityScreen.routeName);
            },
            child: Container(
              width: double.infinity,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: Colors.grey[350],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Read description",
                    style: TextStyle(
                      color: Colors.grey.shade700,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _getVideo() {
    return VideoWidget(_videoID);
  }

  Container _getActivityExplanation() {
    return Container(
      width: double.infinity,
      color: Colors.blue.shade50,
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundColor: Colors.blue.shade600,
            child: Icon(Icons.workspaces_outline, color: Colors.white),
          ),
          SizedBox(width: 5),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Cubes",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                      color: Colors.blue.shade600),
                ),
                Text(
                  "Purpose: To simulate your baby's movements when playing with cubes",
                  style: TextStyle(
                      //fontWeight: FontWeight.bold,
                      fontSize: 12,
                      color: Colors.blueGrey.shade400),
                ),
              ],
            ),
          ),
          IconButton(
            icon: Icon(Icons.share),
            onPressed: () => print("Share pressed"),
          ),
        ],
      ),
    );
  }

  Container _getActivityTopBar(int activityOrder) {
    return Container(
      width: double.infinity,
      color: Colors.blue.shade500,
      padding: EdgeInsets.symmetric(vertical: 4, horizontal: 15),
      child: Row(
        children: [
          Icon(Icons.stream, color: Colors.white),
          SizedBox(width: 4),
          Text(
            "Activity #$activityOrder",
            textAlign: TextAlign.left,
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
