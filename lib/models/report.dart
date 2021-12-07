import 'dart:convert';

class ReportsModel {
  final List<Report> reports;
  final Map<String, dynamic> statusCount;

  ReportsModel({
    required this.reports,
    required this.statusCount,
  });

  factory ReportsModel.empty() {
    return ReportsModel(reports: [], statusCount: {});
  }

  factory ReportsModel.fromJson(dynamic fetchedResult) {
    Iterable reportsResult = jsonDecode(fetchedResult.toString())["reports"];
    Map<String, dynamic> reportCount =
        jsonDecode(fetchedResult.toString())["statusCount"];

    return ReportsModel(
      reports: List.from(
        reportsResult.map(
          (report) => Report.fromJson(report, false),
        ),
      ),
      statusCount: reportCount,
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
  final List<String> imgList;
  final String type;
  final String availableDay;

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
    required this.imgList,
    required this.type,
    required this.availableDay,
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
      imgList: [],
      type: "complaint",
      availableDay: "",
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
            imgList: (_reportResult["imgList"] as List<dynamic>)
                .map((item) => item.toString())
                .toList(),
            type: _reportResult["type"],
            availableDay: _reportResult["availableDay"],
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
            imgList: (_reportResult["imgList"] as List<dynamic>)
                .map((item) => item.toString())
                .toList(),
            type: _reportResult["type"],
            availableDay: _reportResult["availableDay"],
          );
  }
}
