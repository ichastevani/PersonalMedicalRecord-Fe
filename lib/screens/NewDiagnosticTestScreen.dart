import 'package:flutter/material.dart';

class NewDiagnosticTestScreen extends StatefulWidget {
  @override
  _NewDiagnosticTestScreenState createState() =>
      _NewDiagnosticTestScreenState();
}

class _NewDiagnosticTestScreenState extends State<NewDiagnosticTestScreen> {
  final TextEditingController _dateController = TextEditingController();

  // Fungsi untuk menampilkan kalender dan memilih tanggal
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (pickedDate != null) {
      setState(() {
        _dateController.text =
        "${pickedDate.day}-${pickedDate.month}-${pickedDate.year}";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('New Diagnostic Test'),
        backgroundColor: Color(0xFF004AAD),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Input Field: Test Name
              _buildInputField('Test Name'),
              SizedBox(height: 16),

              // Input Field: Test Date
              _buildDateInputField('Test Date', _dateController, context),
              SizedBox(height: 16),

              // Input Field: Test Type
              _buildInputField('Test Type'),
              SizedBox(height: 16),

              // Input Field: Lab Name
              _buildInputField('Lab Name'),
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

  // Helper Method for Input Fields
  Widget _buildInputField(String label) {
    return TextField(
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w300, // Font tipis
          fontSize: 12, // Ukuran font lebih kecil
        ),
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
      onTap: () => _selectDate(context), // Menampilkan kalender saat field diklik
      child: AbsorbPointer(
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
            labelText: label,
            labelStyle: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w300, // Font tipis
              fontSize: 12, // Ukuran font lebih kecil
            ),
            filled: true,
            fillColor: Color(0xFFF5F0FF),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12), // Border lonjong
              borderSide: BorderSide.none,
            ),
            floatingLabelBehavior: FloatingLabelBehavior.auto,
          ),
        ),
      ),
    );
  }
}
