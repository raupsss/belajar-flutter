// ignore_for_file: prefer_const_constructors, avoid_print, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:test_app/shop_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: MyHomePage(title: 'Fatha Ghani Al Rauf'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.settings),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text(
                "Pemuda Gokil",
                style: TextStyle(color: Colors.white),
              ),
              accountEmail: Text(
                "pemudagokil@gmail.com",
                style: TextStyle(color: Colors.white),
              ),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage("assets/images/myPict.jpg"),
              ),
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/myPict.jpg"),
                    fit: BoxFit.fill),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("Home"),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.account_box),
              title: Text("About"),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.grid_3x3_outlined),
              title: Text("Products"),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.contact_mail),
              title: Text("Contact"),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.assignment),
              title: Text("Assigment 3"),
              onTap: () {
                Route route = MaterialPageRoute(builder: (context) => ShopList());
                Navigator.push(context, route);
              },
            ),
            ListTile(
              leading: Icon(Icons.assignment),
              title: Text("Assigment 4"),
              onTap: () {},
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Welcome',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
      floatingActionButton: SpeedDial(
        animatedIcon: AnimatedIcons.menu_close,
        animatedIconTheme: IconThemeData(size: 28.0),
        backgroundColor: Colors.orange[0],
        visible: true,
        curve: Curves.bounceInOut,
        tooltip: "My Assignment",
        children: [
          SpeedDialChild(
            child: Icon(Icons.chrome_reader_mode, color: Colors.white),
            backgroundColor: Colors.orange,
            onTap: () => print('Pressed Read Later'),
            label: 'Read',
            labelStyle:
                TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
            labelBackgroundColor: Colors.black,
          ),
          SpeedDialChild(
            child: Icon(Icons.create, color: Colors.white),
            backgroundColor: Colors.orange,
            onTap: () => print('Pressed Write'),
            label: 'Write',
            labelStyle:
                TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
            labelBackgroundColor: Colors.black,
          ),
          SpeedDialChild(
            child: Icon(Icons.assignment, color: Colors.white),
            backgroundColor: Colors.orange,
            onTap: () {
              Route route = MaterialPageRoute(builder: (context) => ShopList());
              Navigator.push(context, route);
            },
            label: 'Assignment 3',
            labelStyle:
                TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
            labelBackgroundColor: Colors.black,
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
            tooltip: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment),
            label: "Assignment 3",
            tooltip: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment),
            label: "Assignment 4",
            tooltip: "",
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        onTap: (value) {
          if (value == 1) {
            Route route = MaterialPageRoute(builder: (context) => ShopList());
            Navigator.push(context, route);
          }
        },
      ),
    );
  }
}
