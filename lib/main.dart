import 'package:flutter/material.dart';
import 'injection.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext materialContext) {
    return const MaterialApp(
      home: Scaffold(body: Center(child: Text('Masroofy Setup Complete'))),
    );
  }
}
