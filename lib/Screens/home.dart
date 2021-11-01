import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dummy01/Screens/AboutCollege.dart';
import 'package:dummy01/Screens/Assignments.dart';
import 'package:dummy01/Screens/Classes.dart';
import 'package:dummy01/Screens/Developers.dart';
import 'package:dummy01/Screens/Marks.dart';
import 'package:dummy01/Screens/Profile.dart';
import 'package:dummy01/Screens/Reminders.dart';
import 'package:dummy01/Screens/TnPSection.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../main.dart';
import 'Attendance.dart';
import 'MyUploads.dart';
import 'Notices.dart';

class OurHomePage extends StatefulWidget {
  @override
  _OurHomePageState createState() => _OurHomePageState();
}

class _OurHomePageState extends State<OurHomePage> {
  String _teacherid;
  String _groupname;
  bool isLoaded = true;
  bool isClassExist = true;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return WillPopScope(
      onWillPop: () {
        exit(0);
        //return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("Welcome Student"),
          backgroundColor: Colors.red,
          actions: [
            Text("Sign Out"),
            IconButton(
              icon: Icon(
                Icons.exit_to_app,
              ),
              onPressed: () async {
                await FirebaseAuth.instance.signOut().whenComplete(
                  () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => StartPage()),
                    );
                  },
                );
              },
              color: Colors.white,
            )
          ],
        ),
        backgroundColor: Colors.red[100],
        drawer: Drawer(
          // Add a ListView to the drawer. This ensures the user can scroll
          // through the options in the drawer if there isn't enough vertical
          // space to fit everything.
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                child: Container(
                  child: Image(
                    image: AssetImage(
                      "images/download.png",
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                  color: Colors.red,
                ),
              ),
              ListTile(
                title: Row(
                  children: [
                    Icon(Icons.person),
                    SizedBox(
                      width: width * 0.02,
                    ),
                    Text(
                      'My Profile',
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
                    MaterialPageRoute(builder: (context) => OurProfile()),
                  );
                },
              ),
              ListTile(
                title: Row(
                  children: [
                    Icon(Icons.business_sharp),
                    SizedBox(
                      width: width * 0.02,
                    ),
                    Text(
                      'About College',
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
                    MaterialPageRoute(builder: (context) => OurAboutCollege()),
                  );
                },
              ),
              ListTile(
                title: Row(
                  children: [
                    Icon(Icons.assignment),
                    SizedBox(
                      width: width * 0.02,
                    ),
                    Text(
                      'My Assignments',
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
                    MaterialPageRoute(builder: (context) => OurAssignments()),
                  );
                },
              ),
              ListTile(
                title: Row(
                  children: [
                    Icon(Icons.report_gmailerrorred_sharp),
                    SizedBox(
                      width: width * 0.02,
                    ),
                    Text(
                      'My Marks Report',
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
                    MaterialPageRoute(builder: (context) => OurMarks()),
                  );
                },
              ),
              ListTile(
                title: Row(
                  children: [
                    Icon(Icons.reorder_rounded),
                    SizedBox(
                      width: width * 0.02,
                    ),
                    Text(
                      'My Attendance Report',
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
                    MaterialPageRoute(builder: (context) => OurAttendance()),
                  );
                },
              ),
              ListTile(
                title: Row(
                  children: [
                    Icon(Icons.notifications_active),
                    SizedBox(
                      width: width * 0.02,
                    ),
                    Text(
                      'My Notices',
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
                    MaterialPageRoute(builder: (context) => OurNotices()),
                  );
                },
              ),
              ListTile(
                title: Row(
                  children: [
                    Icon(Icons.pending),
                    SizedBox(
                      width: width * 0.02,
                    ),
                    Text(
                      'My Reminders',
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
                    MaterialPageRoute(builder: (context) => OurReminders()),
                  );
                  // Navigator.pop(context);
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
          height: height,
          width: width,
          child: isLoaded
              ? SingleChildScrollView(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: height * 0.03,
                        ),
                        Container(
                          height: height * 0.08,
                          width: width * 0.8,
                          decoration: BoxDecoration(
                              color: Colors.white38,
                              border: Border.all(color: Colors.red, width: 2),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          child: Center(
                            child: ListTile(
                              title: Center(
                                  child: Text(
                                "Classes",
                                style: TextStyle(
                                    color: Colors.red, fontSize: 20.0),
                              )),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => OurClasses()));
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
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          child: Center(
                            child: ListTile(
                              title: Center(
                                  child: Text(
                                "Assignments",
                                style: TextStyle(
                                    color: Colors.red, fontSize: 20.0),
                              )),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            OurAssignments()));
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
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          child: Center(
                            child: ListTile(
                              title: Center(
                                  child: Text(
                                "Notices",
                                style: TextStyle(
                                    color: Colors.red, fontSize: 20.0),
                              )),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => OurNotices()));
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
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          child: Center(
                            child: ListTile(
                              title: Center(
                                  child: Text(
                                "Attendance",
                                style: TextStyle(
                                    color: Colors.red, fontSize: 20.0),
                              )),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => OurAttendance()));
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
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          child: Center(
                            child: ListTile(
                              title: Center(
                                  child: Text(
                                "Marks",
                                style: TextStyle(
                                    color: Colors.red, fontSize: 20.0),
                              )),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => OurMarks()));
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
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          child: Center(
                            child: ListTile(
                              title: Center(
                                  child: Text(
                                "My Uploads",
                                style: TextStyle(
                                    color: Colors.red, fontSize: 20.0),
                              )),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => MyUploads()));
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
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          child: Center(
                            child: ListTile(
                              title: Center(
                                  child: Text(
                                "T&P Section",
                                style: TextStyle(
                                    color: Colors.red, fontSize: 20.0),
                              )),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => TnP()));
                              },
                            ),
                          ),
                        ),
                        SizedBox(
                          height: height * 0.10,
                        ),
                        FloatingActionButton(
                          backgroundColor: Colors.red,
                          child: Icon(Icons.add, color: Colors.white),
                          onPressed: () async {
                            await showDialog(
                                context: context,
                                builder: (context) => Dialog(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20.0))),
                                    child: Container(
                                      height: height * 0.4,
                                      width: width * 0.75,
                                      decoration: BoxDecoration(
                                          color: Colors.red[100],
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20))),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(20)),
                                                border: Border.all(
                                                    color: Colors.red,
                                                    width: 2),
                                                color: Colors.white38,
                                              ),
                                              padding: EdgeInsets.all(10),
                                              child: TextField(
                                                onChanged: (value) {
                                                  setState(() {
                                                    _teacherid = value;
                                                  });
                                                },
                                                keyboardType:
                                                    TextInputType.emailAddress,
                                                decoration: InputDecoration(
                                                  hintText: "Enter Teacher Id",
                                                  border: InputBorder.none,
                                                ),
                                              ),
                                              height: height * 0.1,
                                              width: width * 0.75,
                                            ),
                                          ),
                                          Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(20)),
                                                  border: Border.all(
                                                      color: Colors.red,
                                                      width: 2),
                                                  color: Colors.white38,
                                                ),
                                                padding: EdgeInsets.all(10),
                                                child: TextField(
                                                  onChanged: (value) {
                                                    setState(() {
                                                      _groupname = value;
                                                    });
                                                  },
                                                  keyboardType: TextInputType
                                                      .emailAddress,
                                                  decoration: InputDecoration(
                                                    hintText:
                                                        "Enter Group Name",
                                                    border: InputBorder.none,
                                                  ),
                                                ),
                                                height: height * 0.1,
                                                width: width * 0.75,
                                              )),
                                          Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Container(
                                                child: FlatButton(
                                                  child: Text(
                                                    "Join Now",
                                                    style: TextStyle(
                                                        fontSize: 20.0,
                                                        color: Colors.red),
                                                  ),
                                                  onPressed: () async {
                                                    if (_teacherid == "" ||
                                                        _groupname == "" ||
                                                        _teacherid == null ||
                                                        _groupname == null) {
                                                      // setState(() {
                                                      //   _groupname = null;
                                                      //   _teacherid = null;
                                                      // });
                                                      await showDialog(
                                                          context: context,
                                                          builder:
                                                              (context) =>
                                                                  AlertDialog(
                                                                    backgroundColor:
                                                                        Colors.red[
                                                                            100],
                                                                    title: Text(
                                                                        "Please Enter Proper Details"),
                                                                    actions: [
                                                                      FlatButton(
                                                                          onPressed:
                                                                              () {
                                                                            Navigator.pop(context);
                                                                          },
                                                                          child:
                                                                              Text(
                                                                            "Ok",
                                                                            style:
                                                                                TextStyle(
                                                                              color: Colors.red,
                                                                              fontSize: 20.0,
                                                                            ),
                                                                          ))
                                                                    ],
                                                                  ));
                                                    } else {
                                                      setState(() {
                                                        isLoaded = false;
                                                      });

                                                      final _studentdetails =
                                                          await FirebaseFirestore
                                                              .instance
                                                              .collection(
                                                                  "students")
                                                              .doc(FirebaseAuth
                                                                  .instance
                                                                  .currentUser
                                                                  .email)
                                                              .get()
                                                              .then((value) =>
                                                                  value.data());

                                                      final _details =
                                                          await FirebaseFirestore
                                                              .instance
                                                              .collection(
                                                                  "items")
                                                              .doc("classes")
                                                              .get()
                                                              .then((value) =>
                                                                  value.data());
                                                      List<dynamic> classes =
                                                          _details["classes"];
                                                      int _classindex;
                                                      bool AlreadyEnrolled =
                                                          false;
                                                      int i;
                                                      for (i = 0;
                                                          i < classes.length;
                                                          i++) {
                                                        if (classes[i][
                                                                    "teacherID"] ==
                                                                _teacherid &&
                                                            classes[i][
                                                                    "groupName"] ==
                                                                _groupname) {
                                                          _classindex = i;
                                                          List<dynamic>
                                                              Students =
                                                              classes[i]
                                                                  ["students"];
                                                          Students.forEach(
                                                              (element) {
                                                            if (element[
                                                                    "email"] ==
                                                                _studentdetails[
                                                                    "email"]) {
                                                              AlreadyEnrolled =
                                                                  true;
                                                            }
                                                          });
                                                          break;
                                                        }
                                                      }
                                                      if (i == classes.length) {
                                                        setState(() {
                                                          isClassExist = false;
                                                        });
                                                      }
                                                      if (AlreadyEnrolled) {
                                                        setState(() {
                                                          isLoaded = true;
                                                          _teacherid = null;
                                                          _groupname = null;
                                                        });
                                                        await showDialog(
                                                            context: context,
                                                            builder:
                                                                (context) =>
                                                                    AlertDialog(
                                                                      backgroundColor:
                                                                          Colors
                                                                              .red[100],
                                                                      title: Text(
                                                                          "Already Enrolled in this Class"),
                                                                      actions: [
                                                                        FlatButton(
                                                                            onPressed:
                                                                                () {
                                                                              Navigator.pop(context);
                                                                            },
                                                                            child:
                                                                                Text(
                                                                              "Ok",
                                                                              style: TextStyle(
                                                                                color: Colors.red,
                                                                                fontSize: 20.0,
                                                                              ),
                                                                            ))
                                                                      ],
                                                                    ));
                                                      } else if (isClassExist) {
                                                        final students =
                                                            classes[_classindex]
                                                                ["students"];
                                                        students.add(
                                                            _studentdetails);
                                                        classes[_classindex]
                                                                ["students"] =
                                                            students;
                                                        await FirebaseFirestore
                                                            .instance
                                                            .collection("items")
                                                            .doc("classes")
                                                            .update({
                                                          "classes": classes,
                                                        }).whenComplete(
                                                                () async {
                                                          print("hhh");
                                                          List<dynamic> grps =
                                                              _studentdetails[
                                                                  "groups"];
                                                          //grps.add(classes[_classindex]);
                                                          grps.insert(0, {
                                                            "groupName": classes[
                                                                    _classindex]
                                                                ["groupName"],
                                                            "teacherID": classes[
                                                                    _classindex]
                                                                ["teacherID"]
                                                          });
                                                          print(grps);
                                                          // _studentdetails["groups"]
                                                          //     .insert(0, {
                                                          //   "groupName":
                                                          //       classes[_classindex]
                                                          //           ["groupName"],
                                                          //   "teacherID":
                                                          //       classes[_classindex]
                                                          //           ["teacherID"]
                                                          // });

                                                          await FirebaseFirestore
                                                              .instance
                                                              .collection(
                                                                  "students")
                                                              .doc(
                                                                  _studentdetails[
                                                                      "email"])
                                                              .update({
                                                            "groups": grps
                                                          }).whenComplete(
                                                                  () async {
                                                            setState(() {
                                                              _teacherid = null;
                                                              _groupname = null;
                                                              isLoaded = true;
                                                            });
                                                            await showDialog(
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (context) =>
                                                                        AlertDialog(
                                                                          backgroundColor:
                                                                              Colors.red[100],
                                                                          title:
                                                                              Text("Class Joined, Open Classes Tab"),
                                                                          actions: [
                                                                            FlatButton(
                                                                                onPressed: () {
                                                                                  Navigator.pop(context);
                                                                                },
                                                                                child: Text(
                                                                                  "Ok",
                                                                                  style: TextStyle(
                                                                                    color: Colors.red,
                                                                                    fontSize: 20.0,
                                                                                  ),
                                                                                ))
                                                                          ],
                                                                        ));

                                                            // Navigator.pushReplacement(
                                                            //     context,
                                                            //     MaterialPageRoute(
                                                            //         builder:
                                                            //             (context) =>
                                                            //                 OurClasses()));
                                                          });
                                                        });
                                                      } else {
                                                        setState(() {
                                                          isLoaded = true;
                                                          _teacherid = null;
                                                          _groupname = null;
                                                          isClassExist = true;
                                                        });
                                                        await showDialog(
                                                            context: context,
                                                            builder:
                                                                (context) =>
                                                                    AlertDialog(
                                                                      backgroundColor:
                                                                          Colors
                                                                              .red[100],
                                                                      title: Text(
                                                                          "No Such Class Exist, Confirm Your Teacher"),
                                                                      actions: [
                                                                        FlatButton(
                                                                            onPressed:
                                                                                () {
                                                                              Navigator.pop(context);
                                                                            },
                                                                            child:
                                                                                Text(
                                                                              "Ok",
                                                                              style: TextStyle(
                                                                                color: Colors.red,
                                                                                fontSize: 20.0,
                                                                              ),
                                                                            ))
                                                                      ],
                                                                    ));
                                                      }

                                                      Navigator.pop(context);
                                                      // if (AlreadyEnrolled ==
                                                      //         false &&
                                                      //     isClassExist ==
                                                      //         true) {
                                                      //   Navigator.push(
                                                      //       context,
                                                      //       MaterialPageRoute(
                                                      //           builder:
                                                      //               (context) =>
                                                      //                   OurClasses()));
                                                      // }
                                                    }
                                                  },
                                                ),
                                                height: height * 0.05,
                                                width: width * 0.75,
                                              )),
                                        ],
                                      ),
                                    )));
                          },
                        ),
                        SizedBox(
                          height: height * 0.005,
                        ),
                        Text(
                          "click + button to join a Class",
                          style: TextStyle(color: Colors.red),
                        ),
                        SizedBox(
                          height: height * 0.01,
                        )
                      ],
                    ),
                  ),
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                      CircularProgressIndicator(
                        valueColor:
                            new AlwaysStoppedAnimation<Color>(Colors.red),
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
      ),
    );
  }
}
