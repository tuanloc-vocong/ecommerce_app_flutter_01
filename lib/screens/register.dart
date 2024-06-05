import 'package:ecommerce_flutter/screens/login.dart';
import 'package:ecommerce_flutter/widgets/change_screen.dart';
import 'package:ecommerce_flutter/widgets/my_button.dart';
import 'package:ecommerce_flutter/widgets/my_text_form_field.dart';
import 'package:ecommerce_flutter/widgets/password_text_form_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
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

class _RegisterState extends State<Register> {
  void validation() async {
    final FormState _form = _formKey.currentState!;
    if (_form.validate()) {
      try {
        UserCredential result = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);
      } on PlatformException catch (e) {
        _scaffoldKey.currentState!
            .showSnackBar(SnackBar(content: Text(e.message ?? '')));
      }
    } else {}
  }

  Widget _buildAllTextFormField() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        MyTextFormField(
          name: "Username",
          onChanged: (value) {
            setState(() {});
          },
          validator: (String? value) {
            if (value == "") {
              return "Please fill username!";
            } else if (value!.length < 6) {
              return "Username is too short!";
            }
            return null;
          },
        ),
        const SizedBox(height: 20),
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
        const SizedBox(height: 20),
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
        SizedBox(height: 20),
        MyTextFormField(
          name: "Phone number",
          onChanged: (value) {
            setState(() {});
          },
          validator: (String? value) {
            if (value == "") {
              return "Please fill phone number!";
            } else if (value!.length < 10) {
              return "Phone number must be 11";
            }
            return null;
          },
        )
      ],
    );
  }

  Widget _buildBottomPart() {
    return Container(
      child: Column(
        children: <Widget>[
          _buildAllTextFormField(),
          const SizedBox(height: 20),
          MyButton(
              name: "Register",
              onPressed: () {
                validation();
              }),
          const SizedBox(height: 20),
          ChangeScreen(
            whichAccount: "I have already an account!",
            onTap: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (ctx) => Login(),
                ),
              );
            },
            name: "Login",
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: <Widget>[
                  Container(
                    height: 220,
                    width: double.infinity,
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Text(
                          "Register",
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  _buildBottomPart()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
