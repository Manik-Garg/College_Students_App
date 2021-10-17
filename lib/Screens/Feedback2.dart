import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class OurFeedback2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Text("Feedback Analysis Report"),
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
                          "Year : 2016-2017",
                          style: TextStyle(color: Colors.red, fontSize: 20.0),
                        ),
                      ),
                      subtitle: Center(
                        child: Text("Press to open official site web-page"),
                      ),
                      onTap: () {
                        launch("https://jcboseust.ac.in/FAR-2016-2017");
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
                          "Year : 2017-2018",
                          style: TextStyle(color: Colors.red, fontSize: 20.0),
                        ),
                      ),
                      subtitle: Center(
                        child: Text("Press to open official site web-page"),
                      ),
                      onTap: () {
                        launch("https://jcboseust.ac.in/FAR-2017-2018");
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
                          "Year : 2018-2019",
                          style: TextStyle(color: Colors.red, fontSize: 20.0),
                        ),
                      ),
                      subtitle: Center(
                        child: Text(" Press to open official site web-page"),
                      ),
                      onTap: () {
                        launch("https://jcboseust.ac.in/FAR-2018-2019");
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
                          "Year : 2019-2020",
                          style: TextStyle(color: Colors.red, fontSize: 20.0),
                        ),
                      ),
                      subtitle: Center(
                        child: Text(" Press to open official site web-page"),
                      ),
                      onTap: () {
                        launch("https://jcboseust.ac.in/FAR-2019-2020");
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
