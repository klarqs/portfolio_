import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lots_/app/modules/transaction_history/views/transcation_history_view.dart';
import 'package:lots_/app/utils/colors.dart';
import 'package:provider/provider.dart';

import 'app/utils/ui/theme_manager.dart';

void main() {
  return runApp(ChangeNotifierProvider<ThemeNotifier>(
    create: (_) => ThemeNotifier(),
    child: MyApp(),
  ));
  ;
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeNotifier>(
      builder: (context, theme, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Transaction History',
        theme: theme.getTheme(),
        home: TransactionHistory(
          theme: theme,
        ),
      ),
    );
  }
}
