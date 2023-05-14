import 'package:flutter/material.dart';
import 'package:pembayaran/components/ButtonNav.dart';
import 'package:pembayaran/pages/Home.dart';
import 'package:pembayaran/pages/Saldo.dart';

class MyRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/dashboard':
        return MaterialPageRoute(builder: (_) => ButtonNav());
      case '/home':
        return MaterialPageRoute(builder: (_) => MyHomePage());
      case '/feed':
        return MaterialPageRoute(builder: (_) => MyHomePage());
      case '/saldo':
        return MaterialPageRoute(builder: (_) => Saldo());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Column(
                    children: [
                      Image.asset(
                        'assets/images/logo/notfound.png',
                        height: 150.0,
                        width: 200.0,
                      ),
                      Center(
                        child: Text(
                          'Page Under Maintence, Page Route :  ${settings.name}',
                          style: TextStyle(fontSize: 20.0),
                        ),
                      ),
                      MaterialButton(
                        // minWidth: 100,
                        color: Colors.red, // Background color
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(_, "/dashboard");
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Text(
                            'Back To Home',
                            style:
                                TextStyle(fontSize: 18.0, color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ));
    }
  }
}
