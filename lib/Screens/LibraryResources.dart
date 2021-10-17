import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class OurLibraryResources extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Text("Library Resources"),
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
                    padding: const EdgeInsets.all(5.0),
                    child: Container(
                      padding: EdgeInsets.all(8.0),
                      height: height * 0.1,
                      width: width * 0.8,
                      decoration: BoxDecoration(
                          color: Colors.red[100],
                          // border: Border.all(color: Colors.red, width: 2),
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: Center(
                        child: Text(
                          "The Resources",
                          style: TextStyle(fontSize: 25.0, color: Colors.red),
                        ),
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
                          "E-Resources",
                          style: TextStyle(color: Colors.red, fontSize: 20.0),
                        ),
                      ),
                      subtitle: Center(
                        child: Text("Press for more details"),
                      ),
                      onTap: () {
                        launch('https://jcboseust.ac.in/e-resources');
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
                          "E-General Gateway",
                          style: TextStyle(color: Colors.red, fontSize: 20.0),
                        ),
                      ),
                      subtitle: Center(
                        child: Text("Press for more details"),
                      ),
                      onTap: () {
                        launch('https://jgateplus.com/search/login/');
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
                          " Magazines",
                          style: TextStyle(color: Colors.red, fontSize: 20.0),
                        ),
                      ),
                      subtitle: Center(
                        child: Text("Press for more details"),
                      ),
                      onTap: () {
                        launch('https://jcboseust.ac.in/magazines');
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
                          "Journals",
                          style: TextStyle(color: Colors.red, fontSize: 20.0),
                        ),
                      ),
                      subtitle: Center(
                        child: Text("Press for more details"),
                      ),
                      onTap: () {
                        launch('https://jcboseust.ac.in/journals');
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
                          "NewsPapers",
                          style: TextStyle(color: Colors.red, fontSize: 20.0),
                        ),
                      ),
                      subtitle: Center(
                        child: Text("Press for more details"),
                      ),
                      onTap: () {
                        launch('https://jcboseust.ac.in/newspapers');
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
