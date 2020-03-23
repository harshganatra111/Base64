import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:toast/toast.dart';
import 'package:flutter/services.dart';

class Encoder extends StatefulWidget {
  @override
  _EncoderState createState() => _EncoderState();
}

class _EncoderState extends State<Encoder> {

  TextEditingController inputText = new TextEditingController();
    TextEditingController encTxt = new TextEditingController();
    String encodedText="";
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
                controller: encTxt,
                decoration: InputDecoration(
                  labelText: 'Encoded Text',
                  
                ),

              ),
            ),
            Padding(padding: EdgeInsets.all(10),),
            RaisedButton(
              onPressed: (){
                
                String retEncTxt = encode(inputText.text);
                Toast.show("Text Encoded", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);
              
                encTxt.clear();
                 setState((){
                  encTxt.text = encodedText;
                });
              },
              child: Text("Encode"),
            ),
            RaisedButton(
              child: Text('Copy'),
              onPressed: (){
                if(encodedText.isEmpty){
                                 Toast.show("Field is empty", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);

                }
                else{
                  Clipboard.setData(new ClipboardData(text: encodedText));
               Toast.show("Encoded text copied", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);
                
                }
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
 encodedText = stringToBase64.encode(credentials);
//print(encodedText);

  return encodedText;
  }
  }
