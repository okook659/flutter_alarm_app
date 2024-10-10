import 'package:alarm/screens/alarm.dart';
import 'package:alarm/screens/home_page.dart';
import 'package:alarm/screens/settings.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  int myIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // bottomNavigationBar: BottomNavigationBar(
      //   onTap: (index) => {
      //     setState(() {
      //       myIndex = index;
      //     })
      //   },
      //   currentIndex: myIndex,
      //   items: const [
      //     BottomNavigationBarItem(
      //       backgroundColor: Colors.black,
      //       icon: Icon(Icons.home),
      //       label: "Home",
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.alarm),
      //       label: "alarm",
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.settings),
      //       label: "Settings",
      //     ),
      //   ],
      // ),
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            myIndex = index;
          });
        },
        indicatorColor: Colors.blue,
        selectedIndex: myIndex,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.watch_later_outlined, color: Colors.white,),
            icon: Icon(Icons.watch_later_outlined, color: Colors.blue,),
            label: 'Clock',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.alarm, color: Colors.white,),
            icon: Icon(Icons.alarm, color: Colors.blue,),
            label: 'Alarm',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.settings_applications, color: Colors.white,),
            icon: Icon(Icons.settings_applications, color: Colors.blue,),
            label: 'Settings',
          ),
        ],
      ),
      body:[
        HomePage(),
        Alarm(),
        Settings(),
      ][myIndex],
    );
  }
}
