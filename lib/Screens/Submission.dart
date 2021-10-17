import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class OurSubmission extends StatefulWidget {
  final String groupName;
  final String teacherID;
  final String assignmentUrl;
  final String assignmentName;

  const OurSubmission(
      {this.groupName,
      this.teacherID,
      this.assignmentUrl,
      this.assignmentName});

  @override
  _OurSubmissionState createState() => _OurSubmissionState();
}

class _OurSubmissionState extends State<OurSubmission> {
  bool isLoaded = false;
  List<dynamic> assignments = [];
  List<dynamic> allassignments = [];
  Map<String, dynamic> submitted = {
    "contentName": "",
    "link": "",
  };
  bool alreadySubmitted = false;
  List<dynamic> uploads = [];
  List<dynamic> classy = [];
  int index;
  int assindex;
  var selectedassignment;

  Future<bool> fetch() async {
    String teacherEmail = FirebaseAuth.instance.currentUser.email;
    final data = await FirebaseFirestore.instance
        .collection("items")
        .doc("classes")
        .get()
        .then((value) => value.data());
    List<dynamic> classes = data["classes"];
    List<dynamic> a = [];

    for (int i = 0; i < classes.length; i++) {
      var element = classes[i];
      if (element["teacherID"] == widget.teacherID &&
          element["groupName"] == widget.groupName) {
        List<dynamic> all = element["uploads"];
        setState(() {
          index = i;
        });

        for (int j = 0; j < all.length; j++) {
          var e = all[j];
          if (e["type"] == "Assignment" &&
              e["content"] == widget.assignmentName) {
            a = e["submissions"];
            setState(() {
              selectedassignment = e;
              allassignments = all;
              assindex = j;
            });
          }
        }
      }
    }
    a.forEach((element) {
      if (element["StudentID"] == FirebaseAuth.instance.currentUser.email) {
        setState(() {
          alreadySubmitted = true;
          submitted = element;
        });
      }
    });
    setState(() {
      assignments = a;
      classy = classes;
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
        title: Text("Your Submission"),
        backgroundColor: Colors.red,
        centerTitle: true,
      ),
      backgroundColor: Colors.red[100],
      body: Container(
          height: height,
          width: width,
          padding: EdgeInsets.all(10),
          child: isLoaded
              ? alreadySubmitted
                  ? Column(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                          SizedBox(
                            height: height * 0.02,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    "Topic  :  ",
                                    style: TextStyle(
                                        fontSize: 20.0, color: Colors.black),
                                  ),
                                ),
                                Expanded(
                                    child: Text(
                                  widget.assignmentName,
                                  style: TextStyle(
                                      fontSize: 20.0, color: Colors.red),
                                ))
                              ],
                            ),
                          ),
                          SizedBox(
                            height: height * 0.02,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    "Status  :  ",
                                    style: TextStyle(
                                        fontSize: 20.0, color: Colors.black),
                                  ),
                                ),
                                Expanded(
                                    child: Text(
                                  "Already Submitted",
                                  style: TextStyle(
                                      fontSize: 20.0, color: Colors.red),
                                ))
                              ],
                            ),
                          ),
                          SizedBox(
                            height: height * 0.1,
                          ),
                          Container(
                            width: width * 0.8,
                            decoration: BoxDecoration(
                                color: Colors.white38,
                                border: Border.all(color: Colors.red, width: 2),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            margin: EdgeInsets.only(top: 8),
                            child: ListTile(
                              title:
                                  Center(child: Text(submitted["contentName"])),
                              subtitle: Center(
                                child: Text(
                                    "Uploaded: ${(submitted["uploadTime"] as Timestamp).toDate().day}/${(submitted["uploadTime"] as Timestamp).toDate().month}/${(submitted["uploadTime"] as Timestamp).toDate().year}  ${(submitted["uploadTime"] as Timestamp).toDate().hour}:${(submitted["uploadTime"] as Timestamp).toDate().minute}"),
                              ),
                              onTap: () async {
                                if (submitted["link"] != "") {
                                  await canLaunch(submitted["link"])
                                      ? await launch(submitted["link"])
                                      : print('Could not launch');
                                }
                              },
                            ),
                          ),
                          SizedBox(
                            height: height * 0.35,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    "Tap on Submitted document tab, to download Your Solution",
                                    style: TextStyle(
                                        fontSize: 20.0, color: Colors.black),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ])
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: height * 0.01,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  "Topic  :  ",
                                  style: TextStyle(
                                      fontSize: 20.0, color: Colors.black),
                                ),
                              ),
                              Expanded(
                                  child: Text(
                                widget.assignmentName,
                                style: TextStyle(
                                    fontSize: 20.0, color: Colors.red),
                              ))
                            ],
                          ),
                        ),
                        SizedBox(
                          height: height * 0.01,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  "Status  :  ",
                                  style: TextStyle(
                                      fontSize: 20.0, color: Colors.black),
                                ),
                              ),
                              Expanded(
                                  child: Text(
                                "Submission not done yet",
                                style: TextStyle(
                                    fontSize: 20.0, color: Colors.red),
                              ))
                            ],
                          ),
                        ),
                        SizedBox(
                          height: height * 0.01,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: RaisedButton(
                            color: Colors.red,
                            child: Text(
                              "Submit",
                              style: TextStyle(color: Colors.white),
                            ),
                            onPressed: () async {
                              await showDialog(
                                  context: context,
                                  builder: (context) => Dialog(
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(20.0))),
                                        child: Container(
                                          height: height * 0.4,
                                          width: width * 0.8,
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
                                              Container(
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
                                                      submitted["contentName"] =
                                                          value;
                                                    });
                                                  },
                                                  keyboardType: TextInputType
                                                      .emailAddress,
                                                  decoration: InputDecoration(
                                                    hintText: 'Enter Topic',
                                                    border: InputBorder.none,
                                                  ),
                                                ),
                                                width: width * 0.75,
                                              ),
                                              SizedBox(
                                                height: 15,
                                              ),
                                              Container(
                                                width: width * 0.75,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(20)),
                                                  color: Colors.red,
                                                ),
                                                padding: EdgeInsets.all(5),
                                                child: FlatButton(
                                                  child: Text(
                                                    "Add File & upload",
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 20.0,
                                                    ),
                                                  ),
                                                  onPressed: () async {
                                                    if (submitted[
                                                                "contentName"] ==
                                                            "" ||
                                                        submitted[
                                                                "contentName"] ==
                                                            null) {
                                                      await showDialog(
                                                          context: context,
                                                          builder:
                                                              (context) =>
                                                                  AlertDialog(
                                                                    title: Text(
                                                                        "Please Enter Topic"),
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
                                                      Navigator.pop(context);
                                                      setState(() {
                                                        isLoaded = false;
                                                      });
                                                      FilePickerResult result =
                                                          await FilePicker
                                                              .platform
                                                              .pickFiles();

                                                      if (result != null) {
                                                        setState(() {
                                                          isLoaded = false;
                                                        });
                                                        File file = File(result
                                                            .files.single.path);
                                                        String filename = DateTime
                                                                .now()
                                                            .microsecondsSinceEpoch
                                                            .toString();
                                                        var downloadUrl =
                                                            await FirebaseStorage
                                                                .instance
                                                                .ref()
                                                                .child(
                                                                    "${FirebaseAuth.instance.currentUser.email}/${widget.assignmentName}/$filename")
                                                                .putFile(file);
                                                        String url =
                                                            await downloadUrl
                                                                .ref
                                                                .getDownloadURL();
                                                        setState(() {
                                                          submitted["link"] =
                                                              url;
                                                        });

                                                        var data =
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
                                                                    value
                                                                        .data());

                                                        var time =
                                                            Timestamp.fromDate(
                                                                DateTime.now());
                                                        assignments.insert(0, {
                                                          "contentName":
                                                              submitted[
                                                                  "contentName"],
                                                          "uploadTime": time,
                                                          "link":
                                                              submitted["link"],
                                                          "StudentID":
                                                              FirebaseAuth
                                                                  .instance
                                                                  .currentUser
                                                                  .email,
                                                          "rollnum":
                                                              data["rollnum"],
                                                        });
                                                        allassignments[assindex]
                                                                [
                                                                "submissions"] =
                                                            assignments;
                                                        classy[index]
                                                                ["uploads"] =
                                                            allassignments;
                                                        await FirebaseFirestore
                                                            .instance
                                                            .collection("items")
                                                            .doc("classes")
                                                            .update({
                                                          "classes": classy
                                                        }).whenComplete(() {
                                                          setState(() {
                                                            isLoaded = true;
                                                            alreadySubmitted =
                                                                true;
                                                            submitted[
                                                                    "uploadTime"] =
                                                                time;
                                                          });
                                                        });
                                                      }
                                                    }
                                                  },
                                                ),
                                              ),
                                              SizedBox(
                                                height: 15,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ));
                            },
                          ),
                        ),
                        SizedBox(
                          height: height * 0.01,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  "Tap on Submit button, to submit Your Solution in form of document\n\nPlease Provide Valid Name and Document",
                                  style: TextStyle(
                                      fontSize: 20.0, color: Colors.black),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
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
                      ),
                    ])),
    );
  }
}
