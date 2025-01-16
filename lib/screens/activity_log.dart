import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: ActivityLogPage(),
  ));
}

class ActivityLogPage extends StatelessWidget {
  const ActivityLogPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Dummy data
    final List<Map<String, String>> activityData = [
      {
        'timestamp': '10 March 2023, 14:00',
        'activityType': 'Access Request Submitted',
        'module': 'Vaccination Records',
        'performedBy': 'Dr. John Doe',
      },
      {
        'timestamp': '09 March 2023, 12:30',
        'activityType': 'Access Granted',
        'module': 'Radiology Reports',
        'performedBy': 'Dr. Jane Smith',
      },
      // Add more dummy data here if needed
    ];

    return Scaffold(
        backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Activity Log'),
        backgroundColor: Color(0xFF004AAD),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            Container(
              color: Colors.grey[200],
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
              child: Row(
                children: const [
                  Expanded(child: Text('Timestamp', style: TextStyle(fontWeight: FontWeight.bold))),
                  Expanded(child: Text('Activity Type', style: TextStyle(fontWeight: FontWeight.bold))),
                  Expanded(child: Text('Module', style: TextStyle(fontWeight: FontWeight.bold))),
                  Expanded(child: Text('Performed By', style: TextStyle(fontWeight: FontWeight.bold))),
                ],
              ),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: ListView.builder(
                itemCount: activityData.length,
                itemBuilder: (context, index) {
                  final item = activityData[index];
                  return Container(
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(color: Colors.grey[300]!),
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                    child: Row(
                      children: [
                        Expanded(child: Text(item['timestamp'] ?? '')),
                        Expanded(child: Text(item['activityType'] ?? '')),
                        Expanded(child: Text(item['module'] ?? '')),
                        Expanded(child: Text(item['performedBy'] ?? '')),
                      ],
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
