import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:update_stock_app/controllers/auth_controller.dart';
import 'package:update_stock_app/pages/components/card/card_layout.dart';
import 'package:update_stock_app/pages/components/header/header_bar.dart';
import 'package:update_stock_app/pages/components/header/header_card.dart';
import 'package:update_stock_app/services/api.dart';

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
      resizeToAvoidBottomInset: false,
      body: RefreshIndicator(
        onRefresh: () =>
            Provider.of<AuthController>(context, listen: false).getProfile(),
        child: Container(
          color: const Color.fromARGB(77, 231, 231, 231),
          height: size.height,
          child: FutureBuilder(
            future: Provider.of<AuthController>(context, listen: false)
                .getProfile(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              return Consumer<AuthController>(
                builder: (context, data, _) {
                  return Stack(
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      HeaderBar(
                        name: "Hallo ${data.profile.namaDepan}",
                        image: ApiNetwork().imageURL + data.profile.image,
                      ),
                      const HeaderCard(),
                      const Positioned(
                        top: 310,
                        left: 0.0,
                        right: 0.0,
                        child: CardLayout(),
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
