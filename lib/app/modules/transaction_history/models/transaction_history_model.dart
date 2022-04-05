import 'dart:convert';

TransactionHistoryModel transactionHistoryModelFromJson(String str) =>
    TransactionHistoryModel.fromJson(json.decode(str));

String transactionHistoryModelToJson(TransactionHistoryModel data) =>
    json.encode(data.toJson());

class TransactionHistoryModel {
  TransactionHistoryModel({
    required this.status,
    required this.code,
    required this.message,
    required this.data,
  });

  String status;
  String code;
  String message;
  Data data;

  factory TransactionHistoryModel.fromJson(Map<String, dynamic> json) =>
      TransactionHistoryModel(
        status: json["status"],
        code: json["code"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "code": code,
        "message": message,
        "data": data.toJson(),
      };
}

class Data {
  Data({
    required this.clientTransactions,
  });

  List<ClientTransaction> clientTransactions;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        clientTransactions: List<ClientTransaction>.from(
            json["clientTransactions"]
                .map((x) => ClientTransaction.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "clientTransactions":
            List<dynamic>.from(clientTransactions.map((x) => x.toJson())),
      };
}

class ClientTransaction {
  ClientTransaction({
    required this.transactionId,
    required this.type,
    required this.amount,
    required this.comment,
    required this.entryDate,
    required this.currencyCode,
    required this.balance,
  });

  int transactionId;
  String type;
  double amount;
  String? comment;
  String entryDate;
  String currencyCode;
  String balance;

  factory ClientTransaction.fromJson(Map<String, dynamic> json) =>
      ClientTransaction(
        transactionId: json["transactionId"],
        type: json["type"],
        amount: json["amount"],
        comment: json["comment"] == null ? null : json["comment"],
        entryDate: json["entryDate"],
        currencyCode: json["currencyCode"],
        balance: json["balance"],
      );

  Map<String, dynamic> toJson() => {
        "transactionId": transactionId,
        "type": type,
        "amount": amount,
        "comment": comment == null ? null : comment,
        "entryDate": entryDate,
        "currencyCode": currencyCode,
        "balance": balance,
      };
}
