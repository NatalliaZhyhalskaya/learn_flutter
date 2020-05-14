//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';





// class MyWidget extends StatefulWidget {
//   @override
//   createState {} => new MyWidgetState();
//   }

//   class MyWidgetState extends State<MyWidget> {
//     @override
//     Widget build(BuildContext context) {
//       return new Text('my text');
//     }
//   }  
  
  
  
  
class NewsBoxFavorite extends StatefulWidget {
 final int _num;
 final bool _like;

 NewsBoxFavorite(this._num, this._like);


 @override
 NewsBoxFavoriteState createState () => NewsBoxFavoriteState(_num, _like);

}

class NewsBoxFavoriteState extends State<NewsBoxFavorite> {
  int num;
  bool like = false;

NewsBoxFavoriteState(this.num, this.like);

void pressButton() {
  setState(() {
    like = !like;

    if (like) num++;
     else num--;
  });
}

  @override
  Widget build(BuildContext context) {
    var column = new Column(children: <Widget>[
      new Text('В избранном\n$num', textAlign: TextAlign.center,),
      new IconButton(
        icon: new Icon(like ? Icons.star: Icons.star_border, size: 30.0, color: Colors.blue [500],), 
        onPressed: pressButton
        )
    ],
          
      );
        return column;
  }
}




class NewsBox extends StatelessWidget {
  final String _title;
  final String _subtitle;
  final String _text;
  String _imageurl;
  int _num;
  bool _like;

  NewsBox(this._title, this._subtitle,this._text, {String imageurl, int num = 0, bool like = false}) {
    _imageurl = imageurl;
    _num = num;
    _like = like;
  }

  @override
  Widget build(BuildContext context) {
    if (_imageurl != null && _imageurl != '') return Container(
      color: Colors.black12,
      height: 150.0,
      child: new Row(
        children: <Widget>[
          new Image.network( _imageurl, width: 100.0, height: 100.0, fit: BoxFit.cover,),
          new Expanded(
            child: new Container(padding: new EdgeInsets.all(10.0), child: 
             new Column(
              children: <Widget>[
               new Text(_title + _title, style: new TextStyle(fontSize: 20.0), overflow: TextOverflow.ellipsis,),
               new Text(_subtitle, style: new TextStyle(fontSize: 18.0)),
               new Expanded(child: 
               new Text(_text + _text, softWrap: true, textAlign: TextAlign.justify,)) 
              ],))),
             new NewsBoxFavorite(_num, _like)
        ],
      )
    );


    return Container(
      color: Colors.black12,
      height: 100.0,
      child: new Row(
        children: <Widget>[
          new Expanded(
            child: new Container(padding: new EdgeInsets.all(10.0), child: 
             new Column(
              children: <Widget>[
               new Text(_title + _title, style: new TextStyle(fontSize: 20.0), overflow: TextOverflow.ellipsis,),
               new Text(_subtitle, style: new TextStyle(fontSize: 18.0)),
               new Expanded(child: 
               new Text(_text + _text, softWrap: true, textAlign: TextAlign.justify,)) 
              ],))),
              new NewsBoxFavorite(_num, _like)
        ],
      )
    );






  }
}



void main () => runApp(
  new MaterialApp(
    debugShowCheckedModeBanner: false,
    home: new Scaffold(
      appBar: new AppBar(),
      body: new NewsBox('Новый урок по Flutter', 'Привет новый урок','''В уроке рассказывается о в каких случаях применять класс StatelessWidget и StatefullWidget. Приведены примеры их использования''',
      imageurl: 'https://flutter.su/favicon.png', like: true, num: 101,),
    ),
  )

);