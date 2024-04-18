import 'package:flutter/material.dart';

void main() {
  runApp(
    const MyApp(
      message: 'Happy\nBirthday\nGOMI!',
      from: 'Djima',
    ),
  );
}

class MyApp extends StatelessWidget {
  final String message;
  final String from;

  const MyApp({super.key, required this.message, required this.from});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Birthday Card',
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // SelectionContainer.disabled(
                 Text(
                  message,
                  style: const TextStyle(
                    fontSize: 100,
                  ),
                ),
              Container(
                alignment: Alignment.centerRight,
                padding: const EdgeInsets.only(right: 20),
                child: Text(
                  'From : $from',
                  style: const TextStyle(
                    fontSize: 40,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
