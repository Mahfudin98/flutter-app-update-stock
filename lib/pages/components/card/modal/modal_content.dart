import 'package:flutter/material.dart';

class ModalContent extends StatelessWidget {
  const ModalContent({
    Key? key,
    required this.image,
    required this.productName,
    required this.categoryName,
    required this.categoryPay,
    required this.code,
  }) : super(key: key);

  final String image;
  final String productName;
  final String categoryName;
  final String categoryPay;
  final String code;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      // height: size.height * 0.8,
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        color: Colors.amber,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.blue[50],
            ),
            child: Text(
              'Code : $code',
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Colors.blue,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Container(
            width: size.width,
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 10,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white70,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.network(image, scale: 23),
                ),
                // ignore: prefer_const_constructors
                SizedBox(width: 10),
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
          ),
          ElevatedButton(
            child: const Text('Close BottomSheet'),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }
}
