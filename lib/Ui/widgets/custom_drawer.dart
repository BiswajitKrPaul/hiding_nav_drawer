import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:tictactoe/Ui/routes/about_screen.dart';
import 'package:tictactoe/Ui/routes/nav_drawer_page.dart';
import 'package:tictactoe/Ui/widgets/homescreen.dart';

enum Screen {
  HomeScreen,
  About,
}

class CustomDrawer extends StatefulWidget {
  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  final ZoomDrawerController drawer = ZoomDrawerController();
  late Screen item = Screen.HomeScreen;
  bool isDragable = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onHorizontalDragUpdate: (drag) {
          if (drag.delta.dx > 0 && !drawer.isOpen!()) {
            drawer.open!();
          } else {
            drawer.close!();
          }
        },
        child: WillPopScope(
          onWillPop: () async {
            if (drawer.isOpen!()) {
              drawer.close!();
              return false;
            } else
              return true;
          },
          child: ZoomDrawer(
            controller: drawer,
            style: DrawerStyle.Style1,
            menuScreen: NavDrawer(
              onSelectedItem: (Screen value) {
                setState(() {
                  this.item = value;
                  drawer.toggle!();
                });
              },
            ),
            mainScreen: getCurrentDrawerItem(),
            borderRadius: 24.0,
            disableGesture: false,
            showShadow: false,
            angle: 0.0,
            backgroundColor: Colors.grey[300]!,
          ),
        ),
      ),
    );
  }

  Widget getCurrentDrawerItem() {
    switch (item) {
      case Screen.HomeScreen:
        item = Screen.HomeScreen;
        return HomeScreen();
      case Screen.About:
        item = Screen.About;
        return AboutScreen();
      default:
        return HomeScreen();
    }
  }
}
