import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dummy01/Screens/ClassHomePage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OurClasses extends StatefulWidget {
  @override
  _OurClassesState createState() => _OurClassesState();
}

class _OurClassesState extends State<OurClasses> {
  bool isLoaded = false;
  List<dynamic> groups = [];

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
    for (int i = 0; i < enrolledClasses.length; i++) {
      classes.forEach((element) {
        if (element["teacherID"] == enrolledClasses[i]["teacherID"] &&
            element["groupName"] == enrolledClasses[i]["groupName"]) {
          //print(element);
          dummy.add(element);
        }
      });
    }
    setState(() {
      groups = dummy;
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
        title: Text("My Classes"),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      backgroundColor: Colors.red[100],
      body: Container(
          height: height,
          width: width,
          padding: EdgeInsets.all(10),
          child: isLoaded
              ? groups.isEmpty
                  ? Center(
                      child: Text(
                        "No Classes to display",
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 30.0,
                        ),
                      ),
                    )
                  : Column(
                      children: [
                        Expanded(
                          flex: 4,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Please tap on specific tab to know more\n\nYou can also exit class by pressing delete icon",
                              style:
                                  TextStyle(fontSize: 20.0, color: Colors.red),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 15,
                          child: ListView.builder(
                            itemCount: groups.length,
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
                                                    "Are You sure to exit Class"),
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
                                                                .doc(FirebaseAuth
                                                                    .instance
                                                                    .currentUser
                                                                    .email)
                                                                .get()
                                                                .then((value) =>
                                                                    value
                                                                        .data());
                                                        List<dynamic> Groups =
                                                            data["groups"];
                                                        String groupname =
                                                            groups[i]
                                                                ["groupName"];
                                                        var teacherid =
                                                            groups[i]
                                                                ["teacherID"];
                                                        Groups.removeAt(i);
                                                        await FirebaseFirestore
                                                            .instance
                                                            .collection(
                                                                "students")
                                                            .doc(FirebaseAuth
                                                                .instance
                                                                .currentUser
                                                                .email)
                                                            .update({
                                                          "groups": Groups,
                                                        });
                                                        List<dynamic> Classes =
                                                            await FirebaseFirestore
                                                                .instance
                                                                .collection(
                                                                    "items")
                                                                .doc("classes")
                                                                .get()
                                                                .then((value) =>
                                                                    value.data()[
                                                                        "classes"]);
                                                        int index;

                                                        for (int i = 0;
                                                            i < Classes.length;
                                                            i++) {
                                                          var element =
                                                              Classes[i];
                                                          if (element["groupName"] ==
                                                                  groupname &&
                                                              element["teacherID"] ==
                                                                  teacherid) {
                                                            List<dynamic>
                                                                Students =
                                                                element[
                                                                    "students"];
                                                            for (int j = 0;
                                                                j <
                                                                    Students
                                                                        .length;
                                                                j++) {
                                                              var e =
                                                                  Students[j];
                                                              if (e["email"] ==
                                                                  FirebaseAuth
                                                                      .instance
                                                                      .currentUser
                                                                      .email) {
                                                                index = j;
                                                                break;
                                                              }
                                                            }
                                                            Students.removeAt(
                                                                index);
                                                            Classes[i][
                                                                    "students"] =
                                                                Students;
                                                            break;
                                                          }
                                                        }

                                                        await FirebaseFirestore
                                                            .instance
                                                            .collection("items")
                                                            .doc("classes")
                                                            .update({
                                                          "classes": Classes
                                                        });
                                                        setState(() {
                                                          groups = Groups;
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
                                  title: Center(
                                      child: Text(
                                    groups[i]["groupName"],
                                    style: TextStyle(
                                        color: Colors.red, fontSize: 20.0),
                                  )),
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                OurClassHomePage(
                                                  classname: groups[i]
                                                      ["groupName"],
                                                  teachername: groups[i]
                                                      ["teacherName"],
                                                  number: (groups[i]
                                                          ["students"])
                                                      .length,
                                                  teacherID: groups[i]
                                                      ["teacherID"],
                                                )));
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
