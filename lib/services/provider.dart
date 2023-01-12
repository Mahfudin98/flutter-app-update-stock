import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:update_stock_app/controllers/auth_controller.dart';
import 'package:update_stock_app/controllers/product_controller.dart';

class ProviderApi extends StatelessWidget {
  const ProviderApi({Key? key, required this.child}) : super(key: key);
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AuthController(),
        ),
        ChangeNotifierProvider(
          create: (_) => ProductController(),
        ),
      ],
      child: child,
    );
  }
}
