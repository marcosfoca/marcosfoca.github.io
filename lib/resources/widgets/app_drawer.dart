import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'dart:html' as html;

import '../projects_data.dart';

class AppDrawer extends StatelessWidget {
  Color color1, color2;
  AppDrawer({super.key, required this.color1, required this.color2});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: color1,
      child: Padding(
        padding: const EdgeInsets.all(40.0),
        child: ListView(
          shrinkWrap: true,
          children: [
            GestureDetector(
              onTap: () {
                context.go('/');
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(Icons.person_rounded, size: 35, color: color2),
                  SizedBox(width: 20),
                  FittedBox(child: Text("marcos fortis (me)", style: TextStyle(color: color2, fontFamily: 'BebasNeue', fontSize: 20),)),
                ],
              ),
            ),
            SizedBox(height: 15),
            ListView.builder(
              shrinkWrap: true,
              itemCount: appNames.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    context.go(appPageRoutes[index]);
                  },
                  child: Row(
                    children: [
                      SizedBox(
                        height: 35,
                        width: 35,
                        child: ClipOval(
                          child: Image.asset(appIconSource[index]),
                        ),
                      ),
                      SizedBox(width: 20),
                      Text(appNames[index], style: TextStyle(color: color2,  fontFamily: 'BebasNeue', fontSize: 20),),
                    ],
                  ),
                );
              }
            ),

          ],
        ),
      ),
    );
  }
}
