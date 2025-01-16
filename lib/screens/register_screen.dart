import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'main_screen.dart'; // Pastikan ini mengarah ke halaman utama

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String? _selectedRole;
  final TextEditingController _dateOfBirthController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF87B5D8), // Warna biru latar belakang
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 40),
                Center(
                  child: Text(
                    'Create Your Account',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: 8),
                Center(
                  child: Text(
                    'Sign up to take full control of your\nmedical data',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white.withOpacity(0.9),
                    ),
                  ),
                ),
                SizedBox(height: 32),
                // Full Name Field
                TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'Full name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                SizedBox(height: 16),
                // Role Selection
                Row(
                  children: [
                    Expanded(
                      child: RadioListTile<String>(
                        value: 'Doctor',
                        groupValue: _selectedRole,
                        title: Text('Doctor'),
                        onChanged: (value) {
                          setState(() {
                            _selectedRole = value;
                          });
                        },
                      ),
                    ),
                    Expanded(
                      child: RadioListTile<String>(
                        value: 'Patient',
                        groupValue: _selectedRole,
                        title: Text('Patient'),
                        onChanged: (value) {
                          setState(() {
                            _selectedRole = value;
                          });
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                // Date of Birth Field
                GestureDetector(
                  onTap: () => _selectDate(context), // Menampilkan kalender saat field diklik
                  child: AbsorbPointer(
                    child: TextField(
                      controller: _dateOfBirthController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Date of Birth',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 16),
                // Gender Field
                TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'Gender',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                SizedBox(height: 16),
                // Email Field
                TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'Email',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                SizedBox(height: 32),
                // Sign Up Button
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      // Arahkan ke halaman utama
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MainScreen(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                      Color(0xFF004AAD), // Warna biru tombol
                      padding:
                      EdgeInsets.symmetric(horizontal: 100, vertical: 16),
                      shape:
                      RoundedRectangleBorder(borderRadius:
                      BorderRadius.circular(8)),
                    ),
                    child:
                    Text('Sign Up', style:
                    TextStyle(fontSize:
                    18, fontWeight:
                    FontWeight.bold, color:
                    Colors.white)),
                  ),
                ),
                SizedBox(height: 16),
                // Tambahkan TextButton di sini
                Center(
                  child:
                  TextButton(onPressed:
                      () {
                    // Arahkan ke halaman Login
                    Navigator.pushReplacement(context, MaterialPageRoute(builder:(context) => LoginScreen(),));
                  },
                      child:
                      Text('Already have an account? Log in here', style:
                      TextStyle(color:
                      Colors.white, fontSize:
                      14))),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate:
      DateTime.now(),
      firstDate:
      DateTime(1900), // Batas tahun awal
      lastDate:
      DateTime(2100), // Batas tahun akhir
    );
    if (pickedDate != null) {
      setState(() {
        _dateOfBirthController.text =
        "${pickedDate.day}-${pickedDate.month}-${pickedDate.year}";
      });
    }
  }
}
