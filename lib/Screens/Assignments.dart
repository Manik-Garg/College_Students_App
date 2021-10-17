import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class OurAssignments extends StatefulWidget {
  @override
  _OurAssignmentsState createState() => _OurAssignmentsState();
}

class _OurAssignmentsState extends State<OurAssignments> {
  bool isLoaded = false;
  List<dynamic> groups = [];

  List<dynamic> enrolledAssignments = [];
  List<dynamic> enrolledClasses = [];

  Future<bool> fetch() async {
    String studentEmail = FirebaseAuth.instance.currentUser.email;
    final data1 = await FirebaseFirestore.instance
        .collection("students")
        .doc(FirebaseAuth.instance.currentUser.email)
        .get()
        .then((value) => value.data());
    enrolledClasses = data1["groups"];
    //print(enrolledClasses);
    final data2 = await FirebaseFirestore.instance
        .collection("items")
        .doc("classes")
        .get()
        .then((value) => value.data());
    List<dynamic> classes = data2["classes"];
    List<dynamic> dummy = [];
    List<dynamic> dummy1 = [];
    for (int i = 0; i < enrolledClasses.length; i++) {
      classes.forEach((element) {
        if (element["teacherID"] == enrolledClasses[i]["teacherID"] &&
            element["groupName"] == enrolledClasses[i]["groupName"]) {
          //print(element);
          dummy.add(element);
        }
      });
    }
    dummy.forEach((element) {
      List<dynamic> uploads = element["uploads"];
      uploads.forEach((e) {
        if (e["type"] == "Assignment") {
          dummy1.add(e);
        }
      });
    });
    dummy1.sort((a, b) => (b["uploadTime"] as Timestamp)
        .toDate()
        .compareTo((a["uploadTime"] as Timestamp).toDate()));
    setState(() {
      groups = dummy;
      enrolledAssignments = dummy1;
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
        title: Text("My Assignments"),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      backgroundColor: Colors.red[100],
      body: Container(
        height: height,
        width: width,
        padding: EdgeInsets.all(10),
        child: isLoaded
            ? enrolledAssignments.isEmpty
                ? Center(
                    child: Text(
                      "No Assignments to display",
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 30.0,
                      ),
                    ),
                  )
                : Column(
                    children: [
                      Expanded(
                          flex: 6,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "All Assignments can be downloaded from here !\n\nFor submitting your personal Solution to specific assignment, Please go to respective class and submit there.",
                              style:
                                  TextStyle(fontSize: 20.0, color: Colors.red),
                            ),
                          )),
                      Expanded(
                        flex: 15,
                        child: ListView.builder(
                          itemCount: enrolledAssignments.length,
                          itemBuilder: (context, i) {
                            return Container(
                              margin: EdgeInsets.only(top: 8.0),
                              width: width * 0.8,
                              decoration: BoxDecoration(
                                  color: Colors.white38,
                                  border:
                                      Border.all(color: Colors.red, width: 2),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                              //padding: EdgeInsets.all(10),
                              child: ListTile(
                                title: Center(
                                  child: Text(
                                    enrolledAssignments[i]["content"],
                                    style: TextStyle(
                                        color: Colors.red, fontSize: 20.0),
                                  ),
                                ),
                                subtitle: Center(
                                  child: Text(enrolledAssignments[i]
                                              ["dueDate"] !=
                                          null
                                      ? "Due: ${(enrolledAssignments[i]["dueDate"] as Timestamp).toDate().day}/${(enrolledAssignments[i]["dueDate"] as Timestamp).toDate().month}/${(enrolledAssignments[i]["dueDate"] as Timestamp).toDate().year}  ${(enrolledAssignments[i]["dueDate"] as Timestamp).toDate().hour}:${(enrolledAssignments[i]["dueDate"] as Timestamp).toDate().minute}"
                                      : "Upload Time: ${(enrolledAssignments[i]["uploadTime"] as Timestamp).toDate().day}/${(enrolledAssignments[i]["uploadTime"] as Timestamp).toDate().month}/${(enrolledAssignments[i]["uploadTime"] as Timestamp).toDate().year}  ${(enrolledAssignments[i]["uploadTime"] as Timestamp).toDate().hour}:${(enrolledAssignments[i]["uploadTime"] as Timestamp).toDate().minute}"),
                                ),
                                // onLongPress: () {
                                //   Navigator.push(
                                //       context,
                                //       MaterialPageRoute(
                                //           builder: (context) => OurSubmission(
                                //                 groupName: widget.name,
                                //                 teacherID: widget.id,
                                //                 assignmentUrl: widget.list[i]["link"],
                                //                 assignmentName: widget.list[i]
                                //                     ["content"],
                                //               )));
                                // },
                                onTap: () async {
                                  if (enrolledAssignments[i]["link"] != "") {
                                    await showDialog(
                                        context: context,
                                        builder: (context) => AlertDialog(
                                              backgroundColor: Colors.red[100],
                                              title: Text("Link to be found"),
                                              actions: [
                                                FlatButton(
                                                    onPressed: () {
                                                      Navigator.pop(context);
                                                      launch(
                                                          enrolledAssignments[i]
                                                              ["link"]);
                                                    },
                                                    child: Text(
                                                      "Download Link",
                                                      style: TextStyle(
                                                        color: Colors.red,
                                                        fontSize: 20.0,
                                                      ),
                                                    ))
                                              ],
                                            ));
                                    //launch(enrolledAssignments[i]["link"]);
                                  } else {
                                    await showDialog(
                                        context: context,
                                        builder: (context) => AlertDialog(
                                              backgroundColor: Colors.red[100],
                                              title:
                                                  Text("No Link to be found"),
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
                                  }
                                },
                              ),
                            );
                          },
                        ),
                      ),
                    ],
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
