import 'package:flutter/material.dart';
import 'package:parent_guide_application/constants/dummy_categories.dart';

class CatalogScreen extends StatelessWidget {
  static final String routeName = "/catalog_screen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "All Collections",
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
          ),
        ),
        backgroundColor: Colors.grey.shade400,
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          // Colors colors = dCategoryList[index]["color"] as Colors;
          String title = dCategoryList[index]["title"] as String;
          return _getCategoryWidget(title);
        },
        itemCount: dCategoryList.length,
      ),
    );
  }

  _getCategoryWidget(String title) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.yellow.shade700,
          borderRadius: BorderRadius.circular(15)),
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.only(top: 5, right: 5, left: 5),
      padding: EdgeInsets.symmetric(horizontal: 16),
      width: double.infinity,
      height: 100,
      child: Text(
        title,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 22,
        ),
      ),
    );
  }
}
