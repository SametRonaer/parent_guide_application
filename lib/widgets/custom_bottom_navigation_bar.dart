import 'package:flutter/material.dart';
import 'package:parent_guide_application/screens/catalog_screen.dart';
import 'package:parent_guide_application/screens/my_plan_screen.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  @override
  _CustomBottomNavigationBarState createState() =>
      _CustomBottomNavigationBarState();
  Function _changeScreen;

  CustomBottomNavigationBar(this._changeScreen);
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.category), label: "MyPlan"),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: "Catalog",
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.show_chart), label: "Progress"),
        BottomNavigationBarItem(
            icon: Icon(Icons.lightbulb_outline_sharp), label: "Learn"),
        BottomNavigationBarItem(icon: Icon(Icons.people), label: "My Family"),
      ],
      currentIndex: _currentIndex,
      onTap: (i) {
        widget._changeScreen(i);
        setState(() {
          _currentIndex = i;
        });
      },
    );
  }
}
