import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dummy01/Screens/ClassAssignment.dart';
import 'package:dummy01/Screens/ClassAttendance.dart';
import 'package:dummy01/Screens/ClassMarks.dart';
import 'package:dummy01/Screens/ClassNotice.dart';
import 'package:flutter/material.dart';

import 'Video Lectures.dart';

class OurClassHomePage extends StatefulWidget {
  final String classname;
  final String teachername;
  final String teacherID;
  final int number;

  const OurClassHomePage(
      {this.classname, this.teachername, this.number, this.teacherID});

  @override
  _OurClassHomePageState createState() => _OurClassHomePageState();
}

class _OurClassHomePageState extends State<OurClassHomePage> {
  bool isLoaded = false;
  List<dynamic> uploads = [];
  List<dynamic> groups = [];

  Future<bool> fetch() async {
    final data2 = await FirebaseFirestore.instance
        .collection("items")
        .doc("classes")
        .get()
        .then((value) => value.data());
    List<dynamic> classes = data2["classes"];
    List<dynamic> dummy = [];
    // print(classes);
    classes.forEach((element) {
      if (element["teacherID"] == widget.teacherID &&
          element["groupName"] == widget.classname) {
        //print(element);
        dummy.add(element);
      }
    });

    setState(() {
      uploads = dummy[0]["uploads"];
    });
    return true;
  }

  @override
  void initState() {
    fetch().whenComplete(() {
      setState(() {
        isLoaded = true;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Center(
            child: Text(
          widget.classname,
          overflow: TextOverflow.ellipsis,
        )),
      ),
      backgroundColor: Colors.red[100],
      body: Container(
        height: height,
        width: width,
        padding: EdgeInsets.all(10),
        child: isLoaded
            ? SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: height * 0.02,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                          SizedBox(
                            width: width * 0.05,
                          ),
                          Expanded(
                              child: Text(
                            "Class Name : ",
                            style:
                                TextStyle(fontSize: 20.0, color: Colors.black),
                          )),
                          Expanded(
                            child: Text(
                              widget.classname,
                              style:
                                  TextStyle(fontSize: 20.0, color: Colors.red),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: height * 0.03,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                          SizedBox(
                            width: width * 0.05,
                          ),
                          Expanded(
                              child: Text(
                            "Teacher's Name : ",
                            style:
                                TextStyle(fontSize: 20.0, color: Colors.black),
                          )),
                          Expanded(
                            child: Text(
                              widget.teachername,
                              style:
                                  TextStyle(fontSize: 20.0, color: Colors.red),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: height * 0.03,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                          SizedBox(
                            width: width * 0.05,
                          ),
                          Expanded(
                              flex: 2,
                              child: Text(
                                "Number of Students : ",
                                style: TextStyle(
                                    fontSize: 20.0, color: Colors.black),
                              )),
                          Expanded(
                            child: Text(
                              widget.number.toString(),
                              style:
                                  TextStyle(fontSize: 20.0, color: Colors.red),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: height * 0.05,
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
                            "Assignments",
                            style: TextStyle(color: Colors.red),
                          )),
                          onTap: () {
                            List<dynamic> variable = [];
                            uploads.forEach((element) {
                              if (element["type"] == "Assignment") {
                                variable.add(element);
                              }
                            });
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => OurClassAssignment(
                                          list: variable,
                                          name: widget.classname,
                                          id: widget.teacherID,
                                        )));
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
                            "Notices",
                            style: TextStyle(color: Colors.red),
                          )),
                          onTap: () {
                            List<dynamic> variable = [];
                            uploads.forEach((element) {
                              if (element["type"] == "Notice") {
                                variable.add(element);
                              }
                            });
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => OurClassNotice(
                                          list: variable,
                                          name: widget.classname,
                                        )));
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
                            "Video Lectures",
                            style: TextStyle(color: Colors.red),
                          )),
                          onTap: () {
                            List<dynamic> variable = [];
                            uploads.forEach((element) {
                              if (element["type"] == "Video Lecture") {
                                variable.add(element);
                              }
                            });
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => OurClassVideos(
                                          list: variable,
                                          teacherID: widget.teacherID,
                                          name: widget.classname,
                                        )));
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
                            "Attendance",
                            style: TextStyle(color: Colors.red),
                          )),
                          onTap: () {
                            List<dynamic> variable = [];
                            uploads.forEach((element) {
                              if (element["type"] == "Attendance") {
                                variable.add(element);
                              }
                            });
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => OurClassAttendance(
                                          list: variable,
                                          name: widget.classname,
                                        )));
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
                            "Marks",
                            style: TextStyle(color: Colors.red),
                          )),
                          onTap: () {
                            List<dynamic> variable = [];
                            uploads.forEach((element) {
                              if (element["type"] == "Marks") {
                                variable.add(element);
                              }
                            });
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => OurClassMarks(
                                          list: variable,
                                          name: widget.classname,
                                        )));
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.20,
                    ),
                  ],
                ),
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                    CircularProgressIndicator(
                      valueColor: new AlwaysStoppedAnimation<Color>(Colors.red),
                    ),
                    Text(
                      "\nPlease Wait\nSlow Connection",
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 20.0,
                      ),
                    )
                  ]),
      ),
    );
  }
}
