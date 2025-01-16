import 'package:flutter/material.dart';
import 'new_radiology_record_screen.dart'; // Import halaman form baru

class RadiologyReportsScreen extends StatefulWidget {
  @override
  _RadiologyReportsScreenState createState() => _RadiologyReportsScreenState();
}

class _RadiologyReportsScreenState extends State<RadiologyReportsScreen> {
  final List<Map<String, String>> records = [
    {
      'reportName': 'Chest X-Ray',
      'bodyPartScanned': 'Chest',
      'scanDate': '01-01-2025',
      'performedBy': 'Dr. Smith',
      'notes': 'No issues found.'
    },
    {
      'reportName': 'MRI Brain',
      'bodyPartScanned': 'Brain',
      'scanDate': '02-01-2025',
      'performedBy': 'Dr. Johnson',
      'notes': 'Follow-up recommended.'
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
        return record['reportName']!.toLowerCase().contains(query);
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
        title: Text('Radiology Reports'),
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
                // Navigasi ke halaman form baru
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NewRadiologyRecordScreen(), // Gunakan halaman form baru
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

            // List of Radiology Records
            Expanded(
              child: ListView.builder(
                itemCount: filteredRecords.length,
                itemBuilder:(context, index) {
                  final record = filteredRecords[index];
                  return GestureDetector(
                    onTap:(() {
                      // Tampilkan dialog dengan detail laporan
                      _showReportDetailDialog(context,
                          record['reportName']!,
                          record['bodyPartScanned']!,
                          record['scanDate']!,
                          record['performedBy']!,
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
                          Icon(Icons.medical_services, size:
                          40, color:
                          Color(0xFF004AAD)),
                          title:
                          Text(record['reportName']!, style:
                          TextStyle(fontWeight:
                          FontWeight.bold)),
                          subtitle:
                          Text('Scan Date: ${record['scanDate']}'), // Tambahkan tanggal jika ada
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

  void _showReportDetailDialog(BuildContext context, String reportName, String bodyPartScanned, String scanDate, String performedBy, String notes) {
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
                      Text(reportName, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      IconButton(
                        icon: Icon(Icons.close), // Ikon silang untuk menutup dialog
                        onPressed: () {
                          Navigator.of(context).pop(); // Menutup dialog
                        },
                      )
                    ],
                  ),
                  SizedBox(height: 16),
                  _buildDetailRow('Body Part Scanned', bodyPartScanned),
                  _buildDetailRow('Scan Date', scanDate),
                  _buildDetailRow('Performed By', performedBy),
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
