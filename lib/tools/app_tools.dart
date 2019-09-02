import 'package:flutter/material.dart';
import 'package:project_srca/tools/progressdialog.dart';

Widget appTextFiled(
    {IconData textIcon,
    String textHint,
    bool isPassword,
    double sidePadding,
      TextInputType textType,
    TextEditingController controller}) {

    sidePadding == null ? sidePadding= 0.0 : sidePadding;
    textHint == null ? textHint= "" : textHint;
    textType == null ? textType= TextInputType.text: textType;
  return Padding(
    padding:  EdgeInsets.only(left: sidePadding,right: sidePadding),
    child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
        ),
        child: TextField(
          controller: controller,
          obscureText: isPassword == null ? false : isPassword, keyboardType: textType,

          decoration: InputDecoration(
            // 3l4an a4el elzyadat fe el input
            border: InputBorder.none,
            hintText: textHint ,
            prefixIcon: textIcon == null ? new Container() : new Icon(textIcon),
          ),
        )),
  );
}

Widget appButton({String btnText, double btnPadding, Color btnColor , VoidCallback onBtnclicked}){
  btnText == null ? btnText == 'App Button' :btnText ;
  btnPadding == null ? btnPadding= 0.0 : btnPadding;
  btnColor == null ? btnColor = Colors.black : btnColor;
  return Padding(
    padding:  EdgeInsets.all(btnPadding),
    child: RaisedButton(
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15.0))),
      onPressed: (){
        onBtnclicked();
      },

    child: Container(
      height: 50,
      child: Center(
        child: Text(btnText, style: TextStyle(color: btnColor, fontSize: 10.0),),
      ),
    ),),
  );
}

showSnackBar(String message, final scaffoldKey) {
  scaffoldKey.currentState.showSnackBar(new SnackBar(
    backgroundColor: Colors.red[600],
    content: new Text(
      message,
      style: new TextStyle(color: Colors.white),
    ),
  ));
}
displayProgressDialog(BuildContext context) {
  Navigator.of(context).push(new PageRouteBuilder(
      opaque: false,
      pageBuilder: (BuildContext context, _, __) {
        return new ProgressDialog();
      }));
}

closeProgressDialog(BuildContext context) {
  Navigator.of(context).pop();
}