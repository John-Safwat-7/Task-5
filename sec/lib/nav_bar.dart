import 'package:flutter/material.dart';
import 'package:sec/dashboard_screen.dart';
import 'package:sec/favorite_screen.dart';
import 'package:sec/profile_page.dart';
import 'package:sec/qoute_screen.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});
  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {

  int _selsectedIndex=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(


      body: [


        DashboardScreen(),
        FavoriteScreen(),
        QuoteScreen(),
        ProfilePage(),
      ][_selsectedIndex],



      bottomNavigationBar: NavigationBar(
        
        
        onDestinationSelected: (index){


          setState(() {
            _selsectedIndex=index;
          });
        },
        
        
        
        
        
        
        destinations: const [
        NavigationDestination(icon: Icon(Icons.dashboard), label: "dashboard"),
        NavigationDestination(icon: Icon(Icons.format_quote), label: "Quote"),
        NavigationDestination(icon: Icon(Icons.favorite), label: "favorite"),
        NavigationDestination(icon: Icon(Icons.person), label: "profile")
      ]),
    );
  }
}
