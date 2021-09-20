import 'package:flutter/material.dart';
import 'package:rmp_flutter/widgets/general/profile_card.dart';
import 'package:rmp_flutter/widgets/navigations/back_app_bar.dart';

class IDCardScreen extends StatefulWidget {
  static const routeName = "/resident/postal/id-card";
  const IDCardScreen({Key? key}) : super(key: key);

  @override
  State<IDCardScreen> createState() => _IDCardScreenState();
}

class _IDCardScreenState extends State<IDCardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BackAppBar(
        isGradient: true,
      ),
      body: OrientationBuilder(
        builder: (context, orientation) {
          if (orientation == Orientation.landscape) {
            return ProfileCard();
          }
          return Container();
        },
      ),
    );
  }
}
