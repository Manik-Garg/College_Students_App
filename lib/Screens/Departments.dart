import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class OurDepartments extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("Departments"),
      ),
      backgroundColor: Colors.red[100],
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Center(
                      child: Text(
                        "Departments of College",
                        style: TextStyle(
                          fontSize: 30.0,
                          color: Colors.red,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.06,
                    ),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                              text: 'Explore Computer Engineering Department. ',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.red)),
                          TextSpan(
                              text: 'click here to know more',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.blue,
                                  decoration: TextDecoration.underline),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  launch('https://jcboseust.ac.in/computers/');
                                })
                        ],
                      ),
                    ),
                    SizedBox(
                      height: height * 0.03,
                    ),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                              text:
                                  'Explore Electronics Engineering Department. ',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.red)),
                          TextSpan(
                              text: 'click here to know more',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.blue,
                                  decoration: TextDecoration.underline),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  launch(
                                      'https://jcboseust.ac.in/electronics/');
                                })
                        ],
                      ),
                    ),
                    SizedBox(
                      height: height * 0.03,
                    ),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                              text:
                                  'Explore Electrical Engineering Department. ',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.red)),
                          TextSpan(
                              text: 'click here to know more',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.blue,
                                  decoration: TextDecoration.underline),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  launch('https://jcboseust.ac.in/electrical/');
                                })
                        ],
                      ),
                    ),
                    SizedBox(
                      height: height * 0.03,
                    ),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                              text:
                                  'Explore Mechanical Engineering Department. ',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.red)),
                          TextSpan(
                              text: 'click here to know more',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.blue,
                                  decoration: TextDecoration.underline),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  launch('https://jcboseust.ac.in/mechanical/');
                                })
                        ],
                      ),
                    ),
                    SizedBox(
                      height: height * 0.03,
                    ),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                              text: 'Explore Civil Engineering Department. ',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.red)),
                          TextSpan(
                              text: 'click here to know more.',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.blue,
                                  decoration: TextDecoration.underline),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  launch('https://jcboseust.ac.in/civil/');
                                })
                        ],
                      ),
                    ),
                    SizedBox(
                      height: height * 0.03,
                    ),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                              text: 'Explore more about Physics Department.',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.red)),
                          TextSpan(
                              text: 'click here to know more',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.blue,
                                  decoration: TextDecoration.underline),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  launch('https://jcboseust.ac.in/physics');
                                })
                        ],
                      ),
                    ),
                    SizedBox(
                      height: height * 0.03,
                    ),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                              text:
                                  'Explore more about Mathematics Department. ',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.red)),
                          TextSpan(
                              text: 'click here to know more',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.blue,
                                  decoration: TextDecoration.underline),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  launch('https://jcboseust.ac.in/math');
                                })
                        ],
                      ),
                    ),
                    SizedBox(
                      height: height * 0.03,
                    ),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                              text: 'Explore more about Chemistry Department. ',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.red)),
                          TextSpan(
                              text: 'click here to know more',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.blue,
                                  decoration: TextDecoration.underline),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  launch('https://jcboseust.ac.in/chemistry');
                                })
                        ],
                      ),
                    ),
                    SizedBox(
                      height: height * 0.03,
                    ),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                              text: 'Explore more about MBA Department. ',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.red)),
                          TextSpan(
                              text: 'click here to know more ',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.blue,
                                  decoration: TextDecoration.underline),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  launch('https://jcboseust.ac.in/mba');
                                })
                        ],
                      ),
                    ),
                    SizedBox(
                      height: height * 0.03,
                    ),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                              text:
                                  'Explore more about Liberal Arts and Media Studies Department. ',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.red)),
                          TextSpan(
                              text: 'click here to know more ',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.blue,
                                  decoration: TextDecoration.underline),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  launch('https://jcboseust.ac.in/liberalarts');
                                })
                        ],
                      ),
                    ),
                    SizedBox(
                      height: height * 0.03,
                    ),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                              text:
                                  'Explore more about Environmental Sciences Department. ',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.red)),
                          TextSpan(
                              text: 'click here to know more ',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.blue,
                                  decoration: TextDecoration.underline),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  launch('https://jcboseust.ac.in/evs');
                                })
                        ],
                      ),
                    ),
                    SizedBox(
                      height: height * 0.03,
                    ),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                              text:
                                  'Explore more about Life Sciences Department. ',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.red)),
                          TextSpan(
                              text: 'click here to know more ',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.blue,
                                  decoration: TextDecoration.underline),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  launch(
                                      'https://jcboseust.ac.in/lifesciences');
                                })
                        ],
                      ),
                    ),
                    SizedBox(
                      height: height * 0.06,
                    ),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                              text: 'Explore more at official site ',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.red)),
                          TextSpan(
                              text: 'click here ',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.blue,
                                  decoration: TextDecoration.underline),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  launch('https://jcboseust.ac.in/');
                                })
                        ],
                      ),
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
