import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class OurProfile extends StatefulWidget {
  @override
  _OurProfileState createState() => _OurProfileState();
}

class _OurProfileState extends State<OurProfile> {
  bool isLoaded = false;
  String _name;
  int _rollnum;
  String _email;
  int _phonenum;
  String _parentemail;
  int _count1;
  int _count2;
  Future<bool> fetch() async {
    String studentEmail = FirebaseAuth.instance.currentUser.email;
    final data = await FirebaseFirestore.instance
        .collection("students")
        .doc(FirebaseAuth.instance.currentUser.email)
        .get()
        .then((value) => value.data());
    _name = data["name"];
    _rollnum = data["rollnum"];
    _email = data["email"];
    _phonenum = data["contact"];
    _parentemail = data["parentemail"];
    _count1 = (data["groups"].length);
    _count2 = (data["uploads"].length);

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
        title: Text("My Profile"),
        centerTitle: true,
        backgroundColor: Colors.red,
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
                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Container(
                        padding: EdgeInsets.all(8.0),
                        width: width * 1,
                        decoration: BoxDecoration(
                            color: Colors.white38,
                            // border: Border.all(color: Colors.red, width: 2),
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        child: Column(
                          children: [
                            // SizedBox(
                            //   height: height * 0.01,
                            // ),
                            // Center(
                            //   child: Text(
                            //     " Details",
                            //     style: TextStyle(
                            //       fontSize: 30.0,
                            //       color: Colors.,
                            //     ),
                            //   ),
                            // ),
                            SizedBox(
                              height: height * 0.06,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Text(
                                    "Name :",
                                    style: TextStyle(
                                      fontSize: 25.0,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    _name,
                                    style: TextStyle(
                                      fontSize: 25.0,
                                      color: Colors.red,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: height * 0.02,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Text(
                                    "Roll Number :",
                                    style: TextStyle(
                                      fontSize: 25.0,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    _rollnum.toString(),
                                    style: TextStyle(
                                      fontSize: 25.0,
                                      color: Colors.red,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: height * 0.02,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Text(
                                    "Contact :",
                                    style: TextStyle(
                                      fontSize: 25.0,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    _phonenum.toString(),
                                    style: TextStyle(
                                      fontSize: 25.0,
                                      color: Colors.red,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: height * 0.02,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Text(
                                    "Email ID:",
                                    style: TextStyle(
                                      fontSize: 25.0,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    _email,
                                    style: TextStyle(
                                      fontSize: 25.0,
                                      color: Colors.red,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: height * 0.02,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Text(
                                    "Parent's Email :",
                                    style: TextStyle(
                                      fontSize: 25.0,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    _parentemail,
                                    style: TextStyle(
                                      fontSize: 25.0,
                                      color: Colors.red,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: height * 0.02,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Text(
                                    "Number of Classes Joined :",
                                    style: TextStyle(
                                      fontSize: 25.0,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    "     " + _count1.toString(),
                                    style: TextStyle(
                                      fontSize: 25.0,
                                      color: Colors.red,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: height * 0.02,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Text(
                                    "Number of Uploads :",
                                    style: TextStyle(
                                      fontSize: 25.0,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    "     " + _count2.toString(),
                                    style: TextStyle(
                                      fontSize: 25.0,
                                      color: Colors.red,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: height * 0.02,
                            ),
                          ],
                        ),
                      ),
                    )
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
                    ),
                  ]),
      ),
    );
  }
}
