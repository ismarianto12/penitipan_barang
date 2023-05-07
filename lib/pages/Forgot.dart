import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pembayaran/pages/Home.dart';

class Forgot extends StatefulWidget {
  const Forgot({Key key}) : super(key: key);

  @override
  State<Forgot> createState() => _ForgotState();
}

class _ForgotState extends State<Forgot> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 53, 128, 190),
        title: Text("Forget Password"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              Center(
                child: Image.network(
                  'https://static.vecteezy.com/system/resources/thumbnails/005/545/335/small/user-sign-icon-person-symbol-human-avatar-isolated-on-white-backogrund-vector.jpg',
                  height: 250.0,
                  width: 200.0,
                ),
              ),
              Center(
                child: Column(
                  children: [
                    Text(
                      'Bayar Sana',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        // fontStyle: FontStyle.italic,
                        fontFamily: 'algerian',
                        color: Colors.black,
                        // backgroundColor: Colors.white,
                      ),
                    ),
                    Text(
                      'Setoran Gak ada',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        // fontStyle: FontStyle.italic,
                        fontFamily: 'algerian',
                        color: Colors.black,
                        // backgroundColor: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              // SizedBox(height: 36),
              SizedBox(height: 20),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: TextFormField(
                            controller: _emailController,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(),
                              hintText: 'Email',
                            ),
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please enter your email';
                              }
                              return null;
                            },
                          ),
                        ),
                        SizedBox(height: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _isLoading
                                ? Expanded(
                                    child: Container(
                                      margin: EdgeInsets.all(30),
                                      child: MaterialButton(
                                        onPressed: () => {null},
                                        // minWidth: 100,
                                        color: Color.fromARGB(255, 44, 44,
                                            44), // Background color
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(100),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(12.0),
                                          child: Text(
                                            'Loading ....',
                                            style: TextStyle(
                                                fontSize: 18.0,
                                                color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                : Expanded(
                                    child: Container(
                                      margin: EdgeInsets.all(30),
                                      child: MaterialButton(
                                        // minWidth: 100,
                                        color: Color.fromARGB(255, 25, 34,
                                            204), // Background color
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(100),
                                        ),
                                        onPressed: () {
                                          if (_formKey.currentState
                                              .validate()) {
                                            _resetpass();
                                          }
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.all(12.0),
                                          child: Text(
                                            'Kirim Kode Verifikasi',
                                            style: TextStyle(
                                                fontSize: 18.0,
                                                color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                          ],
                        ),
                        SizedBox(height: 26),
                        SizedBox(height: 16),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void _resetpass() async {
    setState(() {
      _isLoading = true;
    });

    final response = await http.post(
      Uri.parse("https://api.instagram.com/oauth/access_token"),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'email': _emailController.text,
        'password': _passwordController.text,
      }),
    );

    setState(() {
      _isLoading = false;
    });

    if (response.statusCode == 200) {
      Fluttertoast.showToast(
        msg: 'Login successful',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
      );
    } else {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => MyHomePage()));

      Fluttertoast.showToast(
        msg: 'Login gagal server',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
      );
    }
  }
}
