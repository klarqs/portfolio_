import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:lots_/app/modules/transaction_details/views/transaction_details.dart';
import 'package:lots_/app/modules/transaction_history/controllers/transaction_history_controller.dart';
import 'package:lots_/app/modules/transaction_history/models/transaction_history_model.dart';
import 'package:lots_/app/modules/transaction_history/views/widgets/transaction_card.dart';
import 'package:lots_/app/utils/assets.dart';
import 'package:lots_/app/utils/colors.dart';
import 'package:lots_/app/utils/ui/animations/slide_in_animation.dart';
import '../../../utils/ui/animations/fade_in_animations.dart';
import '../../../utils/ui/theme_manager.dart';

class TransactionHistory extends StatelessWidget {
  final ThemeNotifier theme;
  TransactionHistory({Key? key, required this.theme}) : super(key: key);

  final String pageTitle = 'All Transactions';
  final TransactionHistoryController _transformationController =
      TransactionHistoryController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      appBar: AppBar(
        // backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          splashRadius: 18,
          onPressed: () => {},
          icon: SvgPicture.asset(Assets.backArrowIcon),
        ),
        actions: [
          IconButton(
            tooltip: 'Light Mode',
            splashRadius: 18,
            onPressed: () => theme.setLightMode(),
            icon: SvgPicture.asset(
              Assets.lightIcon,
              height: 20,
            ),
          ),
          IconButton(
            tooltip: 'Dark Mode',
            splashRadius: 18,
            onPressed: () => theme.setDarkMode(),
            icon: SvgPicture.asset(Assets.darkIcon),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20.0,
          vertical: 4.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SlideInAnimation(
              duration: const Duration(milliseconds: 450),
              distance: 0.2,
              child: Text(
                pageTitle,
                style: GoogleFonts.dmSans(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: CustomColors.primaryColor,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: FutureBuilder<TransactionHistoryModel>(
                future: _transformationController.getTransactionHistory(),
                builder: (context, snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.waiting:
                      return const Center(
                        child: CircularProgressIndicator(
                          strokeWidth: 1,
                          color: CustomColors.primaryColor,
                        ),
                      );
                    case ConnectionState.done:
                      if (snapshot.hasError) {
                        return Center(
                          child: Text(
                            'Has Error: ${snapshot.hasError.toString()}\nInvalid or Expired token',
                            textAlign: TextAlign.center,
                          ),
                        );
                      } else {
                        return ListView.builder(
                          itemCount:
                              snapshot.data?.data.clientTransactions.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            String? status = snapshot.data?.status;
                            ClientTransaction? i =
                                snapshot.data?.data.clientTransactions[index];
                            return GestureDetector(
                              onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => TransactionDetails(
                                    transactionHistoryDetails: i,
                                    status: status,
                                  ),
                                ),
                              ),
                              child: FadeIn(
                                duration: const Duration(milliseconds: 250),
                                delay: const Duration(milliseconds: 400),
                                child: TransactionCard(
                                  icon: i!.type == "TRANSFER"
                                      ? Assets.transferIcon
                                      : i.type == "DEPOSIT"
                                          ? Assets.receivedIcon
                                          : Assets.transferIcon,
                                  recipient: i.type.capitalize(),
                                  transactionDate: DateFormat.yMMMd()
                                      .format(DateTime.parse(i.entryDate)),
                                  amount: i.amount,
                                  transactionType: i.type,
                                  comment: i.comment ?? '',
                                  amountColor: i.type == "TRANSFER"
                                      ? CustomColors.redColor
                                      : i.type == "DEPOSIT"
                                          ? CustomColors.greenColor
                                          : CustomColors.redColor,
                                ),
                              ),
                            );
                          },
                        );
                      }
                    default:
                      return const Text('Unhandled State');
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
