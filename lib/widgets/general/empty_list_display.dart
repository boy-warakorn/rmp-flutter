import 'package:flutter/material.dart';
import 'package:rmp_flutter/configs/colors.dart';
import 'package:rmp_flutter/configs/constants.dart';

class EmptyListDisplay extends StatelessWidget {
  final String text;
  final IconData icon;

  const EmptyListDisplay({
    Key? key,
    this.text = "No item to display",
    this.icon = Icons.no_sim_outlined,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/box.png",
                width: 200,
                height: 200,
              ),
              Text(
                text,
                style: Theme.of(context).textTheme.headline5?.copyWith(
                      color: kBlackColor,
                      fontSize: kSizeS * (1.5),
                    ),
              ),
            ],
          ),
        
      ),
    );
  }
}
