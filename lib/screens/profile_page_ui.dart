import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Profile', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 16),
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/images/avatar.png'),
            ),
            SizedBox(height: 16),
            Text(
              'Icha Samosir',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              '0x1234...abcd',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 24),
            // Profile Details
            ListTile(
              title: Text('Full Name'),
              subtitle: Text('Icha Samosir'),
            ),
            ListTile(
              title: Text('Date of Birth'),
              subtitle: Text('01 January 1990'),
            ),
            ListTile(
              title: Text('Gender'),
              subtitle: Text('Female'),
            ),
            ListTile(
              title: Text('Blood Type'),
              subtitle: Text('O+'),
            ),
            ListTile(
              title: Text('Phone Number'),
              subtitle: Text('+62 812-3456-7890'),
            ),
            ListTile(
              title: Text('Email Address'),
              subtitle: Text('icha.samosir@example.com'),
            ),
            Spacer(),
            // Buttons Section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Logic for Request View Only
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text('Request View Only'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Logic for Request Edit
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text('Request Edit'),
                ),
              ],
            ),
            SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: ProfilePage(),
  ));
}
