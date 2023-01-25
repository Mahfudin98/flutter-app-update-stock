import 'package:flutter/material.dart';
import 'package:update_stock_app/pages/components/card/card_layout.dart';
import 'package:update_stock_app/pages/components/header/header_bar.dart';
import 'package:update_stock_app/pages/components/header/header_card.dart';

class ProductPage extends StatefulWidget {
  ProductPage({Key? key}) : super(key: key);

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        color: const Color.fromARGB(77, 231, 231, 231),
        width: size.width,
        height: size.height,
        child: Stack(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            const HeaderBar(),
            const HeaderCard(),
            const Positioned(
              top: 310,
              left: 0.0,
              right: 0.0,
              child: CardLayout(),
            ),
          ],
        ),
      ),
    );
  }
}
