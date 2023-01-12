import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:update_stock_app/auth/form_login.dart';
import 'package:update_stock_app/controllers/auth_controller.dart';
import 'package:update_stock_app/pages/index_pages.dart';
import 'package:update_stock_app/style/constants.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  bool _isLoading = false;
  final _formKey = GlobalKey<FormState>();
  var username, password;
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  bool _secureText = true;

  showHide() {
    setState(() {
      _secureText = !_secureText;
    });
  }

  // _showMsg(msg) {
  //   final snackBar = SnackBar(content: Text(msg));
  //   _scaffoldKey.currentState!.showSnackBar(snackBar);
  // }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double defaultLoginSize = size.height - (size.height * 0.2);
    return Scaffold(
      key: _scaffoldKey,
      body: Stack(
        children: [
          Positioned(
            top: 100,
            right: -50,
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: kPrimaryColor,
              ),
            ),
          ),
          Positioned(
            top: -50,
            left: -50,
            child: Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: kPrimaryColor,
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: SingleChildScrollView(
              // ignore: sized_box_for_whitespace
              child: Container(
                width: size.width,
                height: defaultLoginSize,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Welcome back",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                    const SizedBox(height: 40),
                    Image.network(
                      "https://lh3.googleusercontent.com/d/1BB-FX1SOgpmn_qqU9gyoFi0iGqayzk6b?authuser=0",
                      scale: 2.5,
                    ),
                    const SizedBox(height: 40),
                    FormLogin(
                      formKey: _formKey,
                      validatorUsername: (usernameValue) {
                        if (usernameValue!.isEmpty) {
                          return 'Masukan Username Kamu';
                        }
                        username = usernameValue;
                        return null;
                      },
                      validatorPassword: (passwordValue) {
                        if (passwordValue!.isEmpty) {
                          return 'Masukan Password Kamu';
                        }
                        password = passwordValue;
                        return null;
                      },
                      suffixIcon: IconButton(
                        onPressed: showHide,
                        icon: Icon(
                          _secureText ? Icons.visibility_off : Icons.visibility,
                          color: kPrimaryColor,
                        ),
                      ),
                      secure: _secureText,
                      submit: () {
                        if (_formKey.currentState!.validate()) {
                          _login();
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _login() async {
    setState(() {
      _isLoading = true;
    });

    var data = {
      'username': username,
      'password': password,
    };

    var res = await AuthController().auth(data);
    var body = json.decode(res.body);
    if (body['status'] == 'success') {
      final SharedPreferences localStorage = await _prefs;
      localStorage.setString('data', json.encode(body['data']));
      // ignore: use_build_context_synchronously
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const IndexPages(),
        ),
      );
    } else {
      // _showMsg(body['message']);
      // ignore: avoid_print
      print("Error");
    }

    setState(() {
      _isLoading = false;
    });
  }
}
