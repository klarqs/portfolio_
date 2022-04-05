import 'package:lots_/app/modules/transaction_history/views/transcation_history_view.dart';

class TransactionHistoryModel {
  String icon;
  String transactionType;
  String transactionDate;
  String amount;
  String recipient;
  String reference;
  String status;

  TransactionHistoryModel({
    required this.icon,
    required this.transactionType,
    required this.transactionDate,
    required this.amount,
    required this.recipient,
    required this.reference,
    required this.status,
  });
}
