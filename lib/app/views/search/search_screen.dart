import 'package:flutter/material.dart';
import 'package:shellhack_project/app/providers/crypto_icons.dart';

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "My Portafolio",
            textAlign: TextAlign.start,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Container(
            margin: EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Color(0xFF131619),
            ),
            child: ListTile(
              leading: CircleAvatar(
                child: FutureBuilder(
                  future: CryptoIcon.getIcon(name: "QTUM"),
                  builder:
                      (BuildContext context, AsyncSnapshot<Widget> snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }

                    var data = snapshot.data;

                    return data!;
                  },
                ),
              ),
              title: Text("QTUM-EUR"),
              subtitle: Text(
                "\$8.19",
              ),
              trailing: Text(
                "Quantity: " + 150.toString(),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Color(0xFF131619),
            ),
            child: ListTile(
              leading: CircleAvatar(
                child: FutureBuilder(
                  future: CryptoIcon.getIcon(name: "LSK"),
                  builder:
                      (BuildContext context, AsyncSnapshot<Widget> snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }

                    var data = snapshot.data;

                    return data!;
                  },
                ),
              ),
              title: Text("LSK-USD"),
              subtitle: Text(
                "\$2.98",
              ),
              trailing: Text(
                "Quantity: " + 345.toString(),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Color(0xFF131619),
            ),
            child: ListTile(
              leading: CircleAvatar(
                child: FutureBuilder(
                  future: CryptoIcon.getIcon(name: "ETH"),
                  builder:
                      (BuildContext context, AsyncSnapshot<Widget> snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }

                    var data = snapshot.data;

                    return data!;
                  },
                ),
              ),
              title: Text("ETH-CAD"),
              subtitle: Text(
                "\$3830.42",
              ),
              trailing: Text(
                "Quantity: " + 3.toString(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
