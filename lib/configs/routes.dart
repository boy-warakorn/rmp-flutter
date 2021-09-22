import 'package:rmp_flutter/screens/condos/about/about_us_screen.dart';
import 'package:rmp_flutter/screens/condos/dashboard/dashboard_screen.dart';
import 'package:rmp_flutter/screens/condos/forgot_password_screen.dart';
import 'package:rmp_flutter/screens/condos/help-desk/help_desk_screen.dart';
import 'package:rmp_flutter/screens/condos/help-desk/reply_screen.dart';
import 'package:rmp_flutter/screens/condos/postal/package_detail_screen.dart';
import 'package:rmp_flutter/screens/condos/postal/postal_add_screen.dart';
import 'package:rmp_flutter/screens/condos/postal/postal_edit_screen.dart';
import 'package:rmp_flutter/screens/condos/postal/postal_screen.dart';
import 'package:rmp_flutter/screens/condos/profile/profile_setting_screen.dart';
import 'package:rmp_flutter/screens/login_screen.dart';

import 'package:rmp_flutter/screens/preloading_screen.dart';
import 'package:rmp_flutter/screens/residents/contact-support/contact_form_screen.dart';
import 'package:rmp_flutter/screens/residents/contact-support/contact_result_screen.dart';
import 'package:rmp_flutter/screens/residents/contact-support/contact_support_screen.dart';
import 'package:rmp_flutter/screens/residents/contact-support/report_detail_screen.dart';
import 'package:rmp_flutter/screens/residents/contact-support/resident_reply_screen.dart';
import 'package:rmp_flutter/screens/residents/payment/confirm_payment_screen.dart';
import 'package:rmp_flutter/screens/residents/payment/payment_result_screen.dart';
import 'package:rmp_flutter/screens/residents/payment/payment_screen.dart';
import 'package:rmp_flutter/screens/residents/payment/specific_payment_screen.dart';
import 'package:rmp_flutter/screens/residents/postal/id_card_screen.dart';
import 'package:rmp_flutter/screens/residents/postal/profile_card_screen.dart';
import 'package:rmp_flutter/screens/residents/postal/resident_postal_screen.dart';

final routes = {
  ...generalRoutes,
  ...condoRoutes,
  ...residentRoutes,
};

final generalRoutes = {
  ProfileSettingScreen.routeName: (_) => const ProfileSettingScreen(),
  LoginScreen.routeName: (_) => const LoginScreen(),
  AboutUsScreen.routeName: (_) => const AboutUsScreen(),
  ForgotPasswordScreen.routeName: (_) => const ForgotPasswordScreen(),
  PreLoadingScreen.routeName: (_) => const PreLoadingScreen(),
};

final condoRoutes = {
  PostalScreen.routeName: (_) => const PostalScreen(),
  PostalAddScreen.routeName: (_) => const PostalAddScreen(),
  PostalEditScreen.routeName: (_) => const PostalEditScreen(),
  PackageDetailScreen.routeName: (_) => const PackageDetailScreen(),
  ReplyScreen.routeName: (_) => const ReplyScreen(),
  HelpDeskScreen.routeName: (_) => const HelpDeskScreen(),
  DashboardScreen.routeName: (_) => const DashboardScreen(),
};

final residentRoutes = {
  ContactSupportScreen.routeName: (_) => const ContactSupportScreen(),
  ReportDetailScreen.routeName: (_) => const ReportDetailScreen(),
  ContactResultScreen.routeName: (_) => const ContactResultScreen(),
  PaymentResultScreen.routeName: (_) => const PaymentResultScreen(),
  ContactFormScreen.routeName: (_) => const ContactFormScreen(),
  ResidentPostalScreen.routeName: (_) => const ResidentPostalScreen(),
  ConfirmPaymentScreen.routeName: (_) => const ConfirmPaymentScreen(),
  PaymentScreen.routeName: (_) => const PaymentScreen(),
  SpecificPaymentScreen.routeName: (_) => const SpecificPaymentScreen(),
  ResidentReplyScreen.routeName: (_) => const ResidentReplyScreen(),
  ProfileCardScreen.routeName: (_) => const ProfileCardScreen(),
  IDCardScreen.routeName: (_) => const IDCardScreen(),
};
