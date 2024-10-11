import 'package:alarm/screens/alarm.dart';
import 'package:alarm/screens/home_page.dart';
import 'package:alarm/screens/settings.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  int myIndex = 0;
  final List<Widget> _pages = [
    HomePage(),
    Settings(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[800],
      floatingActionButton: FloatingActionButton(onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Alarm()),
          );
        },
         shape: const CircleBorder(),
          backgroundColor: Colors.purple,
          hoverElevation: 0,
          hoverColor: Colors.purple[400],
         child: const Icon(Icons.add, color: Colors.white,),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // bottomNavigationBar: 
      // BottomAppBar(
      //   //  color: Colors.purple,
      //   shape: CircularNotchedRectangle(),
      //   child: NavigationBar(
      //     // backgroundColor: Colors.purple,
      //     onDestinationSelected: (int index) {
      //       setState(() {
      //         myIndex = index;
      //       });
      //     },
      //     indicatorColor: Colors.indigo,
      //     selectedIndex: myIndex,
      //     destinations: const <Widget>[
      //       NavigationDestination(
      //         selectedIcon: Icon(Icons.watch_later_outlined, color: Colors.white,),
      //         icon: Icon(Icons.watch_later_outlined, color: Colors.indigo,),
      //         label: 'Clock',
      //       ),
          
      //       NavigationDestination(
      //         selectedIcon: Icon(Icons.settings_applications, color: Colors.white,),
      //         icon: Icon(Icons.settings_applications, color: Colors.indigo,),
      //         label: 'Settings',
      //       ),
      //     ],
      //   ),
      // ),

      // 
        bottomNavigationBar: CurvedNavigationBar(
          onTap: (index){
 setState(() {
            myIndex = index; // Mise à jour de l'index pour changer de page
          });
          },
          animationDuration: Duration(milliseconds: 300),
          backgroundColor: Colors.purple[800]!,
          items: [
          Icon(Icons.watch_later_outlined,
          color: Colors.purple,),
          Icon(Icons.settings, color: Colors.purple,)
        ]),

      // body:[
      //   HomePage(),
        
      //   Settings(),
      // ][myIndex],
       body: IndexedStack(
        index: myIndex,
        children: _pages, // Contient les différentes pages
      ),
    );
  }
}
