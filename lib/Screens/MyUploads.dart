import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MyUploads extends StatefulWidget {
  const MyUploads();

  @override
  _MyUploadsState createState() => _MyUploadsState();
}

class _MyUploadsState extends State<MyUploads> {
  bool isLoaded = false;
  String Topic;

  String uploadedUrl;

  String name;
  int rollnum;
  String email;
  int phonenum;
  List<dynamic> myuploads = [];

  Future<bool> fetch() async {
    String studentEmail = FirebaseAuth.instance.currentUser.email;
    final data = await FirebaseFirestore.instance
        .collection("students")
        .doc(FirebaseAuth.instance.currentUser.email)
        .get()
        .then((value) => value.data());

    setState(() {
      name = data["name"];
      myuploads = data["uploads"];
      email = data["email"];
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
      backgroundColor: Colors.red[100],
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(
          "My Uploads",
          overflow: TextOverflow.ellipsis,
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () async {
              await showDialog(
                  context: context,
                  builder: (context) => Dialog(
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0))),
                        child: Container(
                          height: height * 0.4,
                          width: width * 0.8,
                          decoration: BoxDecoration(
                              color: Colors.red[100],
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                  border:
                                      Border.all(color: Colors.red, width: 2),
                                  color: Colors.white38,
                                ),
                                padding: EdgeInsets.all(10),
                                child: TextField(
                                  onChanged: (value) {
                                    setState(() {
                                      Topic = value;
                                    });
                                  },
                                  keyboardType: TextInputType.emailAddress,
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
                                      BorderRadius.all(Radius.circular(20)),
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
                                    if (Topic == "" || Topic == null) {
                                      await showDialog(
                                          context: context,
                                          builder: (context) => AlertDialog(
                                                backgroundColor:
                                                    Colors.red[100],
                                                title:
                                                    Text("Please Enter Topic"),
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
                                    } else {
                                      Navigator.pop(context);
                                      setState(() {
                                        isLoaded = false;
                                      });
                                      FilePickerResult result =
                                          await FilePicker.platform.pickFiles();

                                      if (result != null) {
                                        setState(() {
                                          isLoaded = false;
                                        });
                                        File file =
                                            File(result.files.single.path);
                                        String filename = DateTime.now()
                                            .microsecondsSinceEpoch
                                            .toString();
                                        var downloadUrl = await FirebaseStorage
                                            .instance
                                            .ref()
                                            .child("${email}/${name}/$filename")
                                            .putFile(file);
                                        String url = await downloadUrl.ref
                                            .getDownloadURL();
                                        setState(() {
                                          uploadedUrl = url;
                                        });

                                        myuploads.insert(0, {
                                          "content": Topic,
                                          "time": Timestamp.fromDate(
                                              DateTime.now()),
                                          "link": uploadedUrl,
                                        });
                                        await FirebaseFirestore.instance
                                            .collection("students")
                                            .doc(email)
                                            .update({
                                          "uploads": myuploads
                                        }).whenComplete(() {
                                          setState(() {
                                            isLoaded = true;
                                            Topic = null;
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
                              Container(
                                width: width * 0.75,
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                  color: Colors.red,
                                ),
                                padding: EdgeInsets.all(5),
                                child: FlatButton(
                                    child: Text(
                                      "Upload Only A Note",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20.0,
                                      ),
                                    ),
                                    onPressed: () async {
                                      if (Topic == null || Topic == "") {
                                        await showDialog(
                                            context: context,
                                            builder: (context) => AlertDialog(
                                                  backgroundColor:
                                                      Colors.red[100],
                                                  title: Text(
                                                      "Please Enter Some Content"),
                                                  actions: [
                                                    FlatButton(
                                                        onPressed: () {
                                                          Navigator.pop(
                                                              context);
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
                                      } else {
                                        Navigator.pop(context);
                                        setState(() {
                                          isLoaded = false;
                                        });

                                        myuploads.insert(0, {
                                          "content": Topic,
                                          "time": Timestamp.fromDate(
                                              DateTime.now()),
                                          "link": "",
                                        });
                                        await FirebaseFirestore.instance
                                            .collection("students")
                                            .doc(email)
                                            .update({
                                          "uploads": myuploads
                                        }).whenComplete(() {
                                          setState(() {
                                            isLoaded = true;
                                            Topic = null;
                                          });
                                        });
                                      }
                                    }),
                              )
                            ],
                          ),
                        ),
                      ));
            },
          )
        ],
        centerTitle: true,
      ),
      body: Container(
        height: height,
        width: width,
        padding: EdgeInsets.all(10),
        child: isLoaded
            ? myuploads.isEmpty
                ? Center(
                    child: Text(
                      "Nothing uploaded yet.",
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
                          itemCount: myuploads.length,
                          itemBuilder: (context, i) {
                            return Container(
                                width: width * 0.8,
                                decoration: BoxDecoration(
                                    color: Colors.white38,
                                    border:
                                        Border.all(color: Colors.red, width: 2),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20))),
                                margin: EdgeInsets.only(bottom: 10),
                                child: ListTile(
                                  trailing: IconButton(
                                    color: Colors.red,
                                    icon: Icon(Icons.delete),
                                    onPressed: () async {
                                      await showDialog(
                                          context: context,
                                          builder: (context) => AlertDialog(
                                                backgroundColor:
                                                    Colors.red[100],
                                                title: Text(
                                                    "Are You sure to DELETE"),
                                                actions: [
                                                  FlatButton(
                                                      onPressed: () {
                                                        Navigator.pop(context);
                                                        setState(() {
                                                          isLoaded = true;
                                                        });
                                                      },
                                                      child: Text(
                                                        "No",
                                                        style: TextStyle(
                                                          color: Colors.red,
                                                          fontSize: 20.0,
                                                        ),
                                                      )),
                                                  FlatButton(
                                                      onPressed: () async {
                                                        setState(() {
                                                          isLoaded = false;
                                                        });
                                                        Navigator.pop(context);
                                                        var data =
                                                            await FirebaseFirestore
                                                                .instance
                                                                .collection(
                                                                    "students")
                                                                .doc(email)
                                                                .get()
                                                                .then((value) =>
                                                                    value
                                                                        .data());
                                                        List<dynamic> Uploads =
                                                            data["uploads"];
                                                        Uploads.removeAt(i);
                                                        await FirebaseFirestore
                                                            .instance
                                                            .collection(
                                                                "students")
                                                            .doc(email)
                                                            .update({
                                                          "uploads": Uploads,
                                                        });
                                                        setState(() {
                                                          myuploads = Uploads;
                                                          isLoaded = true;
                                                        });
                                                      },
                                                      child: Text(
                                                        "Yes",
                                                        style: TextStyle(
                                                          color: Colors.red,
                                                          fontSize: 20.0,
                                                        ),
                                                      )),
                                                ],
                                              ));
                                    },
                                  ),
                                  title: Text(
                                    myuploads[i]["content"],
                                    style: TextStyle(
                                        color: Colors.red, fontSize: 20.0),
                                  ),
                                  subtitle: Text(
                                      "${(myuploads[i]["time"] as Timestamp).toDate().day}/${(myuploads[i]["time"] as Timestamp).toDate().month}/${(myuploads[i]["time"] as Timestamp).toDate().year}  ${(myuploads[i]["time"] as Timestamp).toDate().hour}:${(myuploads[i]["time"] as Timestamp).toDate().minute}"),
                                  onTap: () async {
                                    if (myuploads[i]["link"] != "") {
                                      await showDialog(
                                          context: context,
                                          builder: (context) => AlertDialog(
                                                backgroundColor:
                                                    Colors.red[100],
                                                title: Text("Link to be found"),
                                                actions: [
                                                  FlatButton(
                                                      onPressed: () {
                                                        Navigator.pop(context);
                                                        launch(myuploads[i]
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
                                      //launch(myuploads[i]["link"]);
                                    } else {
                                      await showDialog(
                                          context: context,
                                          builder: (context) => AlertDialog(
                                                backgroundColor:
                                                    Colors.red[100],
                                                title: Column(
                                                  children: [
                                                    Text("No Link to be found"),
                                                  ],
                                                ),
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
                                ));
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
