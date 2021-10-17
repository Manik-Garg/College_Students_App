import 'package:dummy01/Screens/Courses.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class OurAdmissions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Text("Admissions"),
        ),
        backgroundColor: Colors.red[100],
        body: Container(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    padding: EdgeInsets.all(8.0),
                    height: height * 0.35,
                    width: width * 0.8,
                    decoration: BoxDecoration(
                        color: Colors.red[100],
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Text(
                      "J.C. Bose University of Science and Technology, YMCA, Faridabad provides Various Courses.\n\nOne Can Easily choose Any Course according to the department or field he/she want to study",
                      style: TextStyle(fontSize: 20.0, color: Colors.red),
                    ),
                  ),
                ),
                Container(
                  width: width * 0.8,
                  decoration: BoxDecoration(
                      color: Colors.white38,
                      border: Border.all(color: Colors.red, width: 2),
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  margin: EdgeInsets.only(bottom: 10),
                  child: ListTile(
                    title: Center(
                      child: Text(
                        "Courses Offered",
                        style: TextStyle(color: Colors.red, fontSize: 25.0),
                      ),
                    ),
                    subtitle: Center(
                      child: Text("Press for more course's admissions details"),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => OurCourses()),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(30.0),
                  child: Container(
                    padding: EdgeInsets.all(10.0),
                    height: height * 0.5,
                    width: width * 0.8,
                    decoration: BoxDecoration(
                        color: Colors.white38,
                        border: Border.all(color: Colors.red, width: 2),
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Column(
                      children: [
                        SizedBox(
                          height: height * 0.02,
                        ),
                        Text(
                          "Other Details",
                          style: TextStyle(
                            fontSize: 30.0,
                            color: Colors.red,
                          ),
                        ),
                        SizedBox(
                          height: height * 0.05,
                        ),
                        Column(
                          children: [
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                      text: 'Explore Seat Matrix ',
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.red)),
                                  TextSpan(
                                      text: 'click here to know more',
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.blue,
                                          decoration: TextDecoration.underline),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          launch(
                                              'https://jcboseust.ac.in/seat-matrix');
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
                                      text: 'Explore Admission Calender ',
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.red)),
                                  TextSpan(
                                      text: 'click here to know more',
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.blue,
                                          decoration: TextDecoration.underline),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          launch(
                                              'https://jcboseust.ac.in/admission-calender');
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
                                      text: 'Explore Fee-Structure ',
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.red)),
                                  TextSpan(
                                      text: 'click here to know more',
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.blue,
                                          decoration: TextDecoration.underline),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          launch(
                                              'https://jcboseust.ac.in/assets/uploads/media/c2e71f4b94367cf921683f55e58e9b3a.pdf');
                                        })
                                ],
                              ),
                            ),
                            SizedBox(
                              height: height * 0.05,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
