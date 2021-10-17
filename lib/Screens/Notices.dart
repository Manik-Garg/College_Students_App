import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class OurNotices extends StatefulWidget {
  @override
  _OurNoticesState createState() => _OurNoticesState();
}

class _OurNoticesState extends State<OurNotices> {
  bool isLoaded = false;
  List<dynamic> groups = [];

  List<dynamic> enrolledNotices = [];
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
        if (e["type"] == "Notice") {
          dummy1.add(e);
        }
      });
    });
    dummy1.sort((a, b) => (b["uploadTime"] as Timestamp)
        .toDate()
        .compareTo((a["uploadTime"] as Timestamp).toDate()));
    setState(() {
      groups = dummy;
      enrolledNotices = dummy1;
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
        title: Text("My Notices"),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      backgroundColor: Colors.red[100],
      body: Container(
        height: height,
        width: width,
        padding: EdgeInsets.all(10),
        child: isLoaded
            ? enrolledNotices.isEmpty
                ? Center(
                    child: Text(
                      "No Notices to display",
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 30.0,
                      ),
                    ),
                  )
                : Column(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Please tap on specific tab to know more",
                            style: TextStyle(fontSize: 20.0, color: Colors.red),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 15,
                        child: ListView.builder(
                          itemCount: enrolledNotices.length,
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
                                    enrolledNotices[i]["content"],
                                    style: TextStyle(
                                        color: Colors.red, fontSize: 20.0),
                                  ),
                                ),
                                subtitle: Center(
                                  child: Text(enrolledNotices[i]["dueDate"] !=
                                          null
                                      ? "Due: ${(enrolledNotices[i]["dueDate"] as Timestamp).toDate().day}/${(enrolledNotices[i]["dueDate"] as Timestamp).toDate().month}/${(enrolledNotices[i]["dueDate"] as Timestamp).toDate().year}  ${(enrolledNotices[i]["dueDate"] as Timestamp).toDate().hour}:${(enrolledNotices[i]["dueDate"] as Timestamp).toDate().minute}"
                                      : "Upload Time: ${(enrolledNotices[i]["uploadTime"] as Timestamp).toDate().day}/${(enrolledNotices[i]["uploadTime"] as Timestamp).toDate().month}/${(enrolledNotices[i]["uploadTime"] as Timestamp).toDate().year}  ${(enrolledNotices[i]["uploadTime"] as Timestamp).toDate().hour}:${(enrolledNotices[i]["uploadTime"] as Timestamp).toDate().minute}"),
                                ),
                                onTap: () async {
                                  if (enrolledNotices[i]["link"] != "") {
                                    await showDialog(
                                        context: context,
                                        builder: (context) => AlertDialog(
                                              backgroundColor: Colors.red[100],
                                              title: Text("Link to be found"),
                                              actions: [
                                                FlatButton(
                                                    onPressed: () {
                                                      Navigator.pop(context);
                                                      launch(enrolledNotices[i]
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
