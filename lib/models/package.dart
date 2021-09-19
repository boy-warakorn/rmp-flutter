import 'dart:convert';

class PackagesModel {
  final List<Package> packages;

  PackagesModel({required this.packages});

  factory PackagesModel.fromJSON(dynamic fetchedResult) {
    Iterable packagesIt = jsonDecode(fetchedResult.toString())["packages"];

    return PackagesModel(
        packages: packagesIt
            .map(
              (e) => Package(
                  id: e["id"],
                  roomNumber: e["roomNumber"],
                  roomOwner: e["roomOwner"],
                  note: e["note"],
                  arrivedAt: e["arrivedAt"],
                  deliveredAt: e["deliveredAt"],
                  status: e["status"],
                  postalService: e["postalService"]),
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
}
