import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dummy01/Screens/home.dart';
import 'package:dummy01/Screens/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  String _name;
  int _rollnum;
  int _phonenum;
  String cnfrm;
  String _password;
  String _email;
  String _parentemail;
  bool isLoaded = true;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool validateAndSave() {
    final FormState form = formKey.currentState;
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
        backgroundColor: Colors.red,
        title: Text("Register Yourself"),
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
                      key: formKey,
                      child: Column(
                        //mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(
                            height: 0.03 * height,
                          ),
                          Text(
                            "Create Account",
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
                                    hintText: 'User Name',
                                    border: InputBorder.none,
                                  ),
                                  validator: (value) {
                                    return value.isEmpty
                                        ? 'User Name can\'t be empty'
                                        : null;
                                  },
                                  textCapitalization: TextCapitalization.words,
                                  onSaved: (String value) {
                                    setState(() {
                                      _name = value;
                                    });
                                  }),
                            ),
                          ),
                          SizedBox(
                            height: height * 0.015,
                          ),
                          Container(
                            width: 0.6 * width,
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: TextFormField(
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    hintText: 'Roll Number',
                                    border: InputBorder.none,
                                  ),
                                  validator: (value) {
                                    return value.isEmpty
                                        ? 'Roll Number can\'t be empty'
                                        : null;
                                  },
                                  onSaved: (String value) {
                                    setState(() {
                                      _rollnum = int.parse(value);
                                    });
                                  }),
                            ),
                          ),
                          SizedBox(
                            height: height * 0.015,
                          ),
                          Container(
                            width: 0.6 * MediaQuery.of(context).size.width,
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: TextFormField(
                                  keyboardType: TextInputType.emailAddress,
                                  decoration: InputDecoration(
                                    hintText: 'Email ID',
                                    border: InputBorder.none,
                                  ),
                                  validator: (value) {
                                    return value.isEmpty
                                        ? 'Email ID can\'t be empty'
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
                            height: height * 0.015,
                          ),
                          Container(
                            width: 0.6 * MediaQuery.of(context).size.width,
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: TextFormField(
                                  keyboardType: TextInputType.emailAddress,
                                  decoration: InputDecoration(
                                    hintText: "Parent's Email ID",
                                    border: InputBorder.none,
                                  ),
                                  validator: (value) {
                                    return value.isEmpty
                                        ? "Parent's Email ID can\'t be empty"
                                        : null;
                                  },
                                  onSaved: (String value) {
                                    setState(() {
                                      _parentemail = value;
                                    });
                                  }),
                            ),
                          ),
                          SizedBox(
                            height: height * 0.015,
                          ),
                          Container(
                            width: 0.6 * MediaQuery.of(context).size.width,
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: TextFormField(
                                  keyboardType: TextInputType.phone,
                                  decoration: InputDecoration(
                                    hintText: 'Mobile Number',
                                    border: InputBorder.none,
                                  ),
                                  validator: (value) {
                                    if (value.isEmpty ||
                                        int.parse(value) < 6000000000 ||
                                        int.parse(value) > 9999999999) {
                                      return 'Please enter valid Mobile Number';
                                    }
                                    return null;
                                  },
                                  onSaved: (String value) {
                                    setState(() {
                                      _phonenum = int.parse(value);
                                    });
                                  }),
                            ),
                          ),
                          SizedBox(
                            height: height * 0.015,
                          ),
                          Container(
                            width: 0.6 * MediaQuery.of(context).size.width,
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: TextFormField(
                                obscureText: true,
                                decoration: InputDecoration(
                                  hintText: 'Enter Password',
                                  border: InputBorder.none,
                                ),
                                validator: (value) {
                                  return value.isEmpty || value.length < 5
                                      ? 'Please Enter atleast 6 characters.'
                                      : null;
                                },
                                onChanged: (String value) {
                                  setState(() {
                                    _password = value;
                                  });
                                  validateAndSave();
                                },
                              ),
                            ),
                          ),
                          SizedBox(
                            height: height * 0.015,
                          ),
                          Container(
                            width: 0.6 * MediaQuery.of(context).size.width,
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: TextFormField(
                                obscureText: true,
                                decoration: InputDecoration(
                                  hintText: 'Confirm Password',
                                  border: InputBorder.none,
                                ),
                                validator: (value) {
                                  return cnfrm != _password
                                      ? 'This is not same as your password'
                                      : null;
                                },
                                onChanged: (String value) {
                                  cnfrm = value;
                                  validateAndSave();
                                },
                              ),
                            ),
                          ),
                          SizedBox(
                            height: height * 0.015,
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
                                          .createUserWithEmailAndPassword(
                                              email: _email,
                                              password: _password)
                                          .then((value) async {
                                        setState(() {
                                          isLoaded = true;
                                        });
                                        if (value != null) {
                                          await FirebaseFirestore.instance
                                              .collection("students")
                                              .doc(value.user.email)
                                              .set({
                                            "name": _name,
                                            "email": _email,
                                            "password": _password,
                                            "contact": _phonenum,
                                            "rollnum": _rollnum,
                                            "parentemail": _parentemail,
                                            "groups": [],
                                            "uploads": []
                                          }).whenComplete(() {
                                            Navigator.of(context)
                                                .pushAndRemoveUntil(
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            OurHomePage()),
                                                    ModalRoute.withName('/'));
                                          });
                                        }
                                      });
                                    } on FirebaseAuthException catch (e) {
                                      setState(() {
                                        isLoaded = true;
                                      });
                                      String errorDetails = "";
                                      switch (e.code) {
                                        case "weak-password":
                                          errorDetails =
                                              "The password provided is too weak.";
                                          break;
                                        case "email-already-in-use":
                                          errorDetails =
                                              "The account already exists for this email.";
                                          break;
                                        default:
                                          errorDetails =
                                              "Please try again with different credentials";
                                          break;
                                      }
                                      await showDialog(
                                          context: context,
                                          builder: (BuildContext context) =>
                                              AlertDialog(
                                                  title: Text(
                                                      "Cannot create account"),
                                                  content: Text(errorDetails),
                                                  actions: [
                                                    FlatButton(
                                                        child: Text("OK"),
                                                        onPressed: () {
                                                          Navigator.of(context)
                                                              .pop();
                                                        })
                                                  ]));
                                    } catch (e) {
                                      print("error");
                                      setState(() {
                                        isLoaded = true;
                                      });
                                      showDialog(
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
                                  "Create Account",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              )),
                          SizedBox(
                            height: height * 0.02,
                          ),
                          Text(
                            "Already have an account?",
                            style: TextStyle(fontSize: 20, color: Colors.grey),
                          ),
                          FlatButton(
                            child: Text(
                              'Login',
                              style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  fontSize: 25.0,
                                  color: Colors.red),
                            ),
                            onPressed: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => OurLoginPage()));
                            },
                          ),
                        ],
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
