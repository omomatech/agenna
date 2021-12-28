// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:agenna/app/widgets/ui_function.dart';

class InputFromField extends StatelessWidget {
  final Widget? title;
  final Widget? content;
  final List<Widget>? actions;
  final double? horizontalPadding;

  const InputFromField(
      {this.title, this.content, this.actions, this.horizontalPadding});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      padding: EdgeInsets.symmetric(
          horizontal: horizontalPadding ?? 20, vertical: 15),
      decoration: UiFunction.getBoxDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(child: title!),
              if (actions != null)
                Wrap(
                  children: actions!,
                )
            ],
          ),
          const Divider(
            height: 26,
            thickness: 1.2,
          ),
          content!,
        ],
      ),
    );
  }
}
