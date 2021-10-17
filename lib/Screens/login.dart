import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'home.dart';

class OurLoginPage extends StatefulWidget {
  @override
  _OurLoginPageState createState() => _OurLoginPageState();
}

class _OurLoginPageState extends State<OurLoginPage> {
  String _password;
  String _email;
  bool isLoaded = true;
  final GlobalKey<FormState> formKey1 = GlobalKey<FormState>();

  bool validateAndSave() {
    final FormState form = formKey1.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text("Log In"),
        backgroundColor: Colors.red,
      ),
      backgroundColor: Colors.red[100],
      body: Container(
        height: height,
        width: width,
        child: isLoaded
            ? SingleChildScrollView(
                child: Column(
                  children: [
                    Form(
                      key: formKey1,
                      child: Column(
                        //mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(
                            height: 0.03 * height,
                          ),
                          Text(
                            "Enter Details to Log In",
                            style: TextStyle(
                                color: Colors.red,
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 0.02 * height,
                          ),
                          Container(
                            width: 0.6 * width,
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: TextFormField(
                                  keyboardType: TextInputType.emailAddress,
                                  decoration: InputDecoration(
                                    hintText: 'Email Address',
                                    border: InputBorder.none,
                                  ),
                                  validator: (value) {
                                    return value.isEmpty
                                        ? 'Email Address can\'t be empty'
                                        : null;
                                  },
                                  onSaved: (String value) {
                                    setState(() {
                                      _email = value;
                                    });
                                  }),
                            ),
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          Container(
                            width: 0.6 * width,
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: TextFormField(
                                  keyboardType: TextInputType.emailAddress,
                                  decoration: InputDecoration(
                                    hintText: 'Enter Password',
                                    border: InputBorder.none,
                                  ),
                                  validator: (value) {
                                    return value.isEmpty
                                        ? 'Enter Password can\'t be empty'
                                        : null;
                                  },
                                  onSaved: (String value) {
                                    setState(() {
                                      _password = value;
                                    });
                                  }),
                            ),
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          Container(
                              width: 0.8 * MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  color: Colors.red),
                              child: FlatButton(
                                onPressed: () async {
                                  if (validateAndSave()) {
                                    setState(() {
                                      isLoaded = false;
                                    });
                                    try {
                                      final user = await FirebaseAuth.instance
                                          .signInWithEmailAndPassword(
                                              email: _email,
                                              password: _password)
                                          .then((value) async {
                                        setState(() {
                                          isLoaded = true;
                                        });
                                        if (value != null) {
                                          Navigator.of(context)
                                              .pushAndRemoveUntil(
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          OurHomePage()),
                                                  ModalRoute.withName('/'));
                                        }
                                      });
                                    } catch (e) {
                                      print("error");
                                      setState(() {
                                        isLoaded = true;
                                      });
                                      await showDialog(
                                          context: context,
                                          builder: (BuildContext context) =>
                                              AlertDialog(
                                                  title: Text("Error occurred"),
                                                  content: Text(e.toString()),
                                                  actions: [
                                                    FlatButton(
                                                        child: Text("OK"),
                                                        onPressed: () {
                                                          Navigator.of(context)
                                                              .pop();
                                                        })
                                                  ]));
                                    }
                                  }
                                },
                                child: Text(
                                  "Log In",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              )),
                          SizedBox(
                            height: height * 0.01,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                                text: 'Forgot Your Password ',
                                style:
                                    TextStyle(fontSize: 20, color: Colors.red)),
                            TextSpan(
                                text: 'click here',
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.blue,
                                    decoration: TextDecoration.underline),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () async {
                                    await showDialog(
                                        context: context,
                                        builder: (context) => AlertDialog(
                                              backgroundColor: Colors.red[100],
                                              title: Text(
                                                  "E-Mail Requesting for Your Password At Mail Id:'helperapp002@gmail.com', and wait for 2-3 working days"),
                                              actions: [
                                                FlatButton(
                                                    onPressed: () {
                                                      Navigator.pop(context);
                                                    },
                                                    child: Text(
                                                      "OK",
                                                      style: TextStyle(
                                                        color: Colors.red,
                                                        fontSize: 20.0,
                                                      ),
                                                    ))
                                              ],
                                            ));
                                  })
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
            : Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
