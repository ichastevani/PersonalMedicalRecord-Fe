import 'package:flutter/material.dart';
import 'vaccination_records_screen.dart'; // Halaman detail
import 'radiology_reports_screen.dart';
import 'diagnostic_tests_screen.dart';
import 'prescriptions_screen.dart';
import 'surgical_records_screen.dart';

class RecordScreen extends StatefulWidget {
  @override
  _RecordScreenState createState() => _RecordScreenState();
}

class _RecordScreenState extends State<RecordScreen> {
  final List<Map<String, dynamic>> modules = [
    {
      'title': 'Vaccination Records',
      'description': 'List of uploaded vaccination records',
      'icon': Icons.vaccines,
      'page': VaccinationRecordsScreen(),
    },
    {
      'title': 'Radiology Reports',
      'description': 'Stores imaging results (e.g., X-rays, MRIs, CT scans)',
      'icon': Icons.medical_services,
      'page': RadiologyReportsScreen(), // Halaman detail lainnya
    },
    {
      'title': 'Diagnostic Tests',
      'description': 'Saves lab test results (e.g., Blood tests, Urinalysis)',
      'icon': Icons.science,
      'page': DiagnosticTestsScreen(),
    },
    {
      'title': 'Prescriptions',
      'description': 'Records medications and dosages prescribed by doctors',
      'icon': Icons.description,
      'page': PrescriptionsScreen(),
    },
    {
      'title': 'Surgical Records',
      'description': 'Documents past surgeries or medical procedures',
      'icon': Icons.healing,
      'page': SurgicalRecordsScreen(),
    },
  ];

  List<Map<String, dynamic>> filteredModules = [];
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    filteredModules = modules; // Awalnya, semua modul ditampilkan
    _searchController.addListener(_filterModules);
  }

  void _filterModules() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      filteredModules = modules.where((module) {
        return module['title'].toLowerCase().contains(query);
      }).toList();
    });
  }

  @override
  void dispose() {
    _searchController.dispose(); // Pastikan untuk membersihkan controller
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('My Medical Record'),
        backgroundColor: Color(0xFF004AAD),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                filled: true,
                fillColor: Color(0xFFF5F0FF),
                hintText: 'Search Records',
                prefixIcon: Icon(Icons.search, color: Colors.grey),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Record Categories (Modules)',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: filteredModules.length,
                itemBuilder: (context, index) {
                  final module = filteredModules[index];
                  return GestureDetector(
                    onTap: () {
                      // Navigasi ke halaman detail
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => module['page'],
                        ),
                      );
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: ListTile(
                        leading:
                        Icon(module['icon'], size: 40, color: Colors.grey),
                        title:
                        Text(module['title'], style: TextStyle(fontWeight: FontWeight.bold)),
                        subtitle: Text(module['description']),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
