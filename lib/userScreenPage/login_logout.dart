import 'package:flutter/material.dart';
import 'package:project_srca/tools/app_tools.dart';
import 'package:project_srca/userScreenPage/signup.dart';

class Login_Logout extends StatefulWidget {
  @override
  _Login_LogoutState createState() => _Login_LogoutState();
}

class _Login_LogoutState extends State<Login_Logout> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  BuildContext context;
  @override
  Widget build(BuildContext context) {
    this.context = context;
    return Scaffold(
      key:  scaffoldKey,
        backgroundColor: Theme.of(context).primaryColor,
        appBar: AppBar(
          title: Text('Login'),
          elevation: 0.0,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 30.0,
              ),
              appTextFiled(
                  isPassword: false,
                  sidePadding: 18.0,
                  textHint: 'Email Address',
                  textIcon: Icons.email,
                  controller: email),
              SizedBox(
                height: 30,
              ),
              appTextFiled(
                  isPassword: true,
                  sidePadding: 18.0,
                  textHint: 'Password',
                  textIcon: Icons.lock,
                  controller: password),
              appButton(
                btnText: 'Login',
                onBtnclicked: verifyloggin,
                btnPadding: 20.0,
                btnColor: Theme.of(context).primaryColor,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Not Registered ? ',
                    style: TextStyle(color: Colors.white),
                  ),
                  InkWell(
                      onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUp()));
                      },
                      child: Text(
                        ' Sign Up',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold ,fontSize: 16),
                      ))
                ],
              )
            ],
          ),
        ));
  }

  verifyloggin(){
      if(email.text == ''){
        showSnackBar('Email cann\'t be empty', scaffoldKey);
        return;
      }
      if(password.text == ''){
        showSnackBar('Password cann\'t be empty', scaffoldKey);
        return;
      }
      displayProgressDialog(context);
  }
}
