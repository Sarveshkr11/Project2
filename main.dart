import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyTechApp());
}

String cmd;
String imagename;

web(cmd, imagename) async {
  var url = "http://192.168.43.99/cgi-bin/web.py?x=${cmd}&y=${imagename}";
  var response = await http.get(url);
  print(response.body);
}

class MyTechApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text("Integrate with Docker App"),
            ),
            body: Center(
              child: Container(
                height: 300,
                width: 200,
                //color: Colors.amber,
                child: Column(
                  children: <Widget>[
                    TextField(
                      onChanged: (value) {
                        cmd = value;
                      },
                      cursorColor: Colors.black,
                      autocorrect: false,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Enter OS Name...",
                        prefixIcon: Icon(Icons.tablet_android),
                      ),
                    ),
                    TextField(
                      onChanged: (value) {
                        imagename = value;
                      },
                      cursorColor: Colors.black,
                      autocorrect: false,
                      //textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Enter Img Name...",
                        prefixIcon: Icon(Icons.tablet_android),
                      ),
                    ),
                    FlatButton(
                      onPressed: () {
                        web(cmd, imagename);
                        //print(cmd);
                      },
                      child: Text("Click Here"),
                    )
                  ],
                ),
              ),
            )));
  }
}
