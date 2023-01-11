import 'package:flutter/material.dart';
import 'package:update_stock_app/auth/components/input_container.dart';
import 'package:update_stock_app/style/constants.dart';

class RoundedPasswordInput extends StatelessWidget {
  const RoundedPasswordInput({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return const InputContainer(
      child: TextField(
        cursorColor: kPrimaryColor,
        obscureText: true,
        decoration: InputDecoration(
          icon: Icon(Icons.lock, color: kPrimaryColor),
          hintText: "Password",
          border: InputBorder.none,
        ),
      ),
    );
  }
}
