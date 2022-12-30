// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

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
      body: Container(
        color: Color.fromARGB(255, 240, 238, 238),
        width: 330,
        height: 150,
        margin: EdgeInsets.all(20.0),
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    backgroundImage: AssetImage("assets/images/myFace.jpg"),
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Mr. Noerwachid",
                      style: Theme.of(context).textTheme.headline5,
                    ),
                    Text("Professional Player of Mobile Legends"),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Jl. Curug"),
                Text("(415) 555-0198"),
              ],
            ),
            SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Icon(Icons.accessibility),
                Icon(Icons.gamepad),
                Icon(Icons.monetization_on_outlined),
                Icon(Icons.phone_iphone),
              ],
            )
          ],
        ),
      ),
    );
  }
}
