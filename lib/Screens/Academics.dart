import 'package:dummy01/Screens/Departments.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class OurAcademics extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Text("Academics"),
        ),
        backgroundColor: Colors.red[100],
        body: Container(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    padding: EdgeInsets.all(8.0),
                    height: height * 0.35,
                    width: width * 0.8,
                    decoration: BoxDecoration(
                        color: Colors.red[100],
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Text(
                      "J.C. Bose University of Science and Technology, YMCA, Faridabad has various Departments.\n\nOne Can Easily choose Any Course according to the department or field he/she want to study",
                      style: TextStyle(fontSize: 20.0, color: Colors.red),
                    ),
                  ),
                ),
                Container(
                  width: width * 0.8,
                  decoration: BoxDecoration(
                      color: Colors.white38,
                      border: Border.all(color: Colors.red, width: 2),
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  margin: EdgeInsets.only(bottom: 10),
                  child: ListTile(
                    title: Center(
                      child: Text(
                        "All Departments",
                        style: TextStyle(color: Colors.red, fontSize: 25.0),
                      ),
                    ),
                    subtitle: Center(
                      child: Text("Press for more Department-wise details"),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => OurDepartments()),
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: height * 0.05,
                ),
                Container(
                    width: width * 0.8,
                    decoration: BoxDecoration(
                        color: Colors.white38,
                        border: Border.all(color: Colors.red, width: 2),
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    margin: EdgeInsets.only(bottom: 10),
                    child: ListTile(
                      title: Center(
                        child: Text(
                          "For More Info Visit Official Site",
                          style: TextStyle(color: Colors.red, fontSize: 20.0),
                        ),
                      ),
                      subtitle: Center(
                        child: Text("tap here"),
                      ),
                      onTap: () {
                        launch('https://jcboseust.ac.in/');
                      },
                    )),
              ],
            ),
          ),
        ));
  }
}
