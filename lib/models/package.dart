import 'dart:convert';

class PackageMasterModel {
  final List<String> postalService;

  PackageMasterModel({required this.postalService});

  factory PackageMasterModel.fromJSON(dynamic fetchedResult) {
    Iterable serviceIt = jsonDecode(fetchedResult.toString())["postalService"];

    return PackageMasterModel(
        postalService: serviceIt.map((service) => service.toString()).toList());
  }
}

class PackagesModel {
  final List<Package> packages;
  final Map<String, dynamic> statusCount;

  PackagesModel({
    required this.packages,
    required this.statusCount,
  });

  factory PackagesModel.empty() {
    return PackagesModel(packages: [], statusCount: {});
  }

  factory PackagesModel.fromJSON(dynamic fetchedResult) {
    Iterable packagesIt = jsonDecode(fetchedResult.toString())["packages"];
    Map<String, dynamic> packageCount =
        jsonDecode(fetchedResult.toString())["statusCount"];

    return PackagesModel(
      packages: packagesIt
          .map(
            (pkItem) => Package(
              id: pkItem["id"],
              roomNumber: pkItem["roomNumber"],
              roomOwner: pkItem["roomOwner"] ?? "-",
              note: pkItem["note"],
              arrivedAt: pkItem["arrivedAt"],
              deliveredAt: pkItem["deliveredAt"],
              status: pkItem["status"],
              postalService: pkItem["postalService"],
              imgList: pkItem["imgList"],
            ),
          )
          .toList(),
      statusCount: packageCount,
    );
  }
}

class Package {
  final String id;
  final String roomNumber;
  final String roomOwner;
  final String note;
  final String arrivedAt;
  final String deliveredAt;
  final String status;
  final String postalService;
  final List<dynamic> imgList;

  Package({
    required this.id,
    required this.roomNumber,
    required this.roomOwner,
    required this.note,
    required this.arrivedAt,
    required this.deliveredAt,
    required this.status,
    required this.postalService,
    required this.imgList,
  });

  Package.empty()
      : this(
          id: "",
          roomNumber: "",
          roomOwner: "",
          note: "",
          arrivedAt: "",
          deliveredAt: "",
          status: "",
          postalService: "",
          imgList: [],
        );

  factory Package.fromJSON(dynamic fetchedResult) {
    Map<String, dynamic> pkItem = jsonDecode(fetchedResult.toString());

    return Package(
      id: pkItem["id"],
      roomNumber: pkItem["roomNumber"],
      roomOwner: pkItem["roomOwner"] ?? "-",
      note: pkItem["note"],
      arrivedAt: pkItem["arrivedAt"],
      deliveredAt: pkItem["deliveredAt"],
      status: pkItem["status"],
      postalService: pkItem["postalService"],
      imgList: pkItem["imgList"],
    );
  }
}
