import 'dart:convert';

class PackagesModel {
  final List<Package> packages;

  PackagesModel({required this.packages});

  factory PackagesModel.fromJSON(dynamic fetchedResult) {
    Iterable packagesIt = jsonDecode(fetchedResult.toString())["packages"];

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
                  postalService: pkItem["postalService"]),
            )
            .toList());
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

  Package({
    required this.id,
    required this.roomNumber,
    required this.roomOwner,
    required this.note,
    required this.arrivedAt,
    required this.deliveredAt,
    required this.status,
    required this.postalService,
  });

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
    );
  }
}
