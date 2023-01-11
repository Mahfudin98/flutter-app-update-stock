import 'package:flutter/material.dart';

import 'card_product_center.dart';
import 'card_product_footer.dart';
import 'card_product_header.dart';

class CardProductList extends StatelessWidget {
  const CardProductList({
    Key? key,
    required this.image,
    required this.productName,
    required this.categoryName,
    required this.categoryPay,
    required this.agen,
    required this.reseller,
    required this.endUser,
    required this.stock,
    required this.time,
  }) : super(key: key);

  final String image;
  final String productName;
  final String categoryName;
  final String categoryPay;
  final String agen;
  final String reseller;
  final String endUser;
  final String stock;
  final String time;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 15,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          CardProductHeader(
            image: image,
            productName: productName,
            categoryName: categoryName,
            categoryPay: categoryPay,
          ),
          const SizedBox(height: 15),
          CardProductCenter(
            agen: agen,
            reseller: reseller,
            endUser: endUser,
          ),
          const SizedBox(height: 10),
          const Divider(
            height: 10,
            thickness: 0.5,
            indent: 0,
            endIndent: 0,
            color: Colors.grey,
          ),
          const SizedBox(height: 10),
          CardProductFooter(
            stock: stock,
            time: time,
          ),
        ],
      ),
    );
  }
}
