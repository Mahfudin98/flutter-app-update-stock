import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:update_stock_app/controllers/logstic_controller.dart';

class FormUpdateLogistic extends StatefulWidget {
  const FormUpdateLogistic({
    Key? key,
    required this.id,
    required this.stockLogistic,
  }) : super(key: key);

  final String id;
  final String stockLogistic;

  @override
  State<FormUpdateLogistic> createState() => _FormUpdateLogisticState();
}

class _FormUpdateLogisticState extends State<FormUpdateLogistic> {
  final TextEditingController _stockLogistic = TextEditingController();
  bool _isLoading = false;

  FocusNode stockLogisticNode = FocusNode();

  @override
  void initState() {
    Future.delayed(Duration.zero, () {
      Provider.of<LogisticController>(context, listen: false)
          .findIdLogistic(widget.id)
          .then((response) {
        _stockLogistic.text = response.stock_logistic;
      });
    });
    super.initState();
  }

  void submitLogistic(BuildContext context) {
    if (!_isLoading) {
      setState(() {
        _isLoading = true;
      });

      Provider.of<LogisticController>(context, listen: false)
          .updateLogistic(widget.id, _stockLogistic.text)
          .then((res) {
        if (res) {
          Provider.of<LogisticController>(context, listen: false)
              .getDataLogistic();

          var snackBar = const SnackBar(
            content: Text("Stock Berhasil Diupdate!"),
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
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.6,
            height: 40,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: Colors.green[100],
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextField(
              controller: _stockLogistic,
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
                FocusScope.of(context).requestFocus(stockLogisticNode);
              },
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.2,
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.blue,
            ),
            child: TextButton(
              child: _isLoading
                  ? const CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    )
                  : const Icon(
                      Icons.save,
                      color: Colors.white,
                    ),
              onPressed: () => submitLogistic(context),
            ),
          ),
        ],
      ),
    );
  }
}
