import 'package:flutter/material.dart';
import 'dart:html' as html;

import '../colors.dart';

class ContactDialogBox extends StatefulWidget {
  const ContactDialogBox({super.key});

  @override
  State<ContactDialogBox> createState() => _ContactDialogBoxState();
}

class _ContactDialogBoxState extends State<ContactDialogBox> {

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: defaultLightBlue,
      title: Center(
        child: Text(
          'Contact',
          style: TextStyle(
            color: defaultDarkBlue,
            fontFamily: 'BebasNeue',
            fontSize: 43
          ),
        ),
      ),
      contentPadding: EdgeInsets.all(24),
      content: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Wrap(
            spacing: 5,
            runSpacing: 10,
            children: [
              TextButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Color(0xff0077b5)),
                  foregroundColor: MaterialStateProperty.all<Color>(defaultLightBlue),
                ),
                onPressed: () {html.window.open('https://www.linkedin.com/in/marcos-fortis-6ab841284/', '_blank');},
                child: Text("LinkedIn Profile", style: TextStyle(fontFamily: 'BebasNeue', fontSize: 17),),
              ),
              TextButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.pinkAccent),
                  foregroundColor: MaterialStateProperty.all<Color>(defaultLightBlue),
                ),
                onPressed: () {html.window.open('https://www.instagram.com/marcos_fortis/', '_blank');},
                child: Text("Instagram Profile", style: TextStyle(fontFamily: 'BebasNeue', fontSize: 17),),
              ),
              TextButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.black87),
                  foregroundColor: MaterialStateProperty.all<Color>(defaultLightBlue),
                ),
                onPressed: () {html.window.open('https://github.com/marcosfoca/', '_blank');},
                child: Text("GitHub Profile", style: TextStyle(fontFamily: 'BebasNeue', fontSize: 17),),
              )
            ],
          ),
          SizedBox(height: 30),
          SelectableText("theneymarofsoftware@gmail.com", textAlign: TextAlign.center, style: TextStyle(fontFamily: 'LTHoop', color: defaultDarkBlue),),
          SizedBox(height: 15),
        ],
      ),
    );
  }
}