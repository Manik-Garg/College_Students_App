import 'package:flutter/material.dart';

class OurUploads extends StatefulWidget {
  @override
  _OurUploadsState createState() => _OurUploadsState();
}

class _OurUploadsState extends State<OurUploads> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Center(child: Text("Your Uploads")),
      ),
      backgroundColor: Colors.red[100],
    );
  }
}
