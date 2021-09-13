import 'package:rmp_flutter/screens/condos/postal/package_detail_screen.dart';
import 'package:rmp_flutter/screens/condos/postal/postal_add_screen.dart';
import 'package:rmp_flutter/screens/condos/postal/postal_edit_screen.dart';
import 'package:rmp_flutter/screens/condos/postal/postal_screen.dart';
import 'package:rmp_flutter/screens/main_screen.dart';

final routes = {
  ...generalRoutes,
};

final generalRoutes = {
  MainScreen.routeName: (_) => const MainScreen(),
  PostalScreen.routeName: (_) => const PostalScreen(),
  PostalAddScreen.routeName: (_) => const PostalAddScreen(),
  PostalEditScreen.routeName: (_) => const PostalEditScreen(),
  PackageDetailScreen.routeName: (_) => const PackageDetailScreen(),
};
