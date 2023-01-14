import 'package:flutter/material.dart';
import 'package:update_stock_app/controllers/product_controller.dart';
import 'package:update_stock_app/pages/components/card/card_product_list.dart';
import 'package:update_stock_app/pages/components/card/modal/modal_content.dart';
import 'package:update_stock_app/style/constants.dart';
import 'package:provider/provider.dart';
import 'package:update_stock_app/style/currency_format.dart';

class CardLayout extends StatelessWidget {
  const CardLayout({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              const Text(
                "List Produk",
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              // ignore: prefer_const_constructors
              Icon(
                Icons.archive,
                size: 30,
                color: kPrimaryColor,
              )
            ],
          ),
          Container(
            width: size.width,
            height: size.height * 0.6,
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: ListProduct(),
          ),
        ],
      ),
    );
  }
}

class ListProduct extends StatelessWidget {
  const ListProduct({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () => Provider.of<ProductController>(context, listen: false)
          .getDataProduct(),
      child: SizedBox(
        child: FutureBuilder(
          future: Provider.of<ProductController>(context, listen: false)
              .getDataProduct(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            return Consumer<ProductController>(builder: (context, product, _) {
              return ListView.separated(
                padding: const EdgeInsets.symmetric(vertical: 5),
                itemCount: product.dataProduct.length,
                itemBuilder: (context, i) {
                  return CardProductList(
                    image: product.dataProduct[i].image,
                    productName: product.dataProduct[i].productName,
                    categoryName: product.dataProduct[i].categoryName,
                    categoryPay: product.dataProduct[i].categoryPay,
                    agen: CurrencyFormat.convertToIdr(
                      int.parse(product.dataProduct[i].agen),
                      0,
                    ),
                    reseller: CurrencyFormat.convertToIdr(
                      int.parse(product.dataProduct[i].reseller),
                      0,
                    ),
                    endUser: CurrencyFormat.convertToIdr(
                      int.parse(product.dataProduct[i].endUser),
                      0,
                    ),
                    stock: CurrencyFormat.convertNumber(
                      int.parse(product.dataProduct[i].stock),
                      0,
                    ),
                    time: "2 Hari Lalu",
                    onPress: () {
                      showModalBottomSheet<void>(
                        context: context,
                        backgroundColor: Colors.transparent,
                        builder: (BuildContext context) {
                          return Padding(
                            padding: EdgeInsets.only(
                                bottom:
                                    MediaQuery.of(context).viewInsets.bottom),
                            child: ModalContent(
                              image: product.dataProduct[i].image,
                              productName: product.dataProduct[i].productName,
                              categoryName: product.dataProduct[i].categoryName,
                              categoryPay: product.dataProduct[i].categoryPay,
                              code: product.dataProduct[i].code,
                              stock: CurrencyFormat.convertNumber(
                                int.parse(product.dataProduct[i].stock),
                                0,
                              ),
                            ),
                          );
                        },
                      );
                    },
                  );
                },
                separatorBuilder: (BuildContext context, int index) =>
                    const SizedBox(height: 10),
              );
            });
          },
        ),
      ),
    );
  }
}
