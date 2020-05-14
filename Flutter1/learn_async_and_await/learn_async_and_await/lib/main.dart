import 'package:flutter/material.dart';

void main() => runApp(
  new MaterialApp(
    home: Scaffold(body: MyApp(),)
  )
  );

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MyAppState();
}

class MyAppState extends State {
  StandGlass clock = StandGlass();

  @override
  void initState() {
    super.initState();

    clock.tick();
  }

  _reCravWidget() async {
    if (clock.time() == 0) return;
    await new Future.delayed(Duration(seconds: 1));
    setState(() {
      print('_reCravWidget()');
    });

  }

    @override
    Widget build(BuildContext context) {
      _reCravWidget();

      return Center(child: Text('time in: ${clock.time()}'));
    }
  }

  class StandGlass {
    int _sand = 0;

    time () {
      return _sand;
    }
    tick () async {
      _sand = 100;
      print('Start tick!');
      while (_sand > 0) {
        print('tick: _sand');
        _sand--;

      await new Future.delayed(Duration(milliseconds: 100));
      }
      print ('End tick');
    }


  }