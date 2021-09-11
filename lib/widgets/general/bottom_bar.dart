import 'package:flutter/material.dart';

class BottomBar extends StatelessWidget {
  final BottomNavigationBarItem items;
  const BottomBar({
    Key? key,
    required this.items,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: [items],
    );
  }
}
