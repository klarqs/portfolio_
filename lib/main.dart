import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lots_/app/modules/transaction_history/views/transcation_history_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Transaction History',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          textTheme: GoogleFonts.dmSansTextTheme(
            Theme.of(context).textTheme,
          ),
        ),
        home: TransactionHistory());
  }
}
