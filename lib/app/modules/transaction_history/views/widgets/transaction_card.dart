import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lots_/app/utils/colors.dart';

class TransactionCard extends StatelessWidget {
  final String icon, recipient, transactionDate, transactionType, comment;
  final double amount;
  final Color amountColor;

  const TransactionCard({
    Key? key,
    required this.icon,
    required this.recipient,
    required this.transactionDate,
    required this.amount,
    required this.transactionType,
    required this.amountColor,
    required this.comment,
  }) : super(key: key);

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
                      SizedBox(
                        width: comment == '' ? 0 : Get.width * .5,
                        child: Text(
                          comment == '' ? '' : "$comment ",
                          style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.normal,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Text(
                        comment == '' ? recipient : '',
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
            '₦ ${amount.toString()}',
            style: TextStyle(
              color: amountColor,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
