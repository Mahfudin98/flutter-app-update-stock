// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:update_stock_app/style/constants.dart';

class ListLogistic extends StatelessWidget {
  const ListLogistic({
    Key? key,
    required this.nama_barang,
    required this.category_name,
    required this.stock_logistic,
    required this.satuan,
    required this.onPress,
  }) : super(key: key);

  final String nama_barang;
  final String category_name;
  final String stock_logistic;
  final String satuan;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 15,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: size.width * 0.6,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  nama_barang,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(category_name),
                    const SizedBox(width: 10),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 3,
                        horizontal: 8,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: kPrimaryColor,
                      ),
                      child: Row(
                        children: [
                          Text(
                            stock_logistic,
                            style: const TextStyle(color: Colors.white),
                          ),
                          const SizedBox(width: 5),
                          Text(
                            satuan,
                            style: const TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            width: size.width * 0.1,
            height: 45,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.amber,
              ),
              child: TextButton(
                onPressed: onPress,
                child: const Icon(
                  Icons.edit,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
