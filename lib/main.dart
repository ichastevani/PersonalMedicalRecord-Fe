import 'package:flutter/material.dart';
import 'screens/connect_wallet_screen.dart'; // Tambahkan ini

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ConnectWalletScreen(), // Ubah ini menjadi ConnectWalletScreen
    );
  }
}
