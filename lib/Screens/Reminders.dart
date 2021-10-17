import 'package:flutter/material.dart';

class OurReminders extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Center(child: Text("My Reminders")),
      ),
      backgroundColor: Colors.red[100],
    );
  }
}
