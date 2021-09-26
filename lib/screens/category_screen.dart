import 'package:flutter/material.dart';
import 'package:parent_guide_application/constants/dummy_categories.dart';
import 'package:parent_guide_application/screens/activity_screen.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class CategoryScreen extends StatelessWidget {
  static final routeName = "/category-screen";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey.shade300,
          elevation: 0,
          iconTheme: IconThemeData(
            color: Colors.grey.shade700, //change your color here
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              _getTopFieldOfScreen(),
              _getCategoryList(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _getCategoryList(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 800,
          child: ListView.builder(
            itemBuilder: (ctx, i) {
              return _getListTile(
                dCategoryItems[i]["title"] as String,
                dCategoryItems[i]["videoId"] as String,
                context,
              );
            },
            itemCount: dCategoryItems.length,
          ),
        ),
      ],
    );
  }

  Widget _getListTile(String title, String videoId, BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .pushNamed(ActivityScreen.routeName, arguments: videoId);
      },
      child: Container(
        height: 140,
        width: double.infinity,
        color: Colors.grey.shade300,
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Row(
          children: [
            Container(
              height: 130,
              width: 130,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: _getVideoImage(videoId, context),
              ),
            ),
            SizedBox(width: 15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.grey.shade800,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "Social & Emotional",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.pink,
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  width: 170,
                  child: Text(
                    "To strengthen the bond between your baby and you.",
                    style: TextStyle(
                      fontSize: 10,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _getVideoImage(String id, BuildContext context) {
    String thumbnailImageUrl = YoutubePlayer.getThumbnail(videoId: id);
    return Container(
      width: double.infinity,
      height: 130,
      color: Colors.black,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.network(
            thumbnailImageUrl,
            fit: BoxFit.fitWidth,
          ),
          Icon(
            Icons.play_arrow,
            size: 80,
            color: Colors.white,
          ),
        ],
      ),
    );
  }

  Column _getTopFieldOfScreen() {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(color: Colors.grey.shade300),
          height: 200,
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(150),
                      child: Image.network(
                        "https://img.freepik.com/free-vector/vector-illustration-cute-baby-with-different-expressions_96037-522.jpg?size=626&ext=jpg",
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                    width: 90,
                    height: 90,
                  ),
                  SizedBox(width: 15),
                  Column(
                    children: [
                      Text(
                        "We Got a Crawler",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.blue.shade400,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        width: 230,
                        child: Text(
                          "Support your baby's crawling skills by starting with small, easy steps. Plus, find tips on keeping your little one safe.",
                          style: TextStyle(
                              fontSize: 12, color: Colors.grey.shade600),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 15),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(minimumSize: Size(400, 40)),
                  onPressed: () {},
                  child: Text(
                    "Activities & Articles",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  )),
            ],
          ),
        ),
      ],
    );
  }
}
