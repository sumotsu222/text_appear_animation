import 'package:flutter/material.dart';

//インターフェースの定義
//implementsでもいいかも
abstract class AnimatedText {

  Widget animatedBuilder(BuildContext context, Widget? child);

  void initAnimation(AnimationController controller);
}

//テキストアニメーションをビルドするクラス
class TextAppearAnimation  extends StatefulWidget {

  final AnimatedText animatedText;

  const TextAppearAnimation(
    this.animatedText
  );

  @override
  _TextAppearAnimation createState() => _TextAppearAnimation();
}

class _TextAppearAnimation extends State<TextAppearAnimation>
    with TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    //5秒で指定した文字(今回だと「flutter」が表示される設定にする)
    _controller = AnimationController(
      duration: const Duration(seconds: 5),
      vsync: this,
    );

    widget.animatedText.initAnimation(_controller);

    //繰り返しアニメーションを実行する。1度だけ実行の場合は「_controller.forward();」。
    _controller.repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: widget.animatedText.animatedBuilder,
    );
  }
}