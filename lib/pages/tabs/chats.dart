import 'package:flutter/material.dart';
import 'package:my_flutter_app/utils/my_navigator.dart';

class Chat extends StatelessWidget {
  @override
  Widget build(BuildContext context) => new Scaffold(
      body: Container(
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            new Icon(
                Icons.chat,
                size: 150.0,
                color: Colors.black12
            ),
            new Text('Chat tab content')
          ],
        ),
      ) ,
    floatingActionButton: new FloatingActionButton(
        onPressed: ()=> MyNavigator.goToContactsPage(context) ,
        child: new Icon(Icons.add),
        ),
  );
}