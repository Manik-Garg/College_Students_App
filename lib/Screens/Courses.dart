import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class OurCourses extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Text("Courses Offered"),
        ),
        backgroundColor: Colors.red[100],
        body: Container(
          child: SingleChildScrollView(
            child: Column(children: [
              Padding(
                padding: EdgeInsets.all(30.0),
                child: Column(
                  children: [
                    Text(
                      "Details of Various Courses",
                      style: TextStyle(
                        fontSize: 25.0,
                        color: Colors.red,
                      ),
                    ),
                    SizedBox(
                      height: height * 0.05,
                    ),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                              text: 'Explore B.Tech Admissions ',
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
                                      'https://jcboseust.ac.in/b-tech-b-tech-leet');
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
                              text: 'Explore M.Tech Admissions ',
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
                                  launch('https://jcboseust.ac.in/m-tech');
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
                              text: 'Explore M.Tech Admissions ',
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
                                  launch('https://jcboseust.ac.in/m-tech');
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
                              text: 'Explore BCA-MCA Admissions ',
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
                                  launch('https://jcboseust.ac.in/bca-mca');
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
                              text: 'Explore B.A. - M.A. Admissions ',
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
                                  launch('https://jcboseust.ac.in/b-a-m-a');
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
                              text: 'Explore BBA - MBA  Admissions ',
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
                                  launch('https://jcboseust.ac.in/bba-mba');
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
                              text: 'Explore BSc - MSc Admissions ',
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
                                  launch('https://jcboseust.ac.in/bsc-msc');
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
                              text: 'Explore B.Voc Admissions ',
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
                                  launch('https://jcboseust.ac.in/bvoc');
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
                              text: 'Explore Phd Admissions ',
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
                                  launch('https://jcboseust.ac.in/phd');
                                })
                        ],
                      ),
                    ),
                    SizedBox(
                      height: height * 0.05,
                    ),
                  ],
                ),
              )
            ]),
          ),
        ));
  }
}
