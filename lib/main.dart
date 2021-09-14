import 'package:flutter/material.dart';
import 'package:rmp_flutter/configs/routes.dart';
import 'package:rmp_flutter/configs/style.dart';
import 'package:rmp_flutter/screens/condos/about/about_us_screen.dart';
import 'package:rmp_flutter/screens/main_screen.dart';
import 'package:rmp_flutter/screens/residents/payment/specific_payment_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'RMP-flutter',
      theme: kRMPTheme,
      routes: routes,
      initialRoute: MainScreen.routeName,
      // home: AboutUsScreen(),
      // home: SpecificPaymentScreen(),
      // home: ConfirmPaymentScreen(),
    );
  }
}
 