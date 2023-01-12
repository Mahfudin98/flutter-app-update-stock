import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:update_stock_app/auth/login.dart';
import 'package:update_stock_app/pages/index_pages.dart';

class LayoutIndex extends StatefulWidget {
  const LayoutIndex({Key? key}) : super(key: key);

  @override
  State<LayoutIndex> createState() => _LayoutIndexState();
}

class _LayoutIndexState extends State<LayoutIndex> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  bool isAuth = false;

  @override
  void initState() {
    super.initState();
    _checkIfLogin();
  }

  Future<void> _checkIfLogin() async {
    final SharedPreferences localStorage = await _prefs;
    var token = localStorage.getString('data');
    print(token);
    if (token != null) {
      if (mounted) {
        setState(() {
          isAuth = true;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget child;
    if (isAuth) {
      child = const IndexPages();
    } else {
      child = const LoginScreen();
    }
    return child;
  }
}
