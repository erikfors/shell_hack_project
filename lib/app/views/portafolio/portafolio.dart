import 'package:flutter/material.dart';

class PortafolioView extends StatelessWidget {
  final dummy = ["Bitcoin", "DodgeCoin", "Etherethum"];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Color(0xFF131619),
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "My Portafolio",
            textAlign: TextAlign.start,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 3,
              itemBuilder: (ctx, index) => ListTile(
                leading: CircleAvatar(
                  child: Icon(
                    Icons.hourglass_empty,
                  ),
                ),
                title: Text(dummy[index]),
                subtitle: Text(
                  "\$42,000.78",
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
