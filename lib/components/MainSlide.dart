import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class MainSlide extends StatefulWidget {
  const MainSlide({Key key}) : super(key: key);

  @override
  State<MainSlide> createState() => _MainSlideState();
}

class _MainSlideState extends State<MainSlide> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Buildcard(index);
          },
          separatorBuilder: (context, index) {
            return const SizedBox(
              height: 10,
            );
          },
          itemCount: 10,
        ),
      ),
    );
  }

  Widget Buildcard(int index) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Card(
            child: Image.asset(
              'assets/images/logo/logo.png',
              height: 70.0,
              width: 160.0,
            ),
          ),
        ],
      );
}
