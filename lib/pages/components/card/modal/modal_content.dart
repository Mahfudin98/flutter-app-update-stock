import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:update_stock_app/pages/components/card/modal/container_model.dart';
import 'package:update_stock_app/pages/components/card/modal/form_update.dart';
import 'package:update_stock_app/pages/components/card/modal/modal_card_product.dart';

class ModalContent extends StatelessWidget {
  const ModalContent({
    Key? key,
    required this.image,
    required this.productName,
    required this.categoryName,
    required this.categoryPay,
    required this.code,
    required this.stock,
  }) : super(key: key);

  final String image;
  final String productName;
  final String categoryName;
  final String categoryPay;
  final String code;
  final String stock;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ContainerModal(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ModalCardProduct(
            size: size,
            image: image,
            productName: productName,
            categoryName: categoryName,
            stock: stock,
          ),
          FormUpdate(code: code),
        ],
      ),
    );
  }
}
