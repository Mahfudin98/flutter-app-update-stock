import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:update_stock_app/controllers/auth_controller.dart';
import 'package:update_stock_app/services/api.dart';
import 'package:update_stock_app/style/constants.dart';

class HeaderBar extends StatefulWidget {
  const HeaderBar({
    Key? key,
  }) : super(key: key);

  @override
  State<HeaderBar> createState() => _HeaderBarState();
}

class _HeaderBarState extends State<HeaderBar> {
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
          color: kPrimaryColor,
          width: size.width,
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          height: 180.0,
          child: FutureBuilder(
            future: Provider.of<AuthController>(context, listen: false)
                .getProfile(),
            builder: ((context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return Consumer<AuthController>(builder: (context, data, _) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        Text(
                          "Hallo ${data.profile.namaDepan}",
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 21,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const Text(
                          "Welcome Back!",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      height: 50,
                      width: 50,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image.network(
                          ApiNetwork().imageURL + data.profile.image,
                          height: 50,
                          width: 50,
                          scale: 25,
                        ),
                      ),
                    ),
                  ],
                );
              });
            }),
          ),
        ),
      ),
    );
  }
}
