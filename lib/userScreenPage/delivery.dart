import 'package:flutter/material.dart';
class DeliveryPage extends StatefulWidget {
  @override
  _DeliveryPageState createState() => _DeliveryPageState();
}

class _DeliveryPageState extends State<DeliveryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('My Delivery'),),
      body: Center(
        child: Text('My Delivery'),
      ),
    );
  }
}
