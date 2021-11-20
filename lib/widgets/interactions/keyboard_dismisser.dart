import 'package:flutter/material.dart';

class KeyboardDismisser extends StatelessWidget {
  const KeyboardDismisser({
    Key? key,
    this.child,
  }) : super(key: key);
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: child,
    );
  }
}
