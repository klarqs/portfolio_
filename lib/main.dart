import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lots_/app/modules/transaction_history/views/transcation_history_view.dart';
import 'package:lots_/app/utils/colors.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Transaction History',
        darkTheme: ThemeData.dark().copyWith(
          primaryColorDark: Colors.orange,
          accentColor: CustomColors.primaryColor,
          primaryColor: Colors.black,
          textTheme: GoogleFonts.dmSansTextTheme(
            Theme.of(context).textTheme,
          ),
          textSelectionTheme: const TextSelectionThemeData(
            selectionHandleColor: Colors.transparent,
          ),
        ),
        home: TransactionHistory());
  }
}
