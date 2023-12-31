import 'package:flutter/material.dart';

import '../utils/design.dart';

// 키워드 리스트를 묶어서 보여주는 위젯
class KeywordListWrap extends StatelessWidget {
  const KeywordListWrap({
    super.key,
    required List<String> keywords,
  }) : _keywords = keywords;

  final List<String> _keywords;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Wrap(
        alignment: WrapAlignment.spaceEvenly,
        spacing: defaultSpacingHalf,
        runSpacing: defaultSpacingHalf,
        children: _keywords.map((keyword) {
          return FittedBox(
            fit: BoxFit.scaleDown,
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(horizontal: defaultSpacingHalf, vertical: defaultSpacingQuarter),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(defaultBorderRadius),
                color: Colors.black87,
              ),
              child: Text(
                '#$keyword',
                style: DesignerTextStyle.paragraph3.apply(color: Colors.white),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}