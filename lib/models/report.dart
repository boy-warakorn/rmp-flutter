import 'dart:convert';

class ReportsModel {
  final List<Report> reports;

  ReportsModel({
    required this.reports,
  });

  factory ReportsModel.fromJson(dynamic fetchedResult) {
    Iterable reportsResult = jsonDecode(fetchedResult.toString())["reports"];

    return ReportsModel(
      reports: List.from(
        reportsResult.map(
          (report) => Report.fromJson(report, false),
        ),
      ),
    );
  }
}

class Report {
  final String id;
  final String roomNumber;
  final String reportOwner;
  final String requestedDate;
  final String resolvedDate;
  final String title;
  final String detail;
  final String? respondDetail;
  final String status;

  Report({
    required this.id,
    required this.roomNumber,
    required this.reportOwner,
    required this.requestedDate,
    required this.resolvedDate,
    required this.title,
    required this.detail,
    required this.status,
    this.respondDetail,
  });

  static Report empty() {
    return Report(
      id: "",
      roomNumber: "",
      reportOwner: "",
      requestedDate: "",
      resolvedDate: "",
      title: "",
      detail: "",
      status: "",
    );
  }

  factory Report.fromJson(dynamic fetchedResult, bool isGetReport) {
    final _reportResult =
        isGetReport ? jsonDecode(fetchedResult) : fetchedResult;
    var _reportContent = {};

    if (isGetReport) {
      _reportContent = _reportResult["content"];
    }

    return !isGetReport
        ? Report(
            id: _reportResult["id"],
            roomNumber: _reportResult["roomNumber"],
            reportOwner: _reportResult["reportOwner"],
            requestedDate: _reportResult["requestedDate"],
            resolvedDate: _reportResult["resolvedDate"],
            title: _reportResult["title"],
            detail: _reportResult["detail"],
            status: _reportResult["status"],
            respondDetail: _reportResult["respondDetail"],
          )
        : Report(
            detail: _reportContent["detail"],
            roomNumber: _reportResult["roomNumber"],
            id: _reportResult["id"],
            status: _reportResult["status"],
            requestedDate: _reportResult["requestedDate"],
            resolvedDate: _reportResult["resolvedDate"],
            title: _reportContent["title"],
            reportOwner: _reportContent["reportOwner"],
            respondDetail: _reportContent["respondDetail"] ?? '',
          );
  }
}
