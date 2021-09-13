import 'package:flutter/material.dart';
import 'package:rmp_flutter/configs/constants.dart';

class ScollableCardRow extends StatelessWidget {
  final SizedBox spacingSizedBox;
  final SizedBox startSizedBox;
  final SizedBox endSizedBox;
  final List<Widget> cards;

  const ScollableCardRow({
    Key? key,
    this.spacingSizedBox = kSizedBoxHorizontalS,
    this.cards = const [],
    this.startSizedBox = kSizedBoxHorizontalS,
    this.endSizedBox = kSizedBoxHorizontalS,
  }) : super(key: key);

  List<Widget> _buildCards(){
    if(cards.isEmpty){
      return [];
    }else{
      var out = <Widget>[];

      out.add(startSizedBox);

      for(int i = 0; i < cards.length; i++){
        out.add(cards[i]);
        if(i != cards.length - 1){
          out.add(spacingSizedBox);
        }
      }

      out.add(endSizedBox);

      return out;
    }
    
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: _buildCards()
      ),
    );
  }
}
