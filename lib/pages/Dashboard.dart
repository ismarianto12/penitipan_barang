import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:pembayaran/pages/Cari.dart';
import 'package:pembayaran/pages/Pinjam.dart';
// import '../components/Dashboardcm.dart';
// import '../utils/emoticon_face.dart';
import '../utils/excercise_tile.dart';
import 'package:pembayaran/pages/Profile.dart';
// import 'package:pembayaran/models/menugrid.dart';
import 'package:pembayaran/components/MenuGrid.dart';
import 'package:pembayaran/components/ListMenu.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[700],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: InkWell(
              child: Icon(Icons.home),
              onTap: () => Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Profile())),
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_alarm_sharp),
            label: "Utils",
          ),
          BottomNavigationBarItem(
            icon: InkWell(
              child: Icon(Icons.document_scanner),
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => Pinjam(),
                ),
              ),
            ),
            label: "User",
          )
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text("Hy Rian",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold)),
                      Text("12 Jan, 2021",
                          style: TextStyle(color: Colors.white, fontSize: 12)),
                    ],
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.blue[500],
                        borderRadius: BorderRadius.circular(12)),
                    padding: EdgeInsets.all(12),
                    child: Icon(Icons.notifications, color: Colors.white),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.blue[600],
                    borderRadius: BorderRadius.circular(12)),
                padding: EdgeInsets.all(12),
                child: GestureDetector(
                  onTap: () {
                    showSearch(
                      context: context,
                      delegate: MySearchDelegate(),
                    );
                  },
                  child: Row(children: [
                    Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      'Cari ...',
                      style: TextStyle(color: Colors.white),
                    ),
                  ]),
                ),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("MENU APLIKASI :",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold)),
                  Icon(
                    Icons.more_horiz,
                    color: Colors.white,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: MenuGrid(
                menuItems: menuItems,
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                height: 500,
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadiusDirectional.horizontal(
                      start: Radius.circular(10), end: Radius.circular(10)),
                ),
                padding: EdgeInsets.all(10),
                // color: Colors.grey[100],
                child: Center(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            height: 5,
                          ),
                          Center(
                            child: Text(
                              "List Mutasi",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                          ),
                          Icon(Icons.more_horiz),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Expanded(
                        child: ListView(
                          children: [
                            ExerciseTile(
                              title: 'Penitipan Barang',
                              subtitle: 'Riwawat Penitipan',
                              color: Colors.red,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            ExerciseTile(
                              title: 'Riwawat Penitipan',
                              subtitle: 'Riwawat Penitipan',
                              color: Colors.orange,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            ExerciseTile(
                              title: 'Riwawat Penitipan',
                              subtitle: 'Riwawat Penitipan',
                              color: Colors.green[100],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            ExerciseTile(
                              title: 'Riwawat Penitipan',
                              subtitle: 'Riwawat Penitipan',
                              color: Colors.green[100],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
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
    List<String> suggestions = [
      'History Penitipan',
      'List Data Peniitpan',
      'Data Penitipan',
      'Tracking Data Penitipan',
    ];
    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        final suggestion = suggestions[index];
        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            // crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(Icons.api_outlined, size: 34.0),
              SizedBox(
                height: 20,
              ),
              Text(
                suggestion,
                style: TextStyle(fontSize: 17.0),
              ),
            ],
          ),
        );
      },
    );
  }
}
