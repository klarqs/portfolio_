import 'package:flutter/material.dart';

import '../../../../utils/colors.dart';

class TransactionDetailsCardTile extends StatelessWidget {
  final String tileKey, value;
  final bool isStatus;

  const TransactionDetailsCardTile({
    Key? key,
    required this.tileKey,
    required this.value,
    this.isStatus = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 14.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            tileKey,
            style: const TextStyle(
              color: CustomColors.darkColor,
              fontSize: 14,
              fontWeight: FontWeight.normal,
            ),
          ),
          isStatus
              ? Row(
                  children: [
                    const CircleAvatar(
                      radius: 3,
                      backgroundColor: CustomColors.greenColor,
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Text(
                      value,
                      style: const TextStyle(
                        color: CustomColors.greenColor,
                        fontSize: 15,
                        letterSpacing: .4,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                )
              : Text(
                  value,
                  style: const TextStyle(
                    color: CustomColors.darkColor,
                    fontSize: 15,
                    letterSpacing: .4,
                    fontWeight: FontWeight.bold,
                  ),
                ),
        ],
      ),
    );
  }
}
