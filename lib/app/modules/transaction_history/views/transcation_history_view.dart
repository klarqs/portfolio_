import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lots_/app/modules/transaction_details/views/transaction_details.dart';
import 'package:lots_/app/modules/transaction_history/controllers/transaction_history_controller.dart';
import 'package:lots_/app/modules/transaction_history/models/transaction_history_model.dart';
import 'package:lots_/app/modules/transaction_history/views/widgets/transaction_card.dart';
import 'package:lots_/app/utils/assets.dart';
import 'package:lots_/app/utils/colors.dart';
import 'package:lots_/app/utils/ui/animations/slide_in_animation.dart';
import 'package:lots_/main.dart';

import '../../../utils/ui/animations/fade_in_animations.dart';

class TransactionHistory extends StatelessWidget {
  TransactionHistory({Key? key}) : super(key: key);

  final String pageTitle = 'All Transactions';
  final TransactionHistoryController _transformationController =
      TransactionHistoryController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
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
            onPressed: () => {},
            icon: SvgPicture.asset(
              Assets.lightIcon,
              height: 20,
            ),
          ),
          IconButton(
            tooltip: 'Dark Mode',
            splashRadius: 18,
            onPressed: () => {},
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
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: CustomColors.primaryColor,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount:
                    _transformationController.transactionHistories.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  TransactionHistoryModel i =
                      _transformationController.transactionHistories[index];
                  return GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TransactionDetails(
                          transactionHistoryDetails: i,
                        ),
                      ),
                    ),
                    child: FadeIn(
                      duration: const Duration(milliseconds: 450),
                      delay: const Duration(milliseconds: 1000),
                      child: TransactionCard(
                        icon: i.icon,
                        recipient: i.recipient,
                        transactionDate: i.transactionDate,
                        amount: i.amount,
                        transactionType: i.transactionType,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
