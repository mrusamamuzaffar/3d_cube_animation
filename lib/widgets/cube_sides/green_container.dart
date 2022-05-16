import 'package:flutter/material.dart';

class GreenContainer extends StatelessWidget {
  const GreenContainer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      color: Colors.green,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('4',
            style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.normal
            ),
          ),
        ],
      ),
    );
  }
}
