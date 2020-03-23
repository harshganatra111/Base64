import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart';

class Decoder extends StatefulWidget {
  @override
  _DecoderState createState() => _DecoderState();
}

class _DecoderState extends State<Decoder> {
  TextEditingController inputText = new TextEditingController();
    TextEditingController decTxt = new TextEditingController();
    String decodedText="";
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

                autofocus: true,
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
                controller: decTxt,
                decoration: InputDecoration(
                  labelText: 'Decoded Text',
                  
                ),

              ),
            ),
            Padding(padding: EdgeInsets.all(10),),
            RaisedButton(
              onPressed: (){
                print(inputText.text);
                String retEncTxt = encode(inputText.text);
                print(retEncTxt);
                 setState((){
                  decTxt.text = decodedText;
                });
              },
              child: Text("Decode"),

            ),
            RaisedButton(
              
              child: Text('Copy'),
              onPressed: (){
                                  Clipboard.setData(new ClipboardData(text: decodedText));

               
                },
            ),
          ],
        ),
      ),
    );
  }
  String encode(String inp){
    String credentials = inp;
Codec<String, String> stringToBase64 = utf8.fuse(base64);
 decodedText = stringToBase64.decode(credentials);
//print(encodedText);

  return decodedText;
  }
}