import 'package:rmp_flutter/screens/condos/about/about_us_screen.dart';
import 'package:rmp_flutter/screens/condos/dashboard/dashboard_screen.dart';
import 'package:rmp_flutter/screens/condos/forgot_password_screen.dart';
import 'package:rmp_flutter/screens/condos/help-desk/help_desk_screen.dart';
import 'package:rmp_flutter/screens/condos/help-desk/reply_screen.dart';
import 'package:rmp_flutter/screens/login_screen.dart';
import 'package:rmp_flutter/screens/condos/postal/package_detail_screen.dart';
import 'package:rmp_flutter/screens/condos/postal/postal_add_screen.dart';
import 'package:rmp_flutter/screens/condos/postal/postal_edit_screen.dart';
import 'package:rmp_flutter/screens/condos/postal/postal_screen.dart';
import 'package:rmp_flutter/screens/condos/profile/profile_setting_screen.dart';
import 'package:rmp_flutter/screens/main_screen.dart';
import 'package:rmp_flutter/screens/preloading_screen.dart';
import 'package:rmp_flutter/screens/residents/contact-support/contact_form_screen.dart';
import 'package:rmp_flutter/screens/residents/contact-support/contact_result_screen.dart';
import 'package:rmp_flutter/screens/residents/contact-support/contact_support_screen.dart';
import 'package:rmp_flutter/screens/residents/contact-support/report_detail_screen.dart';
import 'package:rmp_flutter/screens/residents/payment/confirm_payment_screen.dart';
import 'package:rmp_flutter/screens/residents/payment/payment_result_screen.dart';
import 'package:rmp_flutter/screens/residents/payment/payment_screen.dart';
import 'package:rmp_flutter/screens/residents/payment/specific_payment_screen.dart';
import 'package:rmp_flutter/screens/residents/postal/resident_postal_screen.dart';

final routes = {
  ...generalRoutes,
};

final generalRoutes = {
  MainScreen.routeName: (_) => const MainScreen(),
  PostalScreen.routeName: (_) => const PostalScreen(),
  PostalAddScreen.routeName: (_) => const PostalAddScreen(),
  PostalEditScreen.routeName: (_) => const PostalEditScreen(),
  PackageDetailScreen.routeName: (_) => const PackageDetailScreen(),
  ContactSupportScreen.routeName: (_) => const ContactSupportScreen(),
  ReportDetailScreen.routeName: (_) => const ReportDetailScreen(),
  LoginScreen.routeName: (_) => const LoginScreen(),
  ProfileSettingScreen.routeName: (_) => const ProfileSettingScreen(),
  ContactResultScreen.routeName: (_) => const ContactResultScreen(),
  PaymentResultScreen.routeName: (_) => const PaymentResultScreen(),
  AboutUsScreen.routeName: (_) => const AboutUsScreen(),
  ReplyScreen.routeName: (_) => const ReplyScreen(),
  ContactFormScreen.routeName: (_) => const ContactFormScreen(),
  ResidentPostalScreen.routeName: (_) => const ResidentPostalScreen(),
  HelpDeskScreen.routeName: (_) => const HelpDeskScreen(),
  DashboardScreen.routeName: (_) => const DashboardScreen(),
  ForgotPasswordScreen.routeName: (_) => const ForgotPasswordScreen(),
  ConfirmPaymentScreen.routeName: (_) => const ConfirmPaymentScreen(),
  PaymentScreen.routeName: (_) => const PaymentScreen(),
  SpecificPaymentScreen.routeName: (_) => const SpecificPaymentScreen(),
  PreLoadingScreen.routeName: (_) => const PreLoadingScreen(),
};
