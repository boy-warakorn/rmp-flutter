import 'package:flutter/material.dart';
import 'package:rmp_flutter/configs/constants.dart';

class TitleCard extends StatelessWidget {
  final Icon icon;
  final String title;
  final int count;

  const TitleCard({
    Key? key,
    this.icon = const Icon(
      null,
      size: 0,
    ),
    required this.title,
    required this.count,
  }) : super(key: key);

  Widget _buildTitle(context) {
    return Text(
      this.title,
      style: Theme.of(context).textTheme.headline4,
    );
  }

  Widget _buildCount(context) {
    return Text(
      "${this.count}",
      style: Theme.of(context)
          .textTheme
          .headline4
          ?.copyWith(fontWeight: FontWeight.normal),
    );
  }

  List<Widget> _buildContentWithoutIcon(context) {
    return [
      _buildTitle(context),
      kSizedBoxVerticalS,
      _buildCount(context),
    ];
  }

  List<Widget> _buildContentWithIcon(context) {
    return [
      this.icon,
      kSizedBoxVerticalXS,
      _buildTitle(context),
      kSizedBoxVerticalXS,
      _buildCount(context),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(kSizeS),
        child: Column(
          children: this.icon.icon == null
              ? _buildContentWithoutIcon(context)
              : _buildContentWithIcon(context),
        ),
      ),
    );
  }
}
