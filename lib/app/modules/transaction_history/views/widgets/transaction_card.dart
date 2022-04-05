import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lots_/app/utils/colors.dart';

class TransactionCard extends StatelessWidget {
  final String icon, recipient, transactionDate, amount, transactionType;

  const TransactionCard(
      {Key? key,
      required this.icon,
      required this.recipient,
      required this.transactionDate,
      required this.amount,
      required this.transactionType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 13.0,
        vertical: 17.0,
      ),
      margin: const EdgeInsets.symmetric(
        vertical: 6.0,
      ),
      decoration: BoxDecoration(
        color: CustomColors.accentColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SvgPicture.asset(icon),
              const SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        transactionType == "Transfer"
                            ? 'Money $transactionType to '
                            : transactionType == "Received"
                                ? 'Money $transactionType from '
                                : 'Airtime Recharge ',
                        style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      Text(
                        transactionType == "Airtime" ? '' : recipient,
                        style: const TextStyle(
                          fontSize: 13,
                          color: CustomColors.primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    transactionDate,
                    style: const TextStyle(
                      color: CustomColors.dark2Color,
                      fontSize: 11,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Text(
            amount,
            style: TextStyle(
              color: transactionType == "Transfer"
                  ? CustomColors.redColor
                  : CustomColors.greenColor,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
