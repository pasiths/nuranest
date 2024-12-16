import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:nuranest/screens/get_started_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:nuranest/screens/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final hasSeenGetStarted = prefs.getBool('hasSeenGetStarted') ?? false;

  await dotenv.load(fileName: ".env");
  runApp(MyApp(hasSeenGetStarted: hasSeenGetStarted));
}

class MyApp extends StatelessWidget {
  final bool hasSeenGetStarted;
  const MyApp({super.key, required this.hasSeenGetStarted});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nuranest',
      debugShowCheckedModeBanner: false,
      home: hasSeenGetStarted ? const LoginScreen() : const GetStartedScreen(),
    );
  }
}
