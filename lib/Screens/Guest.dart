import 'package:dummy01/Screens/Academics.dart';
import 'package:dummy01/Screens/Admissions.dart';
import 'package:dummy01/Screens/Examination.dart';
import 'package:dummy01/Screens/FeedBack.dart';
import 'package:dummy01/Screens/History.dart';
import 'package:dummy01/Screens/PhotoGallery.dart';
import 'package:dummy01/Screens/SchemeandSyllabus.dart';
import 'package:dummy01/Screens/library.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'Developers.dart';
import 'Register.dart';

class GuestPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.red[100],
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Center(
            child: Text(
          'Welcome and Explore',
          style: TextStyle(color: Colors.white),
        )),
      ),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text(
                'Facilities',
                style: TextStyle(
                  fontSize: 40.0,
                  color: Colors.white,
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.red,
              ),
            ),
            ListTile(
              title: Row(
                children: [
                  Icon(Icons.analytics_rounded),
                  SizedBox(
                    width: width * 0.02,
                  ),
                  Text(
                    'Academics',
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => OurAcademics()),
                );
                // Navigator.pop(context);
              },
            ),
            ListTile(
              title: Row(
                children: [
                  Icon(Icons.article_outlined),
                  SizedBox(
                    width: width * 0.02,
                  ),
                  Text(
                    'Admissions',
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => OurAdmissions()),
                );
              },
            ),
            ListTile(
              title: Row(
                children: [
                  Icon(Icons.event),
                  SizedBox(
                    width: width * 0.02,
                  ),
                  Text(
                    'Examination',
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => OurExamination()),
                );
              },
            ),
            ListTile(
              title: Row(
                children: [
                  Icon(Icons.feedback),
                  SizedBox(
                    width: width * 0.02,
                  ),
                  Text(
                    'Feedback',
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => OurFeedback()),
                );
              },
            ),
            ListTile(
              title: Row(
                children: [
                  Icon(Icons.person),
                  SizedBox(
                    width: width * 0.02,
                  ),
                  Text(
                    'Student, Register Yourself',
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Register()),
                );
              },
            ),
            ListTile(
              title: Row(
                children: [
                  Icon(Icons.developer_mode),
                  SizedBox(
                    width: width * 0.02,
                  ),
                  Text(
                    'Developer of this App',
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => OurDevelopers()),
                );
                // Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: height * 0.03,
              ),
              Row(
                children: [
                  Expanded(
                    child: MaterialButton(
                      //padding: EdgeInsets.all(8.0),
                      textColor: Colors.white,
                      splashColor: Colors.greenAccent,
                      elevation: 8.0,
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('images/history.png'),
                              fit: BoxFit.cover),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(50.0),
                          child: Text(""),
                        ),
                      ),
                      // ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => OurHistory()),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    width: width * 0.02,
                  ),
                  Expanded(
                    child: MaterialButton(
                      //padding: EdgeInsets.all(8.0),
                      textColor: Colors.white,
                      splashColor: Colors.greenAccent,
                      elevation: 8.0,
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('images/academics.jpg'),
                              fit: BoxFit.cover),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(50.0),
                          child: Text(""),
                        ),
                      ),
                      // ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => OurAcademics()),
                        );
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: height * 0.04,
              ),
              Row(
                children: [
                  Expanded(
                    child: MaterialButton(
                      //padding: EdgeInsets.all(8.0),
                      textColor: Colors.white,
                      splashColor: Colors.greenAccent,
                      elevation: 8.0,
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('images/admissions.png'),
                              fit: BoxFit.cover),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(50.0),
                          child: Text(""),
                        ),
                      ),
                      // ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => OurAdmissions()),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    width: width * 0.02,
                  ),
                  Expanded(
                    child: MaterialButton(
                      //padding: EdgeInsets.all(8.0),
                      textColor: Colors.white,
                      splashColor: Colors.greenAccent,
                      elevation: 8.0,
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('images/examinations.jpg'),
                              fit: BoxFit.cover),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(50.0),
                          child: Text(""),
                        ),
                      ),
                      // ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => OurExamination()),
                        );
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: height * 0.04,
              ),
              Row(
                children: [
                  Expanded(
                    child: MaterialButton(
                      //padding: EdgeInsets.all(8.0),
                      textColor: Colors.white,
                      splashColor: Colors.greenAccent,
                      elevation: 8.0,
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('images/photogallery.jpg'),
                              fit: BoxFit.cover),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(50.0),
                          child: Text(""),
                        ),
                      ),
                      // ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => OurPhotoGallery()),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    width: width * 0.02,
                  ),
                  Expanded(
                    child: MaterialButton(
                      //padding: EdgeInsets.all(8.0),
                      textColor: Colors.white,
                      splashColor: Colors.greenAccent,
                      elevation: 8.0,
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('images/feedback.jpg'),
                              fit: BoxFit.cover),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(50.0),
                          child: Text(""),
                        ),
                      ),
                      // ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => OurFeedback()),
                        );
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: height * 0.03,
              ),
              Container(
                height: height * 0.08,
                width: width * 0.8,
                decoration: BoxDecoration(
                    color: Colors.white38,
                    border: Border.all(color: Colors.red, width: 2),
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: Center(
                  child: ListTile(
                    title: Center(
                        child: Text(
                      "Explore College Library",
                      style: TextStyle(color: Colors.red),
                    )),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => OurLibrary()));
                    },
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.03,
              ),
              Container(
                height: height * 0.08,
                width: width * 0.8,
                decoration: BoxDecoration(
                    color: Colors.white38,
                    border: Border.all(color: Colors.red, width: 2),
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: Center(
                  child: ListTile(
                    title: Center(
                        child: Text(
                      "Explore Scheme-Syllabus",
                      style: TextStyle(color: Colors.red),
                    )),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => OurSchemeandSyllabus()));
                    },
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.03,
              ),
              Container(
                height: height * 0.08,
                width: width * 0.8,
                decoration: BoxDecoration(
                    color: Colors.white38,
                    border: Border.all(color: Colors.red, width: 2),
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: Center(
                  child: ListTile(
                    title: Center(
                        child: Text(
                      "Explore Student Window",
                      style: TextStyle(color: Colors.red),
                    )),
                    onTap: () {
                      launch('https://jcboseust.ac.in/student-window');
                    },
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.03,
              ),
              Container(
                height: height * 0.08,
                width: width * 0.8,
                decoration: BoxDecoration(
                    color: Colors.white38,
                    border: Border.all(color: Colors.red, width: 2),
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: Center(
                  child: ListTile(
                    title: Center(
                        child: Text(
                      "Explore Holidays List",
                      style: TextStyle(color: Colors.red),
                    )),
                    onTap: () {
                      launch('https://jcboseust.ac.in/Holidays-List-2021');
                    },
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.03,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
