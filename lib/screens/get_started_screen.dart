import 'package:flutter/material.dart';
import 'package:nuranest/screens/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({super.key});

  Future<void> _setSeenFlag() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('hasSeenGetStarted', true); // Set the flag to true
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 245, 240, 255), // Set background color
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20), // Adds 20 pixels of space

              // The image at the top
              const CircleAvatar(
                radius: 100,
                backgroundImage: AssetImage('lib/assets/images/18.png'),
              ),
              const SizedBox(height: 45), // Space between the image and the text

              // The Text
              const Text(
                "Let's get started",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                  height: 20 / 24,
                  letterSpacing: 0.01,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 58),

              // Description Text
              const Text(
                "Welcome to NuraNest, your journey to mental wellness.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.01,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 30),

              // Get started Button
              ElevatedButton(
                onPressed: () async {
                  await _setSeenFlag(); // Set the flag
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(320, 48),
                  padding: const EdgeInsets.symmetric(horizontal: 98, vertical: 14),
                  backgroundColor: const Color.fromRGBO(239, 222, 214, 1),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16),
                      bottomLeft: Radius.circular(16),
                      topRight: Radius.circular(16),
                      bottomRight: Radius.circular(16),
                    ),
                  ),
                ),
                child: const Text(
                  "Get Started",
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
