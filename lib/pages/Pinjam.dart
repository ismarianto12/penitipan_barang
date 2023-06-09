import 'package:flutter/material.dart';

import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:pembayaran/pages/Cari.dart';
import 'package:pembayaran/pages/Dashboard.dart';

import '../utils/emoticon_face.dart';
import '../utils/excercise_tile.dart';
import 'package:pembayaran/pages/Profile.dart';
import 'package:pembayaran/pages/PinjamAdd.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class Pinjam extends StatefulWidget {
  const Pinjam({Key key}) : super(key: key);

  @override
  State<Pinjam> createState() => _PinjamState();
}

class _PinjamState extends State<Pinjam> {
  @override
  Widget build(BuildContext context) {
    BorderRadiusGeometry radius = BorderRadius.only(
      topLeft: Radius.circular(24.0),
      topRight: Radius.circular(24.0),
    );

    return Scaffold(
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blue,
          child: Icon(Icons.add_chart_rounded),
          onPressed: () => {
                // MaterialPageRoute(builder: ()=>{

                // })
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => PinjamAdd(),
                  ),
                )
              }),
      backgroundColor: Colors.blue[700],
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      IconButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.red)),
                        onPressed: () {
                          Navigator.pushNamed(context, '/dashboard');
                        },
                        icon: Icon(Icons.arrow_back),
                        color: Colors.white,
                      ),
                      Text("BACK",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold)),
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
            SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Jenis peminjaman :",
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
              height: 25,
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(25),
                color: Colors.grey[100],
                child: Center(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "List Mutasi",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                          Icon(Icons.more_horiz),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SlidingUpPanel(
                minHeight: 100,
                panel: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    margin: EdgeInsets.all(10.0),
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
                ),
                collapsed: Container(
                  color: Color.fromARGB(255, 255, 255, 255),
                  child: ExerciseTile(
                    title: 'Penitipan Barang',
                    subtitle: 'Riwawat Penitipan',
                    color: Colors.red,
                  ),
                ),
                body: null),
          ],
        ),
      ),
    );
  }
}
