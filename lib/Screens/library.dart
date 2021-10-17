import 'package:dummy01/Screens/AboutLibrary.dart';
import 'package:dummy01/Screens/EBooks.dart';
import 'package:dummy01/Screens/LibraryResources.dart';
import 'package:flutter/material.dart';

class OurLibrary extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Text("College Library"),
        ),
        backgroundColor: Colors.red[100],
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Container(
                      padding: EdgeInsets.all(8.0),
                      height: height * 0.7,
                      width: width * 0.8,
                      decoration: BoxDecoration(
                          color: Colors.red[100],
                          // border: Border.all(color: Colors.red, width: 2),
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: Text(
                        "JCBUST Library is a modern library meant to fulfil the information needs of students, Research Scholars, faculty and staff of various Departments of the University. It is fully air conditioned and situated on ground floor having area of more than 7200 sq. ft. The library is centrally located within easy reach from all the Departments, hostels and residential areas.  ft. It has two Reading Halls with a total capacity of 155 seats. In the Periodical Section all the journals, newspapers and magazines are displayed alphabetically.",
                        style: TextStyle(fontSize: 20.0, color: Colors.red),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.02,
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
                          "About Library",
                          style: TextStyle(color: Colors.red, fontSize: 20.0),
                        ),
                      ),
                      subtitle: Center(
                        child: Text("Press for more details"),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => OurAboutLibrary()),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: height * 0.02,
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
                          " The Library Resources",
                          style: TextStyle(color: Colors.red, fontSize: 20.0),
                        ),
                      ),
                      subtitle: Center(
                        child: Text("Press for more details"),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => OurLibraryResources()),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: height * 0.02,
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
                          "E- Books",
                          style: TextStyle(color: Colors.red, fontSize: 20.0),
                        ),
                      ),
                      subtitle: Center(
                        child: Text("Press for more details"),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => OurEBooks()),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
