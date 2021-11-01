import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dummy01/Screens/editOpportunity.dart';
import 'package:flutter/material.dart';

class TnP extends StatefulWidget {
  @override
  _TnPState createState() => _TnPState();
}

class _TnPState extends State<TnP> {
  bool isLoaded = false;
  List<dynamic> items = [];
  String uploadedUrl = "";
  bool fromTPO = false;

  Future<bool> fetch() async {
    final data1 = await FirebaseFirestore.instance
        .collection("items")
        .doc("TPO")
        .get()
        .then((value) => value.data());
    setState(() {
      items = data1["items"] as List<dynamic>;
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
        title: Text("T&P Section"),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      backgroundColor: Colors.red[100],
      body: Container(
        height: height,
        width: width,
        padding: EdgeInsets.all(10),
        child: isLoaded
            ? items.isEmpty
                ? Center(
                    child: Text("Nothing uploaded yet."),
                  )
                : ListView.builder(
                    itemCount: items.length,
                    itemBuilder: (context, i) {
                      return Container(
                          width: width * 0.8,
                          decoration: BoxDecoration(
                              border:
                                  Border.all(color: Colors.grey[500], width: 2),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          margin: EdgeInsets.only(top: 8),
                          child: ListTile(
                            title: Text(items[i]["companyName"]),
                            trailing: IconButton(
                              onPressed: () async {
                                Navigator.of(context)
                                    .push(MaterialPageRoute(
                                        builder: (context) => EditOpportunity(
                                              eligibility: items[i]
                                                  ["eligibility"],
                                              links: items[i]["links"],
                                              description: items[i]
                                                  ["description"],
                                              roles: items[i]["roles"],
                                              finalDate: (items[i]["deadline"]
                                                      as Timestamp)
                                                  .toDate(),
                                              ctc: items[i]["ctc"],
                                              cname: items[i]["companyName"],
                                              locations: items[i]["location"],
                                              index: i,
                                              openings: items,
                                              fromTPO: fromTPO,
                                            )))
                                    .whenComplete(() async {
                                  setState(() {
                                    isLoaded = false;
                                  });
                                  await fetch().whenComplete(() {
                                    setState(() {
                                      isLoaded = true;
                                    });
                                  });
                                });
                              },
                              icon: Icon(
                                fromTPO
                                    ? Icons.edit
                                    : Icons.remove_red_eye_outlined,
                                color: Colors.deepPurpleAccent,
                              ),
                            ),
                            subtitle: Text(
                                "Deadline: ${(items[i]["deadline"] as Timestamp).toDate().day}/${(items[i]["deadline"] as Timestamp).toDate().month}/${(items[i]["deadline"] as Timestamp).toDate().year}  ${(items[i]["deadline"] as Timestamp).toDate().hour}:${(items[i]["deadline"] as Timestamp).toDate().minute}"),
                          ));
                    },
                  )
            : Center(
                child: CircularProgressIndicator(),
              ),
      ),
    );
  }
}
