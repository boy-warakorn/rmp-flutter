import 'package:flutter/material.dart';
import 'package:rmp_flutter/configs/colors.dart';

// TODO: apply const color

class TextTab extends StatelessWidget {
  final List<String> items;
  final double tabWidth;
  final double underlineHeight;
  final double verticalPadding;
  final Color selectedColor;
  final int selectedIndex;
  final void Function(int)? onSelect;

  const TextTab({
    Key? key,
    required this.items,
    this.tabWidth = 120,
    this.underlineHeight = 4,
    this.verticalPadding = 16,
    this.selectedColor = kBrandColor,
    this.selectedIndex = -1,
    this.onSelect,
  }) : super(key: key);

  Widget _buildUnderline({bool visible = false}) {
    return Container(
      height: underlineHeight,
      color: visible ? selectedColor : null,
    );
  }

  Widget _buildTabs(
    BuildContext context, {
    void Function(int)? onSelect,
  }) {
    List<Widget> contents = [];
    for (int i = 0; i < items.length; i++) {
      contents.add(
        _buildTabItem(
          context,
          text: items[i],
          selected: selectedIndex == i,
          onSelect: onSelect == null ? null : () => onSelect(i),
        ),
      );
    }

    return Row(
      children: contents,
    );
  }

  Widget _buildTabItem(
    BuildContext context, {
    required String text,
    bool selected = false,
    void Function()? onSelect,
  }) {
    final contextTextTheme = Theme.of(context).textTheme;

    return GestureDetector(
      onTap: onSelect,
      child: Container(
        color: Colors.transparent,
        width: tabWidth,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: verticalPadding,
                bottom: verticalPadding - underlineHeight,
              ),
              child: Text(
                text,
                style: selected
                    ? contextTextTheme.headline4?.copyWith(color: kBrandColor)
                    : contextTextTheme.headline5?.copyWith(
                        color: kAlternativeColor,
                      ),
              ),
            ),
            _buildUnderline(
              visible: selected,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: kLightColor,
              boxShadow: [
                BoxShadow(
                  color: kAlternativeColor,
                  blurRadius: 4,
                  offset: Offset(0, 4),
                )
              ],
            ),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: _buildTabs(context, onSelect: onSelect),
            ),
          ),
        ),
      ],
    );
  }
}
