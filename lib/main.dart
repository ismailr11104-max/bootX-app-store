import 'package:flutter/material.dart';

void main() {
  runApp(const BootXApp());
}

class BootXApp extends StatelessWidget {
  const BootXApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BootX',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      home: const Scaffold(body: Center(child: Text('BootX App'))),
    );
  }
}
