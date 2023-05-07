import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:pembayaran/pages/Register.dart';
import 'package:pembayaran/pages/Forgot.dart';
import 'package:pembayaran/pages/Dashboard.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 73, 141, 197),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10),
              Center(
                child: Image.asset(
                  'assets/images/logo/logo.png',
                  height: 150.0,
                  width: 200.0,
                ),
              ),

              Center(
                child: Text(
                  'APLIKASI PENITIPAN BARANG',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    // fontStyle: FontStyle.italic,
                    fontFamily: 'algerian',
                    color: Colors.white,
                    // backgroundColor: Colors.white,
                  ),
                ),
              ),
              // SizedBox(height: 36),
              SizedBox(height: 50),

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
                              prefixIcon: Icon(
                                Icons.email,
                                color: Colors.white,
                              ),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 255, 255, 255)),
                              ),
                              filled: true,
                              hintText: 'Username',
                              hintStyle: TextStyle(color: Colors.white),
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
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: TextFormField(
                            controller: _passwordController,
                            obscureText: true,
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.key,
                                color: Colors.white,
                              ),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              fillColor: Colors.brown,
                              hintText: 'Password',
                              hintStyle: TextStyle(color: Colors.white),
                              // border: OutlineInputBorder(
                              //   borderSide: BorderSide(color: Colors.white),
                              // ),
                            ),
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please enter your password';
                              }
                              return null;
                            },
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _isLoading
                                ? Expanded(
                                    child: Container(
                                      margin: EdgeInsets.all(30),
                                      child: MaterialButton(
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
                                        color: Colors.red, // Background color
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(100),
                                        ),
                                        onPressed: () {
                                          if (_formKey.currentState
                                              .validate()) {
                                            _login();
                                          }
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.all(12.0),
                                          child: Text(
                                            'Login',
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
                        InkWell(
                          onTap: () {
                            Route route = MaterialPageRoute(
                                builder: (context) => Forgot());
                            Navigator.push(context, route);
                          },
                          child: Text(
                            'Forget Passowrd ?',
                            style: TextStyle(fontSize: 14, color: Colors.white),
                          ),
                        ),
                        SizedBox(height: 16),
                        SizedBox(height: 50),
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

  void _login() async {
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
          MaterialPageRoute(builder: (context) => Dashboard()));

      Fluttertoast.showToast(
        msg: 'Login gagal server',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
      );
    }
  }
}

TextStyle myTextStyle = TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.bold,
  // fontStyle: FontStyle.italic,
  fontFamily: 'Roboto',
  color: Colors.black,
  backgroundColor: Colors.white,
);

class HomeButton extends StatelessWidget {
  const HomeButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 10, top: 10),
        child: Container(
          width: 200,
          height: 50,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              primary: Colors.blue,
              backgroundColor: Colors.blue,
              shape: BeveledRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            child: const Text(
              'Elevated Button',
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
