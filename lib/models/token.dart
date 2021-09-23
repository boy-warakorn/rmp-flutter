import 'dart:convert';

class TokenModel {
  final String token;
  TokenModel({required this.token});

  factory TokenModel.fromJson(dynamic fetchedResult) {
    return TokenModel(token: jsonDecode(fetchedResult.toString())["token"]);
  }
}
