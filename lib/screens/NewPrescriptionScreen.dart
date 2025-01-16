import 'package:flutter/material.dart';

class NewPrescriptionScreen extends StatelessWidget {
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
              // Input Field: Prescription Title
              _buildInputField('Prescription Title'),
              SizedBox(height: 16),

              // Input Field: Type of Disease
              _buildInputField('Type of Disease'),
              SizedBox(height: 16),

              // Input Field: Doctor's Name
              _buildInputField("Doctor's Name"),
              SizedBox(height: 16),

              // Input Field: Prescription Date
              _buildDateInputField('Prescription Date', context),
              SizedBox(height: 16),

              // Input Field: Notes
              _buildInputField('Notes'),
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
  Widget _buildDateInputField(String label, BuildContext context) {
    final TextEditingController _dateController = TextEditingController();

    return GestureDetector(
      onTap: () => _selectDate(context, _dateController), // Menggunakan context yang benar
      child: AbsorbPointer(
        child: TextField(
          controller: _dateController,
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

  Future<void> _selectDate(BuildContext context, TextEditingController controller) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (pickedDate != null) {
      controller.text = "${pickedDate.day}-${pickedDate.month}-${pickedDate.year}";
    }
  }
}
