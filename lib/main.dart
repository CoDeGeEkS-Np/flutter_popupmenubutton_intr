import 'dart:html';

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}
enum Animals{Cat,Dog,Bird,Lizard,Fish}
class _MyAppState extends State<MyApp> {
  Animals _selected = Animals.Cat;
  String _value = " Make a Selection ";
  List<PopupMenuEntry<Animals>> _items = new List<PopupMenuEntry<Animals>>();
  
@override
  void initState() {
  
  for (Animals animals in Animals.values){
    _items.add(PopupMenuItem(
      child: Text(_getDisplay(animals),),
      value:animals
      ),
    );
  }
    // TODO: implement initState
    super.initState();
  }
void _onSelected (Animals animals){

setState(() {
  _selected = animals;
  _value = "You Selected ${_getDisplay(animals)}";
});
}
String _getDisplay(Animals animals){
int index =animals.toString().indexOf(".");
index++;
return animals.toString()..substring(index);
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Name Here"),
      ),
      body:Container(
        padding: EdgeInsets.all(32),
        child: Center(
          child: Row(
              children: [
Container(
  padding: EdgeInsets.all(5.0),
  child: Text(_value),
),
                PopupMenuButton<Animals>(
                    child: Icon(Icons.input),
                    initialValue: Animals.Cat,
                    onSelected: _onSelected,
                    itemBuilder: (BuildContext context){
                      return _items;
                    })

          ],
        ),
      ),

    )
    );
  }

}
