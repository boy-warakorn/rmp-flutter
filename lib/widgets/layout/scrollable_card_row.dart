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
      var resultList = <Widget>[];

      resultList.add(startSizedBox);

      for(int i = 0; i < cards.length; i++){
        resultList.add(cards[i]);
        if(i != cards.length - 1){
          resultList.add(spacingSizedBox);
        }
      }

      resultList.add(endSizedBox);

      return resultList;
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
