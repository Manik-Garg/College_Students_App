import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class OurPhotoGallery extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("Photo Gallery"),
      ),
      backgroundColor: Colors.red[100],
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: height * 0.05,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: Center(
                    child: Image(
                      image: AssetImage("images/pg1.jpg"),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.05,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: Center(
                    child: Image(
                      image: AssetImage("images/pg2.jpg"),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.05,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: Center(
                    child: Image(
                      image: AssetImage("images/pg3.jpg"),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.05,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: Center(
                    child: Image(
                      image: AssetImage("images/pg5.jpg"),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.05,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: Center(
                    child: Image(
                      image: AssetImage("images/pg4.jpg"),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.05,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: Center(
                    child: Image(
                      image: AssetImage("images/pg6.jpg"),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.1,
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
                      "College Photo Gallery",
                      style: TextStyle(color: Colors.red, fontSize: 20.0),
                    ),
                  ),
                  subtitle: Center(
                    child: Text("Press to open Photo Gallery on official-site"),
                  ),
                  onTap: () {
                    launch(
                        "https://jcboseust.ac.in/content/newsyearphotogallery");
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
    );
  }
}
