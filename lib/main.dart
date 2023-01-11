import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:update_stock_app/auth/login.dart';
import 'package:update_stock_app/pages/index_pages.dart';
import 'package:update_stock_app/services/service.dart';
import 'package:update_stock_app/style/constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ServiceApi()),
      ],
      child: MaterialApp(
        title: 'Update Stock App',
        theme: ThemeData(
          primaryColor: kPrimaryColor,
          textTheme:
              GoogleFonts.poppinsTextTheme((Theme.of(context).textTheme)),
        ),
        initialRoute: '/login',
        routes: {
          '/': (context) => const IndexPages(),
          '/login': (context) => const LoginScreen(),
        },
      ),
    );
  }
}
