import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:io';

class NewRadiologyRecordScreen extends StatefulWidget {
  @override
  _NewRadiologyRecordScreenState createState() =>
      _NewRadiologyRecordScreenState();
}

class _NewRadiologyRecordScreenState extends State<NewRadiologyRecordScreen> {
  File? _selectedFile;

  // Fungsi untuk memilih file dari perangkat
  Future<void> _pickFile() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.any, // Dapat memilih semua jenis file
    );

    if (result != null && result.files.single.path != null) {
      setState(() {
        _selectedFile = File(result.files.single.path!);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('New Radiology Record'),
        backgroundColor: Color(0xFF004AAD),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Upload File Section
              Text(
                'Upload File',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 8),
              GestureDetector(
                onTap: _pickFile, // Fungsi untuk memilih file
                child: Container(
                  width: double.infinity,
                  height: 150,
                  decoration: BoxDecoration(
                    color: Color(0xFFF5F0FF),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: _selectedFile != null
                        ? Text(
                      'File Selected: ${_selectedFile!.path.split('/').last}',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 14, color: Colors.black),
                    )
                        : Icon(
                      Icons.add,
                      size: 40,
                      color: Color(0xFF9E9E9E),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16),

              // Input Fields
              _buildInputField('Report Name'),
              SizedBox(height: 16),
              _buildInputField('Body Part Scanned'),
              SizedBox(height: 16),
              _buildInputField('Scan Date'),
              SizedBox(height: 16),
              _buildInputField('Performed By'),
              SizedBox(height: 16),
              _buildInputField('Notes'),
              SizedBox(height: 32),

              // Save Button
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    if (_selectedFile != null) {
                      print('File Selected: ${_selectedFile!.path}');
                    } else {
                      print('No file selected');
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF004AAD),
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
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

  // Helper Method for Input Fields
  Widget _buildInputField(String label) {
    return TextField(
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(
          color: Colors.grey,
          fontSize: 14,
        ),
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        filled: true,
        fillColor: Color(0xFFF5F0FF),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
