import 'dart:convert';

class PaymentModel {
  final List<Payment> payments;

  PaymentModel({
    required this.payments,
  });

  factory PaymentModel.fromJson(dynamic fetchResult) {
    Iterable paymentResult = jsonDecode(fetchResult.toString())["payments"];

    return PaymentModel(
        payments: paymentResult
            .map(
              (paymentItem) => Payment(
                id: paymentItem["id"],
                status: paymentItem["status"],
                roomNumber: paymentItem["roomNumber"],
                type: paymentItem["type"],
                amount: paymentItem["amount"],
                confirmedAt: paymentItem["confirmedAt"],
                issuedAt: paymentItem["issuedAt"],
                paidAt: paymentItem["paidAt"],
              ),
            )
            .toList());
  }
}

class Payment {
  final String id;
  final String status;
  final String roomNumber;
  final String type;
  final int amount;
  final String issuedAt;
  final String confirmedAt;
  final String paidAt;

  Payment({
    required this.id,
    required this.status,
    required this.roomNumber,
    required this.type,
    required this.amount,
    required this.confirmedAt,
    required this.issuedAt,
    required this.paidAt,
  });

  factory Payment.fromJson(dynamic fetchResult) {
    Map<String, dynamic> _paymentResult = jsonDecode(fetchResult.toString());

    return Payment(
        id: _paymentResult["id"],
        status: _paymentResult["status"],
        roomNumber: _paymentResult["roomNumber"],
        type: _paymentResult["type"],
        amount: _paymentResult["amount"],
        confirmedAt: _paymentResult["confirmedAt"],
        issuedAt: _paymentResult["issuedAt"],
        paidAt: _paymentResult["paidAt"]);
  }
}
