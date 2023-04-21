import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:pembayaran/pages/Dashboard.dart';

class Cari extends StatefulWidget {
  const Cari({Key key}) : super(key: key);

  @override
  State<Cari> createState() => _CariState();
}

class _CariState extends State<Cari> {
  @override
  Widget build(BuildContext context) => Scaffold(
        // backgroundColor: Colors.blue[700],
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: InkWell(
                child: Icon(Icons.home),
                onTap: () => Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => Dashboard())),
              ),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add_alarm_sharp),
              label: "Utils",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.mark_unread_chat_alt),
              label: "User",
            )
          ],
        ),
        appBar: AppBar(
          title: Text('Cari'),
          actions: <Widget>[
            IconButton(
                onPressed: () {
                  showSearch(
                    context: context,
                    delegate: MySearchDelegate(),
                  );
                },
                icon: Icon(Icons.search))
          ],
        ),
      );
}

class MySearchDelegate extends SearchDelegate {
  @override
  Widget buildResults(BuildContext context) {
    final String query = this.query;
    return Center(
      child: Text('You searched for: $query'),
    );
  }

  Widget buildLeading(BuildContext context) => IconButton(
        onPressed: () {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (_) => Dashboard()),
          );
        },
        icon: Icon(Icons.arrow_back),
      );

  @override
  List<Widget> buildActions(BuildContext context) => [
        IconButton(
          icon: Icon(Icons.search),
          onPressed: () {
            // if (query.isEmpty) {
            //   close(context, null);
            // } else {
            query = '';
            // }
          },
        ),
      ];

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> suggestions = ['Mangga', 'Mangga', 'Mangga'];
    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        final suggestion = suggestions[index];
        return ListTile(
          title: Text(suggestion),
          onTap: () {
            query = suggestion;
          },
        );
      },
    );
  }
}
