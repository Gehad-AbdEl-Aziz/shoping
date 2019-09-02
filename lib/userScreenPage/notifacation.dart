import 'package:flutter/material.dart';
class NotifacationPage extends StatefulWidget {
  @override
  _NotifacationPageState createState() => _NotifacationPageState();
}

class _NotifacationPageState extends State<NotifacationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(' Notifacations'),),
      body: Center(
        child: Text('My Notifacations Page'),
      ),
    );
  }
}
