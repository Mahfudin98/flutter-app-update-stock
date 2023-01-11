import 'package:flutter/material.dart';
import 'package:update_stock_app/auth/components/input_container.dart';
import 'package:update_stock_app/style/constants.dart';

class RoundedInput extends StatelessWidget {
  const RoundedInput({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return const InputContainer(
      child: TextField(
        cursorColor: kPrimaryColor,
        decoration: InputDecoration(
          icon: Icon(Icons.email, color: kPrimaryColor),
          hintText: "Username",
          border: InputBorder.none,
        ),
      ),
    );
  }
}
