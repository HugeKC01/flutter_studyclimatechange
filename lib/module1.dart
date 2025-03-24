import 'package:flutter/material.dart';

class Module1Screen extends StatelessWidget {
  const Module1Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Module 1: Introduction to Climate Change'),
      ),
      body: Center(
        child: Text('Content for Module 1'),
      ),
    );
  }
}