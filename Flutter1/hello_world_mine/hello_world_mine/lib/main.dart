//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MyBody extends StatelessWidget {
  Widget build(BuildContext context) {
    return new Center(
           child: new Column(
             children: [
               new Text('Hello World'), 
               new Text('Have a good day!'), 
               new FlatButton(onPressed: () async {
                 const url = 'https://flutter.su';
                  if (await canLaunch(url)) {
              await launch(url);
            } else {
              throw 'Could not launch $url';
            }
               }, 
                  child: new Text('Open site'),
                  color: Colors.red,
                  textColor: Colors.white,

                  )],
               )
         );
  }
}

void main() {
  runApp (
    new MaterialApp(
     debugShowCheckedModeBanner: false,
     home: new Scaffold(
       appBar: new AppBar(
         title: new Text('Flutter.su')),
        body: new MyBody()
     )
  ));
}