import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:update_stock_app/layouts/layouts.dart';
import 'package:update_stock_app/services/provider.dart';
import 'package:update_stock_app/style/constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ProviderApi(
      child: MaterialApp(
        title: 'Update Stock App',
        theme: ThemeData(
          primaryColor: kPrimaryColor,
          textTheme:
              GoogleFonts.poppinsTextTheme((Theme.of(context).textTheme)),
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => const LayoutIndex(),
        },
      ),
    );
  }
}
