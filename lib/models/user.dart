import 'dart:convert';

class UserModel {
  final String role;
  final String userId;
  final String name;
  final String businessName;
  final String phoneNumber;
  final String citizenNumber;

  UserModel({
    required this.role,
    required this.name,
    required this.businessName,
    required this.userId,
    required this.phoneNumber,
    required this.citizenNumber,
  });

  factory UserModel.fromJson(dynamic fetchedResult) {
    final userResult = jsonDecode(fetchedResult.toString());

    return UserModel(
      role: userResult["profile"]["role"],
      name: userResult["profile"]["name"],
      businessName: userResult["businessName"],
      userId: userResult["id"],
      phoneNumber: userResult["profile"]["phoneNumber"],
      citizenNumber: userResult["profile"]["citizenNumber"],
    );
  }
}
