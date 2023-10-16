import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tawsil/views/page/intro_page.dart';
import 'package:tawsil/views/page/search_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyCUkp8_VCmGGOuYh21_-vhxofcv4u_nseY",
      databaseURL:
          "https://tawsil-261dc-default-rtdb.europe-west1.firebasedatabase.app",
      projectId: "tawsil-261dc",
      storageBucket: "tawsil-261dc.appspot.com",
      messagingSenderId: "YOUR_MESSAGING_SENDER_ID",
      appId: "com.example.tawsil",
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const IntroPage(),
      routes: {
        '/intropage': (context) => const IntroPage(),
        '/menupage': (context) => const SearchPage(),
      },
    );
  }
}
