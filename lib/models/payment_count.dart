import 'dart:convert';

class PaymentCountModel{
  final List<PaymentCount> paymentCounts;

  PaymentCountModel({
    required this.paymentCounts,
  });

  factory PaymentCountModel.fromJSON(dynamic fetchedResult) {
    Iterable paymentCountsResult =
    jsonDecode(fetchedResult.toString())["statusCount"];

    return PaymentCountModel(
      paymentCounts: List.from(
        paymentCountsResult.map(
              (reportCount) => PaymentCount.fromJSON(reportCount),
        ),
      ),
    );
  }
}

class PaymentCount {
  final String active;
  final String pending;
  final String reject;
  final String complete;

  PaymentCount({
    required this.active,
    required this.pending,
    required this.reject,
    required this.complete,
  });

  PaymentCount.empty()
      : this(
    active: "",
    pending: "",
    reject: "",
    complete: "",
  );

  factory PaymentCount.fromJSON(dynamic fetchResult) {
    Map<String, dynamic> paymentCountItem = jsonDecode(fetchResult.toString());

    return PaymentCount(
      active: paymentCountItem["active"],
      pending: paymentCountItem["pending"],
      reject: paymentCountItem["reject"],
      complete: paymentCountItem["complete"],
    );
  }
}
