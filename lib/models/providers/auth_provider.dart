import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rmp_flutter/repositories/auth_repository.dart';

final authRepositoryProvider =
    Provider<BaseAuthRepository>((ref) => AuthRepository());
