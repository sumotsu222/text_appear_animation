import 'dart:math';
import 'package:characters/characters.dart';
import 'package:flutter/material.dart';
import 'text_appear_animation.dart';

class ShuffleAnimatedText extends AnimatedText{

  String text;
  late Animation<double> textTween;

  ShuffleAnimatedText(
    this.text
  );

  //5秒間で0から1へ変化するtextTweenの生成
  @override
  void initAnimation(AnimationController controller) {
    textTween = CurveTween(
      curve: Curves.linear,
    ).animate(controller);
  }

  String visibleString = '';
  String shuffleString = '';

  @override
  Widget animatedBuilder(BuildContext context, Widget? child) {

    //表示が確定した文字のインデックス
    final textValueIndex = (textTween.value.clamp(0,1) * text.length).round();

    //表示させる文字
    visibleString = text.characters.take(textValueIndex).toString();

    //シャッフルし続ける文字
    shuffleString = '';
    for(int i=0; i < text.length - textValueIndex; i++){
      var randomValue;
      var index;

      randomValue = new Random();
      index = randomValue.nextInt(text.length);
      shuffleString = shuffleString + text[index];
    }

    //表示
    return RichText(
        text: TextSpan(
          style: TextStyle(color: Colors.black, fontSize: 64),
          children: [
            TextSpan(
              text: visibleString,
            ),
            TextSpan(
              text: shuffleString,
            ),
         ],
      ),
    );
  }

}