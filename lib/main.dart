import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:figma1/Pages/home_page.dart';

Future<void> main() async {

WidgetsFlutterBinding.ensureInitialized();

// Error handlingb for Firebase

try {
await Firebase.initializeApp(

    options: DefaultFirebaseOptions.currentPlatform,
);
} catch(e) {
  throw('Error initializing Firebase: $e');
}
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
}
}

