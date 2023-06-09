import 'package:flutter/material.dart';
import 'package:pembayaran/models/menugrid.dart';

class MenuGrid extends StatelessWidget {
  final List<MenuItem> menuItems;

  MenuGrid({this.menuItems});
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 4,
      padding: EdgeInsets.all(30),
      mainAxisSpacing: 10,
      crossAxisSpacing: 20,
      children: menuItems.map((item) {
        return InkWell(
          onTap: () {
            Navigator.pushNamed(context, item.route);
          },
          child: Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: item.colors,
              borderRadius: BorderRadiusDirectional.circular(16),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(item.icon, size: 25, color: Colors.white),
                SizedBox(height: 4),
                Text(
                  item.title,
                  style: TextStyle(color: Colors.white, fontSize: 12.0),
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}
