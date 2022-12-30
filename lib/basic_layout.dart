// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class BasicLayout extends StatelessWidget {
  const BasicLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Basic Layout"),
        actions: [
          IconButton(
            icon: Icon(Icons.assignment),
            onPressed: () {},
            tooltip: "Assignment 4",
          ),
        ],
      ),
      body: BusinessCard(),
    );
  }
}

class BusinessCard extends StatefulWidget {
  const BusinessCard({super.key});

  @override
  State<BusinessCard> createState() => _BusinessCardState();
}

class _BusinessCardState extends State<BusinessCard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            child: CircleAvatar(
              backgroundImage: AssetImage("assets/images/myFace.jpg"),
            ),
            color: Colors.amber,
            padding: EdgeInsets.all(20.0),
            margin: EdgeInsets.all(20.0),
            alignment: Alignment.center,
            width: 300,
            height: 100,
          )
        ],
      ),
    );
  }
}
