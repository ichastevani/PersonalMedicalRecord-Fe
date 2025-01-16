import 'package:flutter/material.dart';

class NewSurgicalRecordScreen extends StatefulWidget {
  @override
  _NewSurgicalRecordScreenState createState() =>
      _NewSurgicalRecordScreenState();
}

class _NewSurgicalRecordScreenState extends State<NewSurgicalRecordScreen> {
  final TextEditingController _surgeryDateController = TextEditingController();

  // Fungsi untuk menampilkan kalender dan memilih tanggal
  Future<void> _selectSurgeryDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (pickedDate != null) {
      setState(() {
        _surgeryDateController.text =
        "${pickedDate.day}-${pickedDate.month}-${pickedDate.year}";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('New Medical Record'),
        backgroundColor: Color(0xFF004AAD),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Input Field: Procedure Name
              _buildInputField('Procedure Name'),
              SizedBox(height: 16),

              // Input Field: Surgery Date
              _buildDateInputField('Surgery Date', _surgeryDateController, context),
              SizedBox(height: 16),

              // Input Field: Surgeon's Name
              _buildInputField("Surgeon's Name"),
              SizedBox(height: 16),

              // Input Field: Hospital/Facility Name
              _buildInputField('Hospital/Facility Name'),
              SizedBox(height: 32),

              // Save Button
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Tambahkan aksi untuk menyimpan data
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
                    'Save',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper Method for Normal Input Fields
  Widget _buildInputField(String label) {
    return TextField(
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: Colors.grey),
        filled: true,
        fillColor: Color(0xFFF5F0FF),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12), // Border lonjong
          borderSide: BorderSide.none,
        ),
        floatingLabelBehavior: FloatingLabelBehavior.auto,
      ),
    );
  }

  // Helper Method for Date Input Field
  Widget _buildDateInputField(String label, TextEditingController controller, BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("Surgery Date field tapped"); // Log ketika field diklik
        _selectSurgeryDate(context);
      },
      child: AbsorbPointer(
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
            labelText: label,
            labelStyle: TextStyle(color: Colors.grey),
            filled: true,
            fillColor: Color(0xFFF5F0FF),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12), // Border lonjong
              borderSide: BorderSide.none,
            ),
            floatingLabelBehavior:
            FloatingLabelBehavior.auto, // Label bergerak ke atas saat field aktif
          ),
        ),
      ),
    );
  }
}
