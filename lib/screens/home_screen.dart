import 'package:cartelera/models/upcoming_response.dart';
import 'package:cartelera/screens/now_playing_screen.dart';
import 'package:cartelera/screens/upcoming_screen.dart';
import 'package:cartelera/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'company_screen.dart';

class HomeScreen extends StatefulWidget {
  State<StatefulWidget> createState() => _HomeState();
}

class _HomeState extends State<HomeScreen> {
  int _currentIndex = 0;
  final List<Widget> _screens = [
    HomeSwippedScreen(),
    RaitingScreen(),
    ReviewScreen(),
    CompanyS(),
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Peliculas en Cines'),
        elevation: 0,
      ),
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: onTapeped,
        fixedColor: Colors.blueAccent,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.moving), label: 'Top'),
          BottomNavigationBarItem(
              icon: Icon(Icons.shutter_speed), label: 'Novedades'),
          BottomNavigationBarItem(
              icon: Icon(Icons.rotate_right), label: 'Proximamente'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Compañia'),
        ],
      ),
    );
  }

  void onTapeped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}

class CompanyScreen {}
