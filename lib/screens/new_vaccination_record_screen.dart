import 'package:flutter/material.dart';

class NewVaccinationRecordScreen extends StatefulWidget {
  @override
  _NewVaccinationRecordScreenState createState() =>
      _NewVaccinationRecordScreenState();
}

class _NewVaccinationRecordScreenState
    extends State<NewVaccinationRecordScreen> {
  final TextEditingController _dateController = TextEditingController();

  // Fungsi untuk menampilkan kalender dan memilih tanggal
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: Color(0xFF004AAD),
            buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary),
            colorScheme: ColorScheme.light(primary: Color(0xFF004AAD)),
          ),
          child: child!,
        );
      },
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
        title: Text('New Vaccination Record'),
        backgroundColor: Color(0xFF004AAD),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Input: Vaccine Name
              _buildInputField('Vaccine Name'),
              SizedBox(height: 16),

              // Input: Dose Number
              _buildInputField('Dose Number'),
              SizedBox(height: 16),

              // Input: Vaccination Date with Calendar
              _buildDateInputField('Vaccination Date', _dateController, context),
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
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
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
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  // Helper Method for Date Input Field
  Widget _buildDateInputField(String label, TextEditingController controller, BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("Date field tapped"); // Log ketika field diklik
        _selectDate(context);
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
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ),
    );
  }
}
