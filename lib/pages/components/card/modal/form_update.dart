import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:update_stock_app/controllers/product_controller.dart';

class FormUpdate extends StatefulWidget {
  const FormUpdate({Key? key, required this.code}) : super(key: key);

  final String code;

  @override
  State<FormUpdate> createState() => _FormUpdateState();
}

class _FormUpdateState extends State<FormUpdate> {
  final TextEditingController _stock = TextEditingController();
  bool _isLoading = false;

  FocusNode stockNode = FocusNode();

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    Future.delayed(Duration.zero, () {
      Provider.of<ProductController>(context, listen: false)
          .findCodeProduct(widget.code)
          .then((response) {
        _stock.text = response.code;
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
      child: Form(
        key: _formKey,
        child: Container(
          height: 40,
          decoration: BoxDecoration(
            color: Colors.green[100],
            borderRadius: BorderRadius.circular(10),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: TextFormField(
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(
              hintText: "Masukan Stok Baru",
              hintStyle: TextStyle(color: Colors.green[900]),
              icon: Icon(
                Icons.app_registration_rounded,
                color: Colors.green[900],
              ),
              border: InputBorder.none,
            ),
            onFieldSubmitted: (_) {
              FocusScope.of(context).requestFocus(stockNode);
            },
          ),
        ),
      ),
    );
  }
}
