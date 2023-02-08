// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:update_stock_app/style/constants.dart';

class ModalCardLogistic extends StatelessWidget {
  const ModalCardLogistic({
    Key? key,
    required this.nama_barang,
    required this.stock_logistic,
    required this.satuan,
  }) : super(key: key);

  final String nama_barang;
  final String stock_logistic;
  final String satuan;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            nama_barang,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 5),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 5,
              vertical: 2,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: kPrimaryColor,
            ),
            child: Text(
              "$stock_logistic $satuan",
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
