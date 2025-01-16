import 'package:flutter/material.dart';
import 'newDiagnosticTestScreen.dart'; // Import halaman form baru

class DiagnosticTestsScreen extends StatefulWidget {
  @override
  _DiagnosticTestsScreenState createState() => _DiagnosticTestsScreenState();
}

class _DiagnosticTestsScreenState extends State<DiagnosticTestsScreen> {
  final List<Map<String, String>> records = [
    {
      'testName': 'Blood Test',
      'testDate': '01-01-2025',
      'testType': 'CBC',
      'labName': 'Lab Corp',
      'notes': 'No additional notes.'
    },
    {
      'testName': 'Urinalysis',
      'testDate': '02-01-2025',
      'testType': 'Routine',
      'labName': 'Health Lab',
      'notes': 'Follow-up required.'
    },
    // Tambahkan lebih banyak catatan sesuai kebutuhan
  ];

  List<Map<String, String>> filteredRecords = [];
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    filteredRecords = records; // Awalnya, semua catatan ditampilkan
    _searchController.addListener(_filterRecords);
  }

  void _filterRecords() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      filteredRecords = records.where((record) {
        return record['testName']!.toLowerCase().contains(query);
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
        title: Text('Diagnostic Tests'),
        backgroundColor: Color(0xFF004AAD), // Warna biru header
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // Posisi tombol di kiri
          children: [
            // Search Field
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

            // Add New Record Button
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NewDiagnosticTestScreen(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF004AAD),
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text(
                'Add New Record',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
            SizedBox(height: 16),

            // List of Diagnostic Tests
            Expanded(
              child: ListView.builder(
                itemCount: filteredRecords.length,
                itemBuilder:(context, index) {
                  final record = filteredRecords[index];
                  return GestureDetector(
                    onTap:(() {
                      // Tampilkan dialog dengan detail laporan
                      _showReportDetailDialog(context,
                          record['testName']!,
                          record['testDate']!,
                          record['testType']!,
                          record['labName']!,
                          record['notes']!);
                    }),
                    child:
                    Card(
                        shape:
                        RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius.circular(16)),
                        child:
                        ListTile(
                          leading:
                          Icon(Icons.science, size:
                          40, color:
                          Color(0xFF004AAD)),
                          title:
                          Text(record['testName']!, style:
                          TextStyle(fontWeight:
                          FontWeight.bold)),
                          subtitle:
                          Text('Test Date: ${record['testDate']}'), // Tambahkan tanggal jika ada
                          trailing:
                          Icon(Icons.edit, color:
                          Colors.grey), // Ikon edit jika diperlukan
                        )),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showReportDetailDialog(BuildContext context, String testName, String testDate, String testType, String labName, String notes) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder:(BuildContext context) {
        return DraggableScrollableSheet(
          initialChildSize: 0.5,
          maxChildSize: 0.6,
          minChildSize: 0.4,
          builder: (_, scrollController) {
            return Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:[
                      Text(testName, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      IconButton(
                        icon: Icon(Icons.close), // Ikon silang untuk menutup dialog
                        onPressed: () {
                          Navigator.of(context).pop(); // Menutup dialog
                        },
                      )
                    ],
                  ),
                  SizedBox(height: 16),
                  _buildDetailRow('Test Date', testDate),
                  _buildDetailRow('Test Type', testType),
                  _buildDetailRow('Lab Name', labName),
                  _buildDetailRow('Notes', notes),
                  Spacer(),
                  ElevatedButton(
                    onPressed: () {
                      // Aksi untuk edit atau tindakan lain
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF004AAD),
                      padding:
                      EdgeInsets.symmetric(vertical: 12),
                      shape:
                      RoundedRectangleBorder(borderRadius:
                      BorderRadius.circular(8)),
                    ),
                    child:
                    Text('Edit', style:
                    TextStyle(fontSize:
                    16, color:
                    Colors.white)),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding:
      const EdgeInsets.symmetric(vertical:
      8.0),
      child:
      Row(mainAxisAlignment:
      MainAxisAlignment.spaceBetween,
        children:[
          Text('$label:', style:
          TextStyle(fontSize:
          14, color:
          Colors.grey[700], fontWeight:
          FontWeight.bold)),
          Text(value, style:
          TextStyle(fontSize:
          14, color:
          Colors.black)),
        ],
      ),
    );
  }
}
