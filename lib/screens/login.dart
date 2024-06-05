import 'package:ecommerce_flutter/screens/register.dart';
import 'package:ecommerce_flutter/widgets/change_screen.dart';
import 'package:ecommerce_flutter/widgets/my_button.dart';
import 'package:ecommerce_flutter/widgets/my_text_form_field.dart';
import 'package:ecommerce_flutter/widgets/password_text_form_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
final GlobalKey<ScaffoldMessengerState> _scaffoldKey =
    GlobalKey<ScaffoldMessengerState>();
String p =
    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";

RegExp regExp = new RegExp(p);
bool obserText = true;
late String email;
late String password;

class _LoginState extends State<Login> {
  void validation() async {
    final FormState _form = _formKey.currentState!;
    if (_form.validate()) {
      try {
        UserCredential result = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email, password: password);
      } on PlatformException catch (e) {
        _scaffoldKey.currentState!
            .showSnackBar(SnackBar(content: Text(e.message ?? '')));
      }
    } else {
      print("No");
    }
  }

  Widget _buildAllPart() {
    return Container(
      height: 300,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          const Text(
            "Login",
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          ),
          MyTextFormField(
            name: "Email",
            onChanged: (value) {
              setState(() {
                email = value!;
              });
            },
            validator: (String? value) {
              if (value == "") {
                return "Please fill email!";
              } else if (!regExp.hasMatch(value!)) {
                return "Email is invalid!";
              }
              return null;
            },
          ),
          PaswordTextFormField(
            name: "Password",
            obserText: obserText,
            onChanged: (value) {
              setState(() {
                password = value!;
              });
            },
            validator: (String? value) {
              if (value == "") {
                return "Please fill password!";
              } else if (value!.length < 8) {
                return "Password is too short!";
              }
              return null;
            },
            onTap: () {
              setState(() {
                obserText = !obserText;
              });
              FocusScope.of(context).unfocus();
            },
          ),
          MyButton(
              name: "Login",
              onPressed: () {
                validation();
              }),
          ChangeScreen(
            whichAccount: "I have not account!",
            onTap: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (ctx) => Register(),
                ),
              );
            },
            name: "Register",
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Form(
        key: _formKey,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[_buildAllPart()],
          ),
        ),
      ),
    );
  }
}
