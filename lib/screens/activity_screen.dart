import 'package:flutter/material.dart';
import 'package:parent_guide_application/constants/dummy_activities.dart';
import 'package:parent_guide_application/models/activity_model.dart';
import 'package:parent_guide_application/widgets/video_widget.dart';

class ActivityScreen extends StatelessWidget {
  static final routeName = "/activity-screen";

  @override
  Widget build(BuildContext context) {
    final String videoId = ModalRoute.of(context)!.settings.arguments as String;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          // backgroundColor: Colors.blue.shade400,
          title: Text(
            "Jeremy's Plan",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
        ),
        backgroundColor: Colors.blue.shade50,
        body: SingleChildScrollView(
          child: Column(
            children: [
              VideoWidget(videoId),
              SizedBox(height: 5),
              _getPropertiesOfActivity(),
              _getTitleAndDescriptionField(),
              _getRowButtons(),
              Divider(thickness: 1.7),
              _getTwoButtonsInRow(),
              Divider(thickness: 1.7),
              _getDescriptionTopBar(),
              Container(
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                child: Text(
                    "Today I'm sharing baby exercises (0-3 months), these help with a baby's brain development. "
                    "Baby play doesn't need to be hard, these are all simple and easy ways to entertain and encourage your newborn baby "
                    "(0-3 months) in play. These activities for baby are fun and help your baby's development while entertaining them at home. "
                    "So if you've got a newborn baby or know someone who is expecting then "
                    "I really hope this encourages and supports you in your parenting journey especially during those early months 0-3 months."),
              ),
              _getCommentsArea(),
            ],
          ),
        ),
      ),
    );
  }

  Column _getDescriptionTopBar() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextButton(
                onPressed: () {},
                child: Text(
                  "DESCRIPTION",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                  ),
                )),
            TextButton(
                onPressed: () {},
                child: Text(
                  "MATERIALS",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                    fontSize: 18,
                  ),
                ))
          ],
        ),
        Container(
          padding: EdgeInsets.only(right: 200),
          child: Divider(thickness: 2, color: Colors.blue),
        ),
      ],
    );
  }

  Row _getTwoButtonsInRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Row(
          children: [
            Container(
              width: 50,
              height: 50,
              color: Colors.blue.shade200,
              child: Icon(Icons.person),
            ),
            SizedBox(width: 10),
            Text(
              "Crawling",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        ElevatedButton(
          onPressed: () {},
          child: Text("View milestones"),
          style: ElevatedButton.styleFrom(primary: Colors.green.shade500),
        )
      ],
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

  Container _getTitleAndDescriptionField() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15),
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
        Text(
          "3 months and up",
          style: TextStyle(color: Colors.blueGrey, fontWeight: FontWeight.bold),
        ),
        Text(
          "Physical",
          style: TextStyle(
              color: Colors.blue.shade400, fontWeight: FontWeight.bold),
        ),
        Text(
          "Curiosity Moves Us",
          style: TextStyle(
              color: Colors.green.shade500, fontWeight: FontWeight.bold),
        ),
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
