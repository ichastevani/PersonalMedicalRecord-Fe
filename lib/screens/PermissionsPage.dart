import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: PermissionsPage(),
    debugShowCheckedModeBanner: false,
  ));
}

class PermissionsPage extends StatelessWidget {
  const PermissionsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, // Number of tabs
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Permissions'),
          backgroundColor: Color(0xFF004AAD),
          bottom: const TabBar(
            labelColor: Colors.white,
            indicatorColor: Colors.white,
            unselectedLabelColor: Colors.white70,
            tabs: [
              Tab(text: 'Notification'),
              Tab(text: 'Access History'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            NotificationsTab(),
            AccessHistoryTab(),
          ],
        ),
      ),
    );
  }
}

class NotificationsTab extends StatelessWidget {
  const NotificationsTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> notifications = [
      {
        'name': 'Dr. John Doe',
        'time': '04:32 pm',
        'message': 'Requested access to your Vaccination Records',
      },
      {
        'name': 'Dr. Alex',
        'time': '04:32 pm',
        'message': 'Requested access to your Vaccination Records',
      },
    ];

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: notifications.length,
      itemBuilder: (context, index) {
        final item = notifications[index];
        return Card(
          elevation: 2,
          margin: const EdgeInsets.only(bottom: 16),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      item['name']!,
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    Text(
                      item['time']!,
                      style: const TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  item['message']!,
                  style: const TextStyle(fontSize: 14, color: Colors.grey),
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomButton(
                      text: 'Approve View',
                      color: Colors.white,
                      borderColor: Color(0xFF004AAD),
                      textColor: Color(0xFF004AAD),
                    ),
                    CustomButton(
                      text: 'Approve Edit',
                      color: Color(0xFF004AAD),
                      borderColor: Color(0xFF004AAD),
                      textColor: Colors.white,
                    ),
                    CustomButton(
                      text: 'Reject',
                      color: Colors.white,
                      borderColor: Colors.red,
                      textColor: Colors.red,
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
}

class AccessHistoryTab extends StatelessWidget {
  const AccessHistoryTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> accessHistory = [
      {
        'name': 'Dr. John Doe',
        'time': '04:32 pm',
        'message': 'Access to your Vaccination Records',
      },
      {
        'name': 'Dr. Alex',
        'time': '04:32 pm',
        'message': 'Access to your Vaccination Records',
      },
    ];

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: accessHistory.length,
      itemBuilder: (context, index) {
        final item = accessHistory[index];
        return Card(
          elevation: 2,
          margin: const EdgeInsets.only(bottom: 16),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      item['name']!,
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    Text(
                      item['time']!,
                      style: const TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  item['message']!,
                  style: const TextStyle(fontSize: 14, color: Colors.grey),
                ),
                const SizedBox(height: 8),
                CustomButton(
                  text: 'Revoke Access',
                  color: Colors.white,
                  borderColor: Colors.red,
                  textColor: Colors.red,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class CustomButton extends StatelessWidget {
  final String text;
  final Color color;
  final Color borderColor;
  final Color textColor;

  const CustomButton({
    Key? key,
    required this.text,
    required this.color,
    required this.borderColor,
    required this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        backgroundColor: color,
        side: BorderSide(color: borderColor),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      onPressed: () {},
      child: Text(
        text,
        style: TextStyle(color: textColor, fontSize: 14),
      ),
    );
  }
}
