import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class OurDevelopers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Center(child: Text("About Developer")),
      ),
      backgroundColor: Colors.red[100],
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: height * 0.1,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: Center(
                    child: Image(
                      image: AssetImage("images/developer.jpg"),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.04,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: Center(
                      child: Text(
                    "Name: Anant Jain",
                    style: TextStyle(fontSize: 20.0, color: Colors.black),
                  )),
                ),
              ),
              SizedBox(
                height: height * 0.01,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: Center(
                      child: Text(
                    "College: J.C. Bose UST YMCA",
                    style: TextStyle(fontSize: 20.0, color: Colors.black),
                  )),
                ),
              ),
              SizedBox(
                height: height * 0.01,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: Center(
                    child: Row(
                      children: [
                        SizedBox(
                          width: width * 0.20,
                        ),
                        Text(
                          "Email: ",
                          style: TextStyle(fontSize: 20.0, color: Colors.black),
                        ),
                        SizedBox(
                          width: width * 0.02,
                        ),
                        Icon(
                          Icons.email,
                        ),
                        SizedBox(
                          width: width * 0.01,
                        ),
                        Text("anant2it@gmail.com")
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.1,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                          text: 'For twitter,  ',
                          style: TextStyle(fontSize: 20, color: Colors.black)),
                      TextSpan(
                          text: 'click here',
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.lightBlueAccent,
                              decoration: TextDecoration.underline),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              launch('https://twitter.com/MasterAJ_anant');
                            })
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.01,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                          text: 'For linkedIn,  ',
                          style: TextStyle(fontSize: 20, color: Colors.black)),
                      TextSpan(
                          text: 'click here',
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.lightBlueAccent,
                              decoration: TextDecoration.underline),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              launch(
                                  'https://www.linkedin.com/in/anant-jain-b20a1a1a6/');
                            })
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.01,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                          text: 'For instagram,  ',
                          style: TextStyle(fontSize: 20, color: Colors.black)),
                      TextSpan(
                          text: 'click here',
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.lightBlueAccent,
                              decoration: TextDecoration.underline),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              launch('https://www.instagram.com/_anant_02/');
                            })
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
