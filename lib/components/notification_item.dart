import 'package:flutter/material.dart';

class NotificationItem extends StatelessWidget {
  final String title;
  final String date;
  final String time;
  const NotificationItem({Key? key, required this.title, required this.date, required this.time}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(13),),
      margin: const EdgeInsets.only(bottom: 15),
      color: const Color.fromRGBO(255, 255, 255, 0.1),
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(15),
        child: Column(
          children: <Widget>[
            Text(title, style: const TextStyle(fontFamily: 'OpenSans', color: Color(0xFFFFFFFF), fontSize: 14.0), textAlign: TextAlign.center,),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 2,
              margin: const EdgeInsets.only(top: 5, bottom: 5),
              color: const Color.fromRGBO(255, 255, 255, 0.1),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(time, style: const TextStyle(fontFamily: 'OpenSans', color: Color(0xFFFFFFFF), fontSize: 13.0),),
                Text(date, style: const TextStyle(fontFamily: 'OpenSans', color: Color(0xFFFFFFFF), fontSize: 13.0),),
              ],
            ),
          ],
        ),
      ),
    );
  }
}