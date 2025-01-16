import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'edit_profile_screen.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  File? _selectedImage;

  // Fungsi untuk memilih gambar dari galeri
  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Profile'),
        backgroundColor: Color(0xFF004AAD),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Foto Profil
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.grey[300],
                  backgroundImage: _selectedImage != null
                      ? FileImage(_selectedImage!)
                      : null,
                  child: _selectedImage == null
                      ? Icon(
                    Icons.person,
                    size: 50,
                    color: Colors.white,
                  )
                      : null,
                ),
                IconButton(
                  icon: Icon(Icons.camera_alt, color: Color(0xFF004AAD)),
                  onPressed: _pickImage,
                ),
              ],
            ),
            SizedBox(height: 16),
            Text(
              'Icha Samosir',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 24),

            // Informasi Profil
            _buildProfileInfo(
              context,
              'Id Patient',
              '1234567890',
              Icons.copy,
                  () {
                Clipboard.setData(ClipboardData(text: '1234567890'));
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('ID Patient copied to clipboard!')),
                );
              },
            ),
            _buildProfileInfo(context, 'Full Name', 'Icha Samosir', null, null),
            _buildProfileInfo(
                context, 'Date of Birth', '01 January 1990', null, null),
            _buildProfileInfo(context, 'Gender', 'Female', null, null),
            _buildProfileInfo(context, 'Blood Type', 'O+', null, null),
            _buildProfileInfo(
                context, 'Phone Number', '+62 812 3456 7890', null, null),
            _buildProfileInfo(
                context, 'Email Address', 'icha@example.com', null, null),
            SizedBox(height: 24),

            // Tombol Edit dan Logout
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EditProfileScreen(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF004AAD),
                    padding:
                    EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    'Edit',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    _logout(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF004AAD),
                    padding:
                    EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    'LogOut',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Helper untuk membangun baris informasi profil
  Widget _buildProfileInfo(BuildContext context, String label, String value,
      IconData? icon, VoidCallback? onTap) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              '$label:',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[700],
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: TextStyle(
                fontSize: 14,
                color: Colors.black,
              ),
              textAlign: TextAlign.end,
            ),
          ),
          if (icon != null)
            IconButton(
              icon: Icon(icon, size: 20, color: Color(0xFF004AAD)),
              onPressed: onTap,
            ),
        ],
      ),
    );
  }

  // Fungsi untuk logout
  void _logout(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Log Out'),
          content: Text('Are you sure you want to log out?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Logged out successfully!')),
                );
              },
              child: Text('Log Out'),
            ),
          ],
        );
      },
    );
  }
}
