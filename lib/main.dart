import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:resume_web/pages/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(
    options: const FirebaseOptions(
        apiKey: "AIzaSyDhWbeZhsSNzFKDXfUzgZUuMI-Sd_4Yaog",
        authDomain: "resume-download-5c6c6.firebaseapp.com",
        projectId: "resume-download-5c6c6",
        storageBucket: "resume-download-5c6c6.appspot.com",
        messagingSenderId: "1096859204889",
        appId: "1:1096859204889:web:46cc08b873acb5445e1988",
        measurementId: "G-S53MS7F33S"),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      title: 'Sagar Sinha',
      home: const HomePage(),
    );
  }
}
