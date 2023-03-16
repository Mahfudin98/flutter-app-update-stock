import 'package:flutter/material.dart';

class HeaderLogistic extends StatelessWidget {
  const HeaderLogistic({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          const Text(
            "List Logistic",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
          ),
          const Icon(
            Icons.search,
            color: Colors.grey,
            size: 25,
          ),
          // Container(
          //   padding: const EdgeInsets.symmetric(
          //     vertical: 3,
          //     horizontal: 10,
          //   ),
          //   width: size.width * 0.5,
          //   decoration: BoxDecoration(
          //     borderRadius: BorderRadius.circular(10),
          //     color: kPrimaryColor.withAlpha(50),
          //   ),
          //   child: const TextField(
          //     cursorColor: Colors.grey,
          //     decoration: InputDecoration(
          //       icon: Icon(
          //         Icons.search,
          //         color: Colors.grey,
          //         size: 25,
          //       ),
          //       hintText: "Cari Produk",
          //       hintStyle: TextStyle(fontSize: 14),
          //       border: InputBorder.none,
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
