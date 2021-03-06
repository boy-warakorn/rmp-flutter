import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rmp_flutter/models/user.dart';
import 'package:rmp_flutter/repositories/user_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

final currentUser = ChangeNotifierProvider((ref) => CurrentUser());

class CurrentUser extends ChangeNotifier {
  UserModel _user = UserModel(role: "", name: "", businessName: "", userId: "");
  bool _isLoading = false;
  UserModel get user => _user;
  bool get isLoading => _isLoading;
  final UserRepository userRepository = UserRepository();

  Future<void> getCurrentUser() async {
    _isLoading = true;
    final user = await userRepository.getCurrentUser();
    _user = user;
    _isLoading = false;

    notifyListeners();
  }

  void clearUser() async {
    _user = UserModel(role: "", name: "", businessName: "", userId: "");
    final _prefs = await SharedPreferences.getInstance();
    _prefs.clear();
    notifyListeners();
  }
}
