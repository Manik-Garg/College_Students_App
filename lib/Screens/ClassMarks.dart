import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class OurClassMarks extends StatefulWidget {
  final List<dynamic> list;
  final name;

  const OurClassMarks({this.list, this.name});

  @override
  _OurClassMarksState createState() => _OurClassMarksState();
}

class _OurClassMarksState extends State<OurClassMarks> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Expanded(
              child: Text("Marks"),
            ),
            Expanded(
              child: Text("[ " + widget.name + " ]"),
            ),
          ],
        ),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      backgroundColor: Colors.red[100],
      body: Container(
          height: height,
          width: width,
          padding: EdgeInsets.all(10),
          child: widget.list.isEmpty
              ? Center(
                  child: Text("No Marks Sheets to display",
                      style: TextStyle(fontSize: 30.0, color: Colors.black54)),
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
                        itemCount: widget.list.length,
                        itemBuilder: (context, i) {
                          return Container(
                            margin: EdgeInsets.only(top: 10.0),
                            width: width * 0.8,
                            decoration: BoxDecoration(
                                color: Colors.white38,
                                border: Border.all(color: Colors.red, width: 2),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            //padding: EdgeInsets.all(10),
                            child: ListTile(
                              title: Center(
                                  child: Text(
                                widget.list[i]["content"],
                                style: TextStyle(color: Colors.red),
                              )),
                              subtitle: Center(
                                child: Text(widget.list[i]["dueDate"] != null
                                    ? "Due: ${(widget.list[i]["dueDate"] as Timestamp).toDate().day}/${(widget.list[i]["dueDate"] as Timestamp).toDate().month}/${(widget.list[i]["dueDate"] as Timestamp).toDate().year}  ${(widget.list[i]["dueDate"] as Timestamp).toDate().hour}:${(widget.list[i]["dueDate"] as Timestamp).toDate().minute}"
                                    : "Upload Time: ${(widget.list[i]["uploadTime"] as Timestamp).toDate().day}/${(widget.list[i]["uploadTime"] as Timestamp).toDate().month}/${(widget.list[i]["uploadTime"] as Timestamp).toDate().year}  ${(widget.list[i]["uploadTime"] as Timestamp).toDate().hour}:${(widget.list[i]["uploadTime"] as Timestamp).toDate().minute}"),
                              ),
                              onTap: () async {
                                if (widget.list[i]["link"] != "") {
                                  await showDialog(
                                      context: context,
                                      builder: (context) => AlertDialog(
                                            backgroundColor: Colors.red[100],
                                            title: Text("Link to be found"),
                                            actions: [
                                              FlatButton(
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                    launch(
                                                        widget.list[i]["link"]);
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
                                } else {
                                  await showDialog(
                                      context: context,
                                      builder: (context) => AlertDialog(
                                            backgroundColor: Colors.red[100],
                                            title: Text("No Link to be found"),
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
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                )),
    );
  }
}
