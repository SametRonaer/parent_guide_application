import 'package:flutter/material.dart';
import 'package:parent_guide_application/screens/activity_screen.dart';
import 'package:parent_guide_application/screens/catalog_screen.dart';
import 'package:parent_guide_application/screens/my_plan_screen.dart';
import 'package:parent_guide_application/widgets/custom_bottom_navigation_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Widget _currentScreen = MyPlanScreen();
  final List<Widget> _screens = [
    MyPlanScreen(),
    CatalogScreen(),
    MyPlanScreen(),
    CatalogScreen(),
    MyPlanScreen(),
  ];

  _changeScreen(int i) {
    setState(() {
      _currentScreen = _screens[i];
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //home: ActivityScreen(),
      home: SafeArea(
        child: Scaffold(
          body: _currentScreen,
          bottomNavigationBar: CustomBottomNavigationBar(_changeScreen),
        ),
      ),
      routes: {
        MyPlanScreen.routeName: (ctx) => MyPlanScreen(),
        CatalogScreen.routeName: (ctx) => CatalogScreen(),
        ActivityScreen.routeName: (ctx) => ActivityScreen(),
      },
    );
  }
}
