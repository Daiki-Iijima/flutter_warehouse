import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  // debugPaintSizeEnabled = true;

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BusinessCard',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.greenAccent),
        useMaterial3: true,
      ),
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.network(
                  'https://img.icons8.com/?size=48&id=17843&format=png'),
              Image.asset(
                'assets/icon1.png',
                height: 200,
              ),
              const Text(
                'Daiki Iijima',
                style: TextStyle(
                  fontSize: 40,
                ),
              ),
              const Text(
                'とても偉い人',
              ),
              const SizedBox(
                height: 30,
              ),
              const IntrinsicWidth(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(Icons.phone),
                        SizedBox(
                          width: 8,
                        ),
                        Text('080-2093-4013'),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(Icons.share),
                        SizedBox(
                          width: 8,
                        ),
                        Text('@Daiki-Iijima'),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(Icons.mail),
                        SizedBox(
                          width: 8,
                        ),
                        Text('daiki.iijima@example.com'),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
