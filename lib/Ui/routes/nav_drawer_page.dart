import 'package:flutter/material.dart';
import 'package:tictactoe/Ui/widgets/custom_drawer.dart';

class NavDrawer extends StatefulWidget {
  final ValueChanged<Screen> onSelectedItem;

  const NavDrawer({Key? key, required this.onSelectedItem}) : super(key: key);

  @override
  _NavDrawerState createState() => _NavDrawerState();
}

class _NavDrawerState extends State<NavDrawer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(32, 164, 243, 1),
      body: SafeArea(
        child: Container(
          width: 275.0,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                contentPadding: EdgeInsets.all(16),
                onTap: () => widget.onSelectedItem(Screen.HomeScreen),
                leading: Icon(Icons.home),
                title: Text('Home'),
              ),
              Divider(
                color: Colors.white,
              ),
              ListTile(
                contentPadding: EdgeInsets.all(16),
                onTap: () => widget.onSelectedItem(Screen.About),
                leading: Icon(Icons.holiday_village),
                title: Text('About'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
