import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lots_/app/modules/transaction_details/views/widgets/transaction_details_card_tile.dart';
import 'package:lots_/app/modules/transaction_history/models/transaction_history_model.dart';
import 'package:lots_/app/utils/colors.dart';
import 'package:lots_/app/utils/ui/animations/slide_in_animation.dart';

import '../../../utils/assets.dart';
import '../../../utils/ui/animations/fade_in_animations.dart';

class TransactionDetails extends StatelessWidget {
  final TransactionHistoryModel transactionHistoryDetails;
  const TransactionDetails({Key? key, required this.transactionHistoryDetails})
      : super(key: key);

  final String pageTitle = 'Transaction details';
  final String subTitle = 'Detailed summary of transaction';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.darkPurple,
      appBar: AppBar(
        backgroundColor: CustomColors.darkPurple,
        elevation: 0,
        leading: IconButton(
          splashRadius: 18,
          onPressed: () => Navigator.pop(context),
          icon: SvgPicture.asset(
            Assets.backArrowIcon,
            color: Colors.white,
          ),
        ),
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
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 16),
            FadeIn(
              duration: const Duration(milliseconds: 650),
              delay: const Duration(milliseconds: 350),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 32.0,
                ),
                margin: const EdgeInsets.symmetric(
                  vertical: 6.0,
                ),
                decoration: BoxDecoration(
                  color: CustomColors.accentColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      subTitle,
                      style: const TextStyle(
                        color: CustomColors.primaryColor,
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    TransactionDetailsCardTile(
                      tileKey: 'Recipient',
                      value: transactionHistoryDetails.recipient,
                    ),
                    TransactionDetailsCardTile(
                      tileKey: 'Amount',
                      value: transactionHistoryDetails.amount,
                    ),
                    TransactionDetailsCardTile(
                      tileKey: 'Transaction date',
                      value: transactionHistoryDetails.transactionDate,
                    ),
                    TransactionDetailsCardTile(
                      tileKey: 'Reference',
                      value: transactionHistoryDetails.reference,
                    ),
                    TransactionDetailsCardTile(
                      tileKey: 'Status',
                      value: transactionHistoryDetails.status,
                      isStatus: true,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
