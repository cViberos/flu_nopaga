import 'package:flu_nopaga/page_home.dart';
import 'package:flu_nopaga/page_pagar.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: false,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          titleTextStyle: TextStyle(color: Colors.black87),
        ),
        cardTheme: CardTheme(
            shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        )),
      ),
      initialRoute: HomePage.nombreRuta,
      routes: {
        HomePage.nombreRuta: (context) => HomePage(),
        'pagarpage': (context) => PagarPage(),
      },
    );
  }
}
