import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dummy01/Screens/comments.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class OurClassVideos extends StatefulWidget {
  final List<dynamic> list;
  final String name;
  final String teacherID;

  const OurClassVideos({this.list, this.name, this.teacherID});

  @override
  _OurClassVideosState createState() => _OurClassVideosState();
}

class _OurClassVideosState extends State<OurClassVideos> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Expanded(
              child: Text("Videos"),
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
                  child: Text("No Videos to display",
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
                              title: Text(
                                widget.list[i]["content"],
                                style: TextStyle(color: Colors.red),
                              ),
                              subtitle: Text(widget.list[i]["dueDate"] != null
                                  ? "Due: ${(widget.list[i]["dueDate"] as Timestamp).toDate().day}/${(widget.list[i]["dueDate"] as Timestamp).toDate().month}/${(widget.list[i]["dueDate"] as Timestamp).toDate().year}  ${(widget.list[i]["dueDate"] as Timestamp).toDate().hour}:${(widget.list[i]["dueDate"] as Timestamp).toDate().minute}"
                                  : "Upload Time: ${(widget.list[i]["uploadTime"] as Timestamp).toDate().day}/${(widget.list[i]["uploadTime"] as Timestamp).toDate().month}/${(widget.list[i]["uploadTime"] as Timestamp).toDate().year}  ${(widget.list[i]["uploadTime"] as Timestamp).toDate().hour}:${(widget.list[i]["uploadTime"] as Timestamp).toDate().minute}"),
                              trailing: IconButton(
                                icon: Icon(Icons.message_outlined,
                                    color: Colors.red),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Comments(
                                                groupName: widget.name,
                                                teacherID: widget.teacherID,
                                                assignmentName: widget.list[i]
                                                    ["content"],
                                                assignmentUrl: widget.list[i]
                                                    ["link"],
                                              )));
                                },
                              ),
                              onTap: () async {
                                if (widget.list[i]["link"] != "") {
                                  await showDialog(
                                      context: context,
                                      builder: (context) => AlertDialog(
                                            backgroundColor: Colors.red[100],
                                            title: Text("Link found"),
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
