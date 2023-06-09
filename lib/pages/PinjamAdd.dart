import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:pembayaran/components/ComboBox.dart';
import 'package:pembayaran/pages/Camera.dart';
import 'package:pembayaran/pages/Dashboard.dart';
import 'package:pembayaran/pages/Pinjam.dart';
import 'package:pembayaran/utils/data_penitipan.dart';
import 'package:pembayaran/utils/app.dart';

class MyController {
  final TextEditingController textEditingController;

  MyController(this.textEditingController);
}

class PinjamAdd extends StatefulWidget {
  const PinjamAdd({Key key}) : super(key: key);

  @override
  State<PinjamAdd> createState() => _PinjamAddState();
}

class _PinjamAddState extends State<PinjamAdd> {
  final _formKey = GlobalKey<FormState>();
  final _namabarangcontroller = TextEditingController();
  final _satuanbarangcontroller = TextEditingController();
  final _statuspenitipancontroller = TextEditingController();
  final _jumlahControllercontroller = TextEditingController();

  bool _isLoading = false;

  var _currencies = [
    "Food",
    "Transport",
    "Personal",
    "Shopping",
    "Medical",
    "Rent",
    "Movie",
    "Salary"
  ];

  var _currentSelectedValue = '';
  bool _isChecked = false;
  String selectedValue;

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
                  // Container(
                  //   decoration: BoxDecoration(
                  //       color: Colors.blue[500],
                  //       borderRadius: BorderRadius.circular(120)),
                  //   padding: EdgeInsets.all(12),
                  //   child: Icon(Icons.arrow_back, color: Colors.white),
                  // ),
                  // Container(
                  //   decoration: BoxDecoration(
                  //       color: Colors.blue[500],
                  //       borderRadius: BorderRadius.circular(120)),
                  //   padding: EdgeInsets.all(12),
                  //   child: Icon(Icons.list_alt_sharp, color: Colors.white),
                  // ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => Dashboard(),
                        ),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.blue[500],
                          borderRadius: BorderRadius.circular(120)),
                      child: IconButton(
                        splashColor: Colors.white,
                        highlightColor: Colors.white,
                        color: Colors.transparent,
                        onPressed: () {
                          Route route =
                              MaterialPageRoute(builder: (context) => Pinjam());
                          Navigator.push(context, route);
                        },
                        icon: Icon(Icons.arrow_back, color: Colors.white),
                      ),
                    ),
                  ),
                  Text("Form Penitipan Barang ",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold)),
                  PopupMenuButton(
                    onSelected: (newValue) {
                      setState(() {
                        selectedValue = newValue;
                      });
                    },
                    itemBuilder: (BuildContext context) => [
                      PopupMenuItem(
                        value: 'Option 1',
                        child: Text('Option 1'),
                      ),
                      PopupMenuItem(
                        value: 'Option 2',
                        child: Text('Option 2'),
                      ),
                      PopupMenuItem(
                        value: 'Option 3',
                        child: Text('Option 3'),
                      ),
                    ],
                    child: IconButton(
                      color: Colors.white,
                      icon: Icon(Icons.more_vert),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: Container(
                // padding: EdgeInsets.all(25),
                color: Colors.white,
                child: Center(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Expanded(
                        child: ListView(
                          children: [
                            Form(
                              key: _formKey,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: TextFormField(
                                      controller: _namabarangcontroller,
                                      keyboardType: TextInputType.emailAddress,
                                      decoration: InputDecoration(
                                        filled: true,
                                        fillColor: Colors.white,
                                        border: OutlineInputBorder(),
                                        hintText: 'Nama Barang',
                                      ),
                                      validator: (value) {
                                        if (value.isEmpty) {
                                          return 'Masukan nama barang';
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: ComboBox(
                                      items: satuan,
                                      placeholder: 'Satuan',
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Container(
                                    width: 1000,
                                    alignment: Alignment.center,
                                    color: Color.fromARGB(255, 45, 110, 231),
                                    child: Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Icon(
                                              Icons
                                                  .account_balance_wallet_sharp,
                                              color: Color.fromARGB(
                                                  255, 255, 255, 255)),
                                          SizedBox(height: 10),
                                          Text(
                                            'STATUS PENITIPAN',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18.0,
                                                color: Color.fromARGB(
                                                    255, 255, 255, 255)),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  CheckboxListTile(
                                    title: Text('Bagasi'),
                                    value: _isChecked,
                                    onChanged: (newValue) {
                                      setState(() {
                                        _isChecked = newValue;
                                      });
                                    },
                                    controlAffinity: ListTileControlAffinity
                                        .leading, //posisi label checkbox
                                  ),
                                  CheckboxListTile(
                                    title: Text('Kiloan'),
                                    value: _isChecked,
                                    onChanged: (newValue) {
                                      setState(() {
                                        _isChecked = newValue;
                                      });
                                    },
                                    controlAffinity: ListTileControlAffinity
                                        .leading, //posisi label checkbox
                                  ),
                                  SizedBox(height: 5),
                                  Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: TextFormField(
                                      keyboardType: TextInputType.number,
                                      controller: _jumlahControllercontroller,
                                      // obscureText: true,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        fillColor: Colors.brown,
                                        hintText: 'Jumlah Barang',
                                      ),
                                      validator: (value) {
                                        if (value.isEmpty) {
                                          return 'Masukan Jumlah Barang';
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: ComboBox(
                                      items: satuan,
                                      placeholder: 'Kategori',
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: ComboBox(
                                      items: jenisbarang,
                                      placeholder: 'Jenis Barang',
                                    ),
                                  ),
                                  Container(
                                    width: 1000,
                                    alignment: Alignment.center,
                                    color: Color.fromARGB(255, 45, 110, 231),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Icon(
                                              Icons
                                                  .account_balance_wallet_sharp,
                                              color: Color.fromARGB(
                                                  255, 255, 255, 255)),
                                          SizedBox(height: 10),
                                          Text(
                                            'Camera',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18.0,
                                                color: Color.fromARGB(
                                                    255, 255, 255, 255)),
                                          ),
                                          SizedBox(height: 50),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(height: 50),
                                      InkWell(
                                        onTap: () {
                                          Navigator.of(context).pushReplacement(
                                            MaterialPageRoute(
                                                builder: (_) => Camera()),
                                          );
                                        },
                                        child: Column(
                                          children: [
                                            Image.asset(
                                              'assets/images/icons/cam.png',
                                              height: 80.0,
                                              width: 120.0,
                                            ),
                                            Text('Foto'),
                                            SizedBox(height: 50),
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 50),
                                      InkWell(
                                        onTap: () {
                                          Navigator.of(context).pushReplacement(
                                            MaterialPageRoute(
                                                builder: (_) => Camera()),
                                          );
                                        },
                                        child: Column(
                                          children: [
                                            Image.asset(
                                              'assets/images/icons/cam.png',
                                              height: 80.0,
                                              width: 120.0,
                                            ),
                                            Text('File Foto'),
                                            SizedBox(height: 50),
                                          ],
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 60,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton.extended(
            heroTag: 'save',
            backgroundColor: Colors.green,
            foregroundColor: Colors.white,
            onPressed: () {
              if (_formKey.currentState.validate()) {
                _formKey.currentState.save();
                _simpanData(context);
              }
            },
            icon: Icon(Icons.save),
            label: Text(
              'Save Data',
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
          ),
          SizedBox(width: 15),
          FloatingActionButton.extended(
            heroTag: 'cancel data',
            backgroundColor: Color.fromARGB(255, 176, 38, 33),
            foregroundColor: Colors.white,
            onPressed: () {
              if (_formKey.currentState.validate()) {
                _formKey.currentState.save();
              }
            },
            icon: Icon(Icons.cancel),
            label: Text(
              'Cancel',
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _simpanData(context) async {
    setState(() {
      _isLoading = true;
    });
    _isLoading ? showAlertDialog(context) : '';
  }
}
