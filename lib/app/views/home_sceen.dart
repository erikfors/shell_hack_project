import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var _index = 0;

  final _tabs = [
    Center(
      child: Text(
        "Portafolio",
      ),
    ),
    Center(
      child: Text(
        "Alerts",
      ),
    ),
    Center(
      child: Text(
        "Account",
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF131619),
      appBar: AppBar(
        title: Text("OkCoinRoute"),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: _tabs[_index],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xFF1A1F24),
        unselectedItemColor: Colors.grey,
        iconSize: 32,
        type: BottomNavigationBarType.shifting,
        selectedItemColor: Theme.of(context).primaryColor,
        currentIndex: _index,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.work,
            ),
            label: "Portafolio",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.add_alert,
            ),
            label: "Alerts",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person_outline,
            ),
            label: "Account",
          ),
        ],
        onTap: (indx) {
          setState(() {
            _index = indx;
          });
        },
      ),
    );
  }
}
