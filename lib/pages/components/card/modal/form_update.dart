import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:update_stock_app/controllers/product_controller.dart';

class FormUpdate extends StatefulWidget {
  const FormUpdate({Key? key, required this.code, required this.stock})
      : super(key: key);

  final String code;
  final String stock;

  @override
  State<FormUpdate> createState() => _FormUpdateState();
}

class _FormUpdateState extends State<FormUpdate> {
  final TextEditingController _stock = TextEditingController();
  bool _isLoading = false;

  FocusNode stockNode = FocusNode();

  @override
  void initState() {
    Future.delayed(Duration.zero, () {
      Provider.of<ProductController>(context, listen: false)
          .findCodeProduct(widget.code)
          .then((response) {
        _stock.text = response.stock;
      });
    });
    super.initState();
  }

  void submit(BuildContext context) {
    if (!_isLoading) {
      setState(() {
        _isLoading = true;
      });
      Provider.of<ProductController>(context, listen: false)
          .updateStock(widget.code, _stock.text)
          .then((res) {
        if (res) {
          Provider.of<ProductController>(context, listen: false)
              .getDataProduct();
          var snackBar = const SnackBar(
            content: Text('Stok berhasil diupdate!'),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
          Navigator.pop(context);
          setState(() {
            _isLoading = false;
          });
        } else {
          var snackBar = const SnackBar(
            content: Text('Ops, error. Hubungi Mahfud!'),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
          setState(() {
            _isLoading = false;
          });
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 40,
            width: size.width * 0.6,
            decoration: BoxDecoration(
              color: Colors.green[100],
              borderRadius: BorderRadius.circular(10),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: TextField(
                controller: _stock,
                autofocus: true,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: "Masukan Stok Baru",
                  hintStyle: TextStyle(color: Colors.green[900]),
                  icon: Icon(
                    Icons.app_registration_rounded,
                    color: Colors.green[900],
                  ),
                  border: InputBorder.none,
                ),
                onSubmitted: (_) {
                  FocusScope.of(context).requestFocus(stockNode);
                }),
          ),
          SizedBox(
            width: size.width * 0.2,
            height: 40,
            child: ElevatedButton(
              child: _isLoading
                  ? const CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    )
                  : const Icon(
                      Icons.save,
                      color: Colors.white,
                    ),
              onPressed: () => submit(context),
            ),
          ),
        ],
      ),
    );
  }
}
