import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ExerciseTile extends StatelessWidget {
  final color;
  final String title;
  final String subtitle;

  const ExerciseTile({Key key, this.color, this.title, this.subtitle})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadiusDirectional.circular(16)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Container(
                  padding: EdgeInsets.all(16),
                  color: color,
                  child: Icon(
                    Icons.favorite,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('${this.title}'),
                  SizedBox(
                    height: 5,
                  ),
                  Text('${this.subtitle}'),
                ],
              ),
              SizedBox(
                width: 50,
              ),
              Icon(
                Icons.more_horiz,
                color: Colors.grey,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
