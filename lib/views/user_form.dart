import 'package:flutter/material.dart';

class UserForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Form', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: const Color.fromARGB(255, 124, 196, 255),
        foregroundColor: Colors.white,
      ),
      body: Center(child: Text('User Form Content Here')),
    );
  }
}
