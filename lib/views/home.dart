import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_provider/views/settings.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wax App'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context)
                  .push(CupertinoPageRoute(builder: (context) => Settings()));
            },
            icon: Icon(Icons.settings),
          )
        ],
      ),
    );
  }
}
