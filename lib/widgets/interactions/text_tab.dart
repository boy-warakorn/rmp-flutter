import 'package:flutter/material.dart';
import 'package:rmp_flutter/configs/colors.dart';
import 'package:rmp_flutter/configs/constants.dart';

class TextTab extends StatelessWidget {
  final List<String> labels;
  final double tabWidth;
  final double underlineHeight;
  final double verticalPadding;
  final Color selectedColor;
  final int selectedIndex;
  final void Function(int)? onSelect;

  const TextTab({
    Key? key,
    required this.labels,
    this.tabWidth = kSizeXXL * 0.6,
    this.underlineHeight = kSizeXXS,
    this.verticalPadding = kSizeS,
    this.selectedColor = kBrandColor,
    this.selectedIndex = -1,
    this.onSelect,
  }) : super(key: key);

  factory TextTab.secondary({
    required List<String> labels,
    int selectedIndex = -1,
    void Function(int)? onSelect,
  }) {
    return TextTab(
      labels: labels,
      selectedIndex: selectedIndex,
      onSelect: onSelect,
      verticalPadding: kSizeXS * 1.5,
      selectedColor: kStrokeColor,
      underlineHeight: 2.5,
    );
  }

  Widget _buildTabBound({
    bool useFlex = false,
    Widget? child,
    required int index,
  }) {
    final body = GestureDetector(
      onTap: () => onSelect!(index),
      child: Container(
        color: Colors.transparent,
        width: useFlex ? null : tabWidth,
        child: child,
      ),
    );

    return useFlex
        ? Expanded(
            child: body,
          )
        : body;
  }

  Widget _buildTabBody(
    BuildContext context, {
    bool selected = false,
    String label = "",
  }) {
    final baseTextTheme = Theme.of(context).textTheme;
    return Row(
      children: [
        Expanded(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  bottom: verticalPadding - underlineHeight,
                  top: verticalPadding,
                ),
                child: Text(
                  label,
                  style: selected
                      ? baseTextTheme.headline4?.copyWith(
                          color: selectedColor,
                        )
                      : baseTextTheme.headline5?.copyWith(
                          color: kAlternativeColor,
                        ),
                ),
              ),
              Container(
                height: underlineHeight,
                color: selected ? selectedColor : null,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTabs(
    BuildContext context, {
    bool useFlex = false,
    void Function(int)? onSelect,
  }) {
    List<Widget> contents = [];
    for (int i = 0; i < labels.length; i++) {
      contents.add(
        _buildTabBound(
          index: i,
          useFlex: useFlex,
          child: _buildTabBody(
            context,
            selected: i == selectedIndex,
            label: labels[i],
          ),
        ),
      );
    }

    return Row(
      children: contents,
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
                  color: kTabShadowColor,
                  blurRadius: kSizeXXS,
                  offset: Offset(0, kSizeXXS),
                )
              ],
            ),
            child: LayoutBuilder(
              builder: (context, constraints) {
                final screenWidth = MediaQuery.of(context).size.width;
                final tabSpace = tabWidth * labels.length;
                if (tabSpace > screenWidth) {
                  return SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: _buildTabs(
                      context,
                      onSelect: onSelect,
                      useFlex: false,
                    ),
                  );
                } else {
                  return _buildTabs(
                    context,
                    onSelect: onSelect,
                    useFlex: true,
                  );
                }
              },
            ),
          ),
        ),
      ],
    );
  }
}
