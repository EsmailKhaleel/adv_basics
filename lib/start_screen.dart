import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key,required this.onStart});

  final void Function() onStart;
  
  @override
  Widget build(BuildContext context) {
    return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/quiz-logo.png',
                width: 250,
                color: const Color.fromARGB(150, 255, 255, 255),
              ),
              const SizedBox(
                height: 50,
              ),
              Text(
                'Learn the flutter funny way!',
                style: GoogleFonts.lato(
                  color: const Color.fromARGB(255, 232, 192, 247),
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton.icon(
                onPressed: onStart,
                label: const Text('Start Quiz'),
                icon: const Icon(Icons.start),
              ),
            ],
          );
  }
}