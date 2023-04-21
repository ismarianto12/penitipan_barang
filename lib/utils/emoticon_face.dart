import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class EmoticonFace extends StatelessWidget {
  final String emoticon;
  const EmoticonFace({
    Key key,
    this.emoticon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blue[600],
        borderRadius: BorderRadius.circular(12),
      ),
      padding: EdgeInsets.all(15),
      child: Center(child: Text(emoticon, style: TextStyle(fontSize: 28))),
    );
  }
}
