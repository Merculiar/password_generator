import 'package:flutter/material.dart';

import '../widgets/option_widget.dart';

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Password generator'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(20),
            child: Container(
              height: 70,
              width: 250,
              color: Theme.of(context).backgroundColor,
              child: Text('pass'),
            ),
          ),
          Column(
            children: [
              OptionWidget('contains Uppercase'),
              OptionWidget('contains lowercase'),
              OptionWidget('contains numbers'),
              OptionWidget('contains symbols'),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: ElevatedButton(
              child: Text('generate'),
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  primary: Colors.red,
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                  textStyle:
                      TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ),
          ),
        ],
      ),
    );
  }
}
