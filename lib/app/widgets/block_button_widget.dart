// ignore_for_file: unnecessary_this, use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';

class BlockButtonWidget extends StatelessWidget {
  final Color? color;
  final Widget? text;

  final VoidCallback? onPressed;
  const BlockButtonWidget(
      {@required this.color, @required this.text, @required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: this.color!.withOpacity(0.3),
              blurRadius: 40,
              offset: Offset(0, 3)),
          BoxShadow(
              color: this.color!.withOpacity(0.2),
              blurRadius: 13,
              offset: Offset(0, 3)),
        ],
      ),
      // ignore: deprecated_member_use
      child: FlatButton(
        onPressed: this.onPressed,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
        color: this.color,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(child: text),
          ],
        ),
      ),
    );
  }
}

class BlockButtonWidgetWithIcon extends StatelessWidget {
  final Color? color;
  final Widget? text;
  final Image? icon;
  final VoidCallback? onPressed;
  const BlockButtonWidgetWithIcon(
      {@required this.color,
      @required this.text,
      @required this.icon,
      @required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: this.color!.withOpacity(0.3),
              blurRadius: 40,
              offset: Offset(0, 3)),
          BoxShadow(
              color: this.color!.withOpacity(0.2),
              blurRadius: 13,
              offset: Offset(0, 3)),
        ],
      ),
      // ignore: deprecated_member_use
      child: FlatButton(
        onPressed: this.onPressed,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
        color: this.color,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            this.icon == null
                ? const SizedBox()
                : Container(
                    margin: const EdgeInsets.only(right: 14),
                    height: 25,
                    width: 25,
                    child: this.icon,
                  ),
            this.text!,
          ],
        ),
      ),
    );
  }
}
