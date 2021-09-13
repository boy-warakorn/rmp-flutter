import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:rmp_flutter/configs/constants.dart';
import 'package:rmp_flutter/widgets/navigations/back_app_bar.dart';

class PostalEditScreen extends HookWidget {
  const PostalEditScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BackAppBar(),
      body: Container(
        padding: EdgeInsets.symmetric(
          horizontal: kSizeS * 1.5,
          vertical: kSizeS,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [],
          ),
        ),
      ),
    );
  }
}
