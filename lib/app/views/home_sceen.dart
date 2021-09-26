import 'package:flutter/material.dart';
import 'package:shellhack_project/app/views/search/search_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var _index = 0;

  final _tabs = [
    SearchScreen(),
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
      backgroundColor: Color(0xFF1A1F24),
      appBar: AppBar(
        title: Text("OkCoinRoute"),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: _tabs[_index],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xFF131619),
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
            backgroundColor: Color(0xFF131619),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.add_alert,
            ),
            backgroundColor: Color(0xFF131619),
            label: "Alerts",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person_outline,
            ),
            backgroundColor: Color(0xFF131619),
            label: "Account",
          ),
        ],
        onTap: (indx) {
          setState(() {
            _index = indx;
          });
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.search,
          color: Colors.white,
        ),
        onPressed: () {
          Navigator.of(context).pushNamed("/search");
        },
      ),
    );
  }
}
