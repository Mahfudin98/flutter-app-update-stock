import 'package:flutter/material.dart';
import 'package:update_stock_app/pages/components/card/card_logistic.dart';
import 'package:update_stock_app/pages/components/header/header_logistic.dart';

class LogisticPage extends StatefulWidget {
  const LogisticPage({Key? key}) : super(key: key);

  @override
  State<LogisticPage> createState() => _LogisticPageState();
}

class _LogisticPageState extends State<LogisticPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        color: const Color.fromARGB(77, 231, 231, 231),
        width: size.width,
        height: size.height,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            const HeaderLogistic(),
            const CardLogistic(),
          ],
        ),
      ),
    );
  }
}
