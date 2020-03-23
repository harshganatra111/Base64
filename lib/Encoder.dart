import 'package:flutter/material.dart';
import 'dart:convert';

class Encoder extends StatelessWidget {

  TextEditingController inputText = new TextEditingController();
  String encodedText="";
    bool _enabled = false;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Encoder"),
        backgroundColor: Color.fromRGBO(0 , 0, 55, 1.0),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            ListTile(
              title: TextField(
                controller: inputText,
                decoration: InputDecoration(
                  labelText: 'Enter Text'
                ),
                onSubmitted: (String val){
                  print("val = "+val);
                },
              ),
            ),

            ListTile(
              title: TextFormField(
                enabled: false,
                
                decoration: InputDecoration(
                  labelText: 'Encoded Text',

                ),
              ),
            ),
            Padding(padding: EdgeInsets.all(10),),
            RaisedButton(
              onPressed: (){
                print(inputText.text);
                encode(inputText.text);
              },
              child: Text("Encode"),
            
            )
          ],
        ),
      ),
    );
  }
  void encode(String inp){
    String credentials = inp;
Codec<String, String> stringToBase64 = utf8.fuse(base64);
 encodedText = stringToBase64.encode(credentials);
print(encodedText);
  }
}