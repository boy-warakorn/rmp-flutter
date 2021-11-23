import 'dart:convert';

class ReportCountsModel {
  final List<ReportCount> reportCounts;

  ReportCountsModel({
    required this.reportCounts,
  });

  factory ReportCountsModel.fromJSON(dynamic fetchedResult) {
    Iterable reportCountsResult =
        jsonDecode(fetchedResult.toString())["statusCount"];

    return ReportCountsModel(
      reportCounts: List.from(
        reportCountsResult.map(
          (reportCount) => ReportCount.fromJSON(reportCount),
        ),
      ),
    );
  }
}

class ReportCount {
  final String pending;
  final String resolved;
  final String responded;

  ReportCount({
    required this.pending,
    required this.resolved,
    required this.responded,
  });

  ReportCount.empty()
      : this(
          pending: "",
          resolved: "",
          responded: "",
        );

  factory ReportCount.fromJSON(dynamic fetchResult) {
    Map<String, dynamic> reportCountItem = jsonDecode(fetchResult.toString());

    return ReportCount(
      pending: reportCountItem["pending"],
      resolved: reportCountItem["resolved"],
      responded: reportCountItem["responded"],
    );
  }
}
