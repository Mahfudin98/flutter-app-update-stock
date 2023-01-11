import 'package:flutter/material.dart';

class CardProductHeader extends StatelessWidget {
  const CardProductHeader({
    Key? key,
    required this.image,
    required this.productName,
    required this.categoryName,
    required this.categoryPay,
  }) : super(key: key);

  final String image;
  final String productName;
  final String categoryName;
  final String categoryPay;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.network(
                image,
                scale: 23,
              ),
            ),
            // ignore: prefer_const_constructors
            SizedBox(
              width: 10,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                Text(
                  productName,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  categoryName,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                Text(
                  categoryPay,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
          ],
        ),
        InkWell(
          onTap: () {
            Navigator.pushNamed(context, '/');
          },
          borderRadius: BorderRadius.circular(30),
          child: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.yellow[700],
            ),
            child: const Icon(
              Icons.create,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
