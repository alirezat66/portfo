import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Testing SVG Loading'),
              SizedBox(height: 20),
              SvgPicture.asset(
                'assets/images/articles/developer.svg',
                width: 100,
                height: 100,
                placeholderBuilder: (context) {
                  print('SVG Loading: developer.svg');
                  return Icon(Icons.image, size: 50);
                },
                errorBuilder: (context, error, stackTrace) {
                  print('SVG Error: $error');
                  print('Stack trace: $stackTrace');
                  return Icon(Icons.error, size: 50, color: Colors.red);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
