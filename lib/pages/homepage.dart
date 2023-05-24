import 'package:flutter/material.dart';
import 'package:projekakhir_pemrogramanmobile/pages/katalogpage.dart';
import 'package:projekakhir_pemrogramanmobile/pages/matauang.dart';
import 'package:projekakhir_pemrogramanmobile/pages/profile.dart';
import 'package:projekakhir_pemrogramanmobile/pages/waktu.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  static List<Widget> _widgetOptions = <Widget>[
    CataloguePage(),
    ProfileMenuPage(),
    Waktu(),
    CurrencyPage(),
  ];


  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profil',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.access_time),
            label: 'Waktu',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.compare_arrows),
            label: 'Konversi',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.purpleAccent,
        onTap: _onItemTapped,
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  const HomeContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Home',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Profil',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}

class WaktuPage extends StatelessWidget {
  const WaktuPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Waktu',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}

class KonversiMataUangPage extends StatelessWidget {
  const KonversiMataUangPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Konversi Mata Uang',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}

class LogoutPage extends StatelessWidget {
  const LogoutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Logout',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}
