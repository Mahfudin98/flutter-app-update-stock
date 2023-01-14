// ignore_for_file: prefer_typing_uninitialized_variables, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:update_stock_app/auth/components/input_container.dart';
import 'package:update_stock_app/auth/components/rounded_button.dart';
import 'package:update_stock_app/style/constants.dart';

class FormLogin extends StatelessWidget {
  const FormLogin({
    Key? key,
    required this.formKey,
    required this.validatorUsername,
    required this.validatorPassword,
    required this.suffixIcon,
    required this.secure,
    required this.submit,
    required this.text,
  }) : super(key: key);

  // ignore: prefer_typing_uninitialized_variables
  final formKey;
  final validatorUsername;
  final validatorPassword;
  final IconButton suffixIcon;
  final bool secure;
  final VoidCallback submit;
  final text;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Form(
      key: formKey,
      child: Column(
        children: [
          // username
          InputContainer(
            child: TextFormField(
              cursorColor: kPrimaryColor,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                icon: Icon(Icons.alternate_email, color: kPrimaryColor),
                hintText: "Username",
                border: InputBorder.none,
              ),
              validator: validatorUsername,
            ),
          ),
          // password
          InputContainer(
            child: TextFormField(
              cursorColor: kPrimaryColor,
              obscureText: secure,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                icon: const Icon(Icons.lock, color: kPrimaryColor),
                hintText: "Password",
                border: InputBorder.none,
                suffixIcon: suffixIcon,
              ),
              validator: validatorPassword,
            ),
          ),
          RoundedButton(
            size: size,
            titleTxt: text,
            submit: submit,
          )
        ],
      ),
    );
  }
}
