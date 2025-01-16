import 'package:flutter/material.dart';
import 'package:test_aplikasi/screens/PermissionsPage.dart';
import 'package:test_aplikasi/screens/profile_screen.dart';
import 'activity_log.dart';
import 'home_screen.dart';
import 'doctor_home_widget.dart';
import 'record_screen.dart'; // Import halaman RecordScreen
import 'package:test_aplikasi/screens/doctor_home_widget.dart' as doctorHome;

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    HomeScreen(), // Halaman Home
    RecordScreen(), // Halaman Record
    PermissionsPage(), // Halaman Permissions
    ActivityLogPage(), // Halaman Activity Log
    ProfileScreen(), // Halaman Profile
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: Color(0xFF004AAD), // Warna biru untuk item aktif
        unselectedItemColor: Color(0xFFBDBDBD), // Warna abu-abu untuk item tidak aktif
        backgroundColor: Colors.white,
        showUnselectedLabels: true, // Tampilkan label meskipun item tidak aktif
        type: BottomNavigationBarType.fixed, // Untuk memastikan semua item terlihat
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, size: 24),
            activeIcon: Column(
              children: [
                Icon(Icons.home, size: 24, color: Color(0xFF004AAD)),
                SizedBox(height: 4),
                Container(
                  height: 2,
                  width: 24,
                  color: Color(0xFF004AAD),
                ),
              ],
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.folder, size: 24),
            activeIcon: Column(
              children: [
                Icon(Icons.folder, size: 24, color: Color(0xFF004AAD)),
                SizedBox(height: 4),
                Container(
                  height: 2,
                  width: 24,
                  color: Color(0xFF004AAD),
                ),
              ],
            ),
            label: 'Record',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.lock, size: 24),
            activeIcon: Column(
              children: [
                Icon(Icons.lock, size: 24, color: Color(0xFF004AAD)),
                SizedBox(height: 4),
                Container(
                  height: 2,
                  width: 24,
                  color: Color(0xFF004AAD),
                ),
              ],
            ),
            label: 'Permissions',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list, size: 24),
            activeIcon: Column(
              children: [
                Icon(Icons.list, size: 24, color: Color(0xFF004AAD)),
                SizedBox(height: 4),
                Container(
                  height: 2,
                  width: 24,
                  color: Color(0xFF004AAD),
                ),
              ],
            ),
            label: 'Activity Log',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, size: 24),
            activeIcon: Column(
              children: [
                Icon(Icons.person, size: 24, color: Color(0xFF004AAD)),
                SizedBox(height: 4),
                Container(
                  height: 2,
                  width: 24,
                  color: Color(0xFF004AAD),
                ),
              ],
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
