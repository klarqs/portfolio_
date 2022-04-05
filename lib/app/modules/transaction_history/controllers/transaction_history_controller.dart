import 'package:lots_/app/modules/transaction_history/models/transaction_history_model.dart';
import 'package:lots_/app/utils/assets.dart';

class TransactionHistoryController {
  List<TransactionHistoryModel> transactionHistories = [
    TransactionHistoryModel(
      icon: Assets.transferIcon,
      transactionType: 'Transfer',
      transactionDate: '23rd Oct. 2020',
      amount: '- ₦ 50,000',
      recipient: 'John',
      reference: '0001111AXDRfrqy',
      status: 'Successful',
    ),
    TransactionHistoryModel(
      icon: Assets.receivedIcon,
      transactionType: 'Received',
      transactionDate: '23rd Oct. 2020',
      amount: '+ ₦ 3,000',
      recipient: 'David',
      reference: '0001111AXDRfrqy',
      status: 'Successful',
    ),
    TransactionHistoryModel(
      icon: Assets.airtimeIcon,
      transactionType: 'Airtime',
      transactionDate: '23rd Nov. 2020',
      amount: '₦ 1,000',
      recipient: '09060785373',
      reference: '0001111AXDRfrqy',
      status: 'Successful',
    ),
    TransactionHistoryModel(
      icon: Assets.receivedIcon,
      transactionType: 'Received',
      transactionDate: '23rd Oct. 2020',
      amount: '+ ₦ 3,000',
      recipient: 'Mercy',
      reference: '0001111AXDRfrqy',
      status: 'Successful',
    ),
    TransactionHistoryModel(
      icon: Assets.airtimeIcon,
      transactionType: 'Airtime',
      transactionDate: '23rd Nov. 2020',
      amount: '₦ 500',
      recipient: '09060785373',
      reference: '0001111AXDRfrqy',
      status: 'Successful',
    ),
    TransactionHistoryModel(
      icon: Assets.transferIcon,
      transactionType: 'Transfer',
      transactionDate: '23rd Oct. 2020',
      amount: '- ₦ 50,000',
      recipient: 'John',
      reference: '0001111AXDRfrqy',
      status: 'Successful',
    ),
    TransactionHistoryModel(
      icon: Assets.receivedIcon,
      transactionType: 'Received',
      transactionDate: '23rd Oct. 2020',
      amount: '+ ₦ 3,000',
      recipient: 'David',
      reference: '0001111AXDRfrqy',
      status: 'Successful',
    ),
    TransactionHistoryModel(
      icon: Assets.receivedIcon,
      transactionType: 'Received',
      transactionDate: '23rd Oct. 2020',
      amount: '+ ₦ 3,000',
      recipient: 'Mercy',
      reference: '0001111AXDRfrqy',
      status: 'Successful',
    ),
    TransactionHistoryModel(
      icon: Assets.receivedIcon,
      transactionType: 'Received',
      transactionDate: '23rd Oct. 2020',
      amount: '+ ₦ 3,000',
      recipient: 'Mercy',
      reference: '0001111AXDRfrqy',
      status: 'Successful',
    ),
    TransactionHistoryModel(
      icon: Assets.transferIcon,
      transactionType: 'Transfer',
      transactionDate: '23rd Oct. 2020',
      amount: '- ₦ 50,000',
      recipient: 'John',
      reference: '0001111AXDRfrqy',
      status: 'Successful',
    ),
    TransactionHistoryModel(
      icon: Assets.receivedIcon,
      transactionType: 'Received',
      transactionDate: '23rd Oct. 2020',
      amount: '+ ₦ 3,000',
      recipient: 'David',
      reference: '0001111AXDRfrqy',
      status: 'Successful',
    ),
  ];
}
