import 'package:flutter/material.dart';
class ProgressDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black.withAlpha(200),
      child: Center(
        child: Container(
          padding: EdgeInsets.all(30.0),
          child: GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CircularProgressIndicator(),
                  new SizedBox(height: 15.0,),
                  Text('Please Wait ............... يامسهل يارب ', style: TextStyle(color: Colors.white, fontSize: 16.0, fontWeight: FontWeight.w700),)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
