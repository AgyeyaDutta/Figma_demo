import 'package:flutter/material.dart';
 
 class TestPage extends StatelessWidget {
  const TestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          Text("Test Screen",
          style: TextStyle(fontSize: 60))
        ],
      ),

    );
  }
}
