import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class OurHistory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("History"),
      ),
      backgroundColor: Colors.red[100],
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: Image(
                    image: AssetImage("images/ymcaold.jpg"),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  "J.C. Bose University of Science and Technology, YMCA, Faridabad (erstwhile YMCA University of Science and Technology, Faridabad erstwhile YMCA Institute of Engineering, Faridabad) was established in the year 1969, as a joint venture of the National Council of YMCAs of India, Govt of Haryana, and the Central Agencies for Development Aid, Bonn, Germany. It started as an Indo-German project with an aim to impart technical education to a developing India on German pattern.",
                  style: TextStyle(fontSize: 20.0, color: Colors.red),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                          text: 'Explore Our Inspiration. ',
                          style: TextStyle(fontSize: 20, color: Colors.red)),
                      TextSpan(
                          text: 'click here to know more',
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.blue,
                              decoration: TextDecoration.underline),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              launch('https://jcboseust.ac.in/our-inspiration');
                            })
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  child: Image(
                    image: AssetImage("images/download.png"),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                          text: 'Explore More About J.C. Bose UST YMCA ',
                          style: TextStyle(fontSize: 20, color: Colors.red)),
                      TextSpan(
                          text: 'click here to go to official website',
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.blue,
                              decoration: TextDecoration.underline),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              launch('https://jcboseust.ac.in');
                            })
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.05,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
