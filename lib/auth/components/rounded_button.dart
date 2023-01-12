import 'package:flutter/material.dart';
import 'package:update_stock_app/style/constants.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton({
    Key? key,
    required this.size,
    required this.titleTxt,
    required this.submit,
  }) : super(key: key);

  final Size size;
  final String titleTxt;
  final VoidCallback submit;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: submit,
      borderRadius: BorderRadius.circular(30),
      child: Container(
        width: size.width * 0.8,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: kPrimaryColor,
        ),
        padding: const EdgeInsets.symmetric(vertical: 20),
        alignment: Alignment.center,
        child: Text(
          titleTxt,
          style: const TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
    );
  }
}
