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

class Pinjam extends StatefulWidget {
  const Pinjam({Key key}) : super(key: key);

  @override
  State<Pinjam> createState() => _PinjamState();
}

class _PinjamState extends State<Pinjam> {
  @override
  Widget build(BuildContext context) {
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
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: InkWell(
              child: Icon(Icons.home),
              onTap: () => Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => Dashboard())),
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
