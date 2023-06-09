import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:pembayaran/components/MainSlide.dart';
import 'package:pembayaran/pages/Cari.dart';
import 'package:pembayaran/pages/Pinjam.dart';
// import '../components/Dashboardcm.dart';
// import '../utils/emoticon_face.dart';
import '../utils/excercise_tile.dart';
import 'package:pembayaran/pages/Profile.dart';
// import 'package:pembayaran/models/menugrid.dart';
import 'package:pembayaran/components/MenuGrid.dart';
import 'package:pembayaran/components/ListMenu.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

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
                      SizedBox(
                        height: 10,
                      ),
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
                  const Text(
                    "MENU APLIKASI",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  Icon(
                    Icons.more_horiz,
                    color: Colors.white,
                  )
                ],
              ),
            ),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(height: 200, child: const MainSlide()),
            )),
            Expanded(
              child: MenuGrid(
                menuItems: menuItems,
              ),
            ),
            SlidingUpPanel(
              maxHeight: 210,
              panel: Center(
                child: ListView(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
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
              collapsed: Container(
                decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 255, 255, 255),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24.0),
                      topRight: Radius.circular(24.0),
                    )),
                child: Center(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ExerciseTile(
                          title: 'Penitipan Barang',
                          subtitle: 'Riwawat Penitipan',
                          color: Colors.red,
                        ),
                      ]),
                ),
              ),
              body: null,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(24.0),
                topRight: Radius.circular(24.0),
              ),
            ),
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
