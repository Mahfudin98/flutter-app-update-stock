import 'package:flutter/material.dart';
import 'package:update_stock_app/style/constants.dart';

class HeaderCard extends StatelessWidget {
  const HeaderCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Positioned(
      top: 30,
      width: size.width,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
            // ignore: prefer_const_literals_to_create_immutables
            boxShadow: [
              const BoxShadow(
                color: Color.fromARGB(255, 207, 204, 204),
                offset: Offset(
                  2.0,
                  2.0,
                ),
                blurRadius: 3.0,
                spreadRadius: 1.0,
              ), //BoxShadow
              const BoxShadow(
                color: Colors.white,
                offset: Offset(0.0, 0.0),
                blurRadius: 0.0,
                spreadRadius: 0.0,
              ), //BoxShadow
            ],
          ),
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 10.0,
              vertical: 20.0,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // form
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  padding: const EdgeInsets.symmetric(
                    vertical: 5,
                    horizontal: 20,
                  ),
                  width: size.width * 0.8,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: kPrimaryColor.withAlpha(50),
                  ),
                  child: const TextField(
                    cursorColor: Colors.grey,
                    decoration: InputDecoration(
                      icon: Icon(
                        Icons.search,
                        color: Colors.grey,
                        size: 25,
                      ),
                      hintText: "Cari Produk",
                      hintStyle: TextStyle(fontSize: 14),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                // ignore: prefer_const_constructors
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, '/');
                  },
                  borderRadius: BorderRadius.circular(30),
                  child: Container(
                    width: size.width * 0.8,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: kPrimaryColor,
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    alignment: Alignment.center,
                    child: const Text(
                      "Cari Produk",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
