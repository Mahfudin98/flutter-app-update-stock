import 'package:flutter/cupertino.dart';
import 'package:update_stock_app/auth/components/rounded_button.dart';
import 'package:update_stock_app/auth/components/rounded_input.dart';
import 'package:update_stock_app/auth/components/rounded_password_input.dart';

class FormLogin extends StatelessWidget {
  const FormLogin({
    Key? key,
    required this.size,
    required this.defaultLoginSize,
  }) : super(key: key);

  final Size size;
  final double defaultLoginSize;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: SingleChildScrollView(
        // ignore: sized_box_for_whitespace
        child: Container(
          width: size.width,
          height: defaultLoginSize,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Welcome back",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
              const SizedBox(height: 40),
              // SvgPicture.asset('assets/images/login.svg'),
              Image.network(
                "https://lh3.googleusercontent.com/d/1BB-FX1SOgpmn_qqU9gyoFi0iGqayzk6b?authuser=0",
                scale: 2.5,
              ),
              const SizedBox(height: 40),
              RoundedInput(size: size),
              RoundedPasswordInput(size: size),
              RoundedButton(
                size: size,
                titleTxt: 'Login',
              )
            ],
          ),
        ),
      ),
    );
  }
}
