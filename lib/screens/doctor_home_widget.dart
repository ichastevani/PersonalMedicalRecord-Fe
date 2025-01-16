import 'package:flutter/material.dart';
import 'package:test_aplikasi/screens/profile_screen.dart' as profile;

void main() {
  runApp(DoctorHomeWidget());
}

class DoctorHomeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: DoctorHomeContent(),
        ),
      ),
    );
  }
}

class DoctorHomeContent extends StatefulWidget {
  @override
  _DoctorHomeContentState createState() => _DoctorHomeContentState();
}

class _DoctorHomeContentState extends State<DoctorHomeContent> {
  final List<Map<String, String>> _patients = [
    {'name': 'John Doe', 'id': '1001', 'dob': '01 Jan 1980', 'gender': 'Male', 'bloodType': 'O+', 'phone': '+62 812-3456-7890', 'email': 'john.doe@example.com'},
    {'name': 'Jane Smith', 'id': '1002', 'dob': '02 Feb 1985', 'gender': 'Female', 'bloodType': 'A-', 'phone': '+62 811-2345-6789', 'email': 'jane.smith@example.com'},
    {'name': 'Michael Johnson', 'id': '1003', 'dob': '03 Mar 1990', 'gender': 'Male', 'bloodType': 'B+', 'phone': '+62 813-4567-8901', 'email': 'michael.johnson@example.com'},
    {'name': 'Emily Davis', 'id': '1004', 'dob': '04 Apr 1995', 'gender': 'Female', 'bloodType': 'AB-', 'phone': '+62 814-5678-9012', 'email': 'emily.davis@example.com'},
    {'name': 'Sarah Wilson', 'id': '1005', 'dob': '05 May 2000', 'gender': 'Female', 'bloodType': 'O-', 'phone': '+62 815-6789-0123', 'email': 'sarah.wilson@example.com'},
  ];

  List<Map<String, String>> _filteredPatients = [];

  @override
  void initState() {
    super.initState();
    _filteredPatients = List.from(_patients);
  }

  void _filterPatients(String query) {
    final filtered = _patients
        .where((patient) => patient['name']!.toLowerCase().contains(query.toLowerCase()) || patient['id']!.contains(query))
        .toList();

    setState(() {
      _filteredPatients = filtered;
    });
  }

  void _showPatientModal(BuildContext context, Map<String, String> patient) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 40,
                        backgroundColor: Colors.grey[300],
                      ),
                      SizedBox(height: 16),
                      Text(
                        patient['name']!,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'ID: ${patient['id']}',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16),
                ListTile(
                  title: Text('Full Name'),
                  subtitle: Text(patient['name']!),
                ),
                ListTile(
                  title: Text('Date of Birth'),
                  subtitle: Text(patient['dob']!),
                ),
                ListTile(
                  title: Text('Gender'),
                  subtitle: Text(patient['gender']!),
                ),
                ListTile(
                  title: Text('Blood Type'),
                  subtitle: Text(patient['bloodType']!),
                ),
                ListTile(
                  title: Text('Phone Number'),
                  subtitle: Text(patient['phone']!),
                ),
                ListTile(
                  title: Text('Email Address'),
                  subtitle: Text(patient['email']!),
                ),
                SizedBox(height: 16),
                Column(
                  children: [
                    SizedBox(
                      width: 120,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue[900],
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Text(
                          'Request View Only',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(height: 12),
                    SizedBox(
                      width: 120,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.lightBlue[300],
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Text(
                          'Request Edit',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Header Section
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          color: Color(0xFF004AAD),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hi, "Doctor"',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Patient Health Protected, Medical Records Secure',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.white.withOpacity(0.8),
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              SizedBox(width: 12),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => profile.ProfileScreen()),
                  );
                },
                child: CircleAvatar(
                  radius: 24,
                  backgroundImage: AssetImage('assets/images/profile.png'),
                ),
              ),
            ],
          ),
        ),

        // Last Login Section
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  blurRadius: 10,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Last Login',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Today',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ),

        // Search Bar
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: TextField(
            onChanged: _filterPatients,
            decoration: InputDecoration(
              hintText: 'Search by username patients or ID',
              filled: true,
              fillColor: Colors.grey[100],
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),

        SizedBox(height: 16),

        // Patient List
        Expanded(
          child: ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            itemCount: _filteredPatients.length,
            itemBuilder: (context, index) {
              final patient = _filteredPatients[index];
              return GestureDetector(
                onTap: () => _showPatientModal(context, patient),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 12.0),
                  child: Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          blurRadius: 10,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 48,
                          height: 48,
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        SizedBox(width: 16),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              patient['name']!,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              'ID: ${patient['id']}',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
