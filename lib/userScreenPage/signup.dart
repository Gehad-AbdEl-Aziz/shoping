import 'package:flutter/material.dart';
import 'package:project_srca/tools/app_tools.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController re_Password = TextEditingController();

  final scaffoldKey = new GlobalKey<ScaffoldState>();
  BuildContext context;
  @override
  Widget build(BuildContext context) {
    this.context = context;
    return Scaffold(
        key:  scaffoldKey,
        backgroundColor: Theme.of(context).primaryColor,
        appBar: AppBar(
          title: Text('Sign Up'),
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
                  textHint: 'Full Name',
                  textIcon: Icons.person_pin,
                  controller: name),
              SizedBox(
                height: 30.0,
              ),
              appTextFiled(
                  isPassword: false,
                  sidePadding: 18.0,
                  textHint: 'Phone Number',
                  textIcon: Icons.contact_phone,
                  textType: TextInputType.number,
                  controller: phone),
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
              SizedBox(
                height: 30,
              ),
              appTextFiled(
                  isPassword: true,
                  sidePadding: 18.0,
                  textHint: 'Re-Password',
                  textIcon: Icons.lock,
                  controller: re_Password),

              appButton(
                btnText: 'Create Account',
                onBtnclicked: verifyDetails,
                btnPadding: 20.0,
                btnColor: Theme.of(context).primaryColor,
              ),
            ],
          ),
        ));
  }

  verifyDetails(){
    if(name.text == ''){
      showSnackBar('Name cann\'t be empty', scaffoldKey);
      return;
    }
    if(phone.text == ''){
      showSnackBar('Phone cann\'t be empty', scaffoldKey);
      return;
    }
    if(email.text == ''){
      showSnackBar('Email cann\'t be empty', scaffoldKey);
      return;
    }
    if(password.text == ''){
      showSnackBar('Password cann\'t be empty', scaffoldKey);
      return;
    }
    if(password.text != re_Password.text ){
      showSnackBar('Password don\'t Match', scaffoldKey);
      return;
    }
    displayProgressDialog(context);
  }
}
