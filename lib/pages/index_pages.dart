import 'package:flutter/material.dart';
import 'package:update_stock_app/pages/components/card/card_layout.dart';
import 'package:update_stock_app/pages/components/header/header_bar.dart';
import 'package:update_stock_app/pages/components/header/header_card.dart';

class IndexPages extends StatefulWidget {
  const IndexPages({Key? key}) : super(key: key);

  @override
  State<IndexPages> createState() => _IndexPagesState();
}

class _IndexPagesState extends State<IndexPages> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      key: _scaffoldKey,
      body: Container(
        color: const Color.fromARGB(77, 231, 231, 231),
        height: size.height,
        child: Stack(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            const HeaderBar(
              name: "Hallo Mahfudin Nawawi!",
              image:
                  "https://api-report.lsskincare.id//storage/user/1670557441moch-mahfudin.JPG",
            ),
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
