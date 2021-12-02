import 'package:flutter/material.dart';
import 'package:plant_app/constants.dart';

class OurResume extends StatefulWidget {
  @override
  _OurResume createState() => _OurResume();
}

class _OurResume extends State<OurResume> {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: kPrimaryColor,
        width: double.infinity,
        height: 200,
        padding: EdgeInsets.only(top: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 10),
              height: 70,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  // (Fiverr): Wrong asset call
                  image: AssetImage('assets/images/logo.png'),
                ),
              ),
            ),
            Text(
              'semi;',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            Text(
              'info@semiksa.sa',
              style: TextStyle(
                color: Colors.blueGrey,
                fontSize: 14,
              ),
            )
          ],
        ));
  }
}
