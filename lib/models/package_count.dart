import 'dart:convert';

class PackageCountModel {
  final List<PackageCount> packageCounts;

  PackageCountModel({
    required this.packageCounts,
  });

  factory PackageCountModel.fromJSON(dynamic fetchedResult) {
    Iterable packageCountsResult =
    jsonDecode(fetchedResult.toString())["statusCount"];

    return PackageCountModel(
      packageCounts: List.from(
        packageCountsResult.map(
              (reportCount) => PackageCount.fromJSON(reportCount),
        ),
      ),
    );
  }
}

class PackageCount {
  final String received;
  final String inStorage;

  PackageCount({
    required this.received,
    required this.inStorage,
  });

  PackageCount.empty()
      : this(
    received: "",
    inStorage: "",
  );

  factory PackageCount.fromJSON(dynamic fetchResult) {
    Map<String, dynamic> packageCountItem = jsonDecode(fetchResult.toString());

    return PackageCount(
      received: packageCountItem["received"],
      inStorage: packageCountItem["in-storage"],
    );
  }
}
