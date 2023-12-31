import 'package:flutter/material.dart';

import '../models/sns_ids.dart';
import '../utils/design.dart';
import 'keyword_list_wrap.dart';
import 'sns_list_wrap.dart';

// 포스트잇 정보를 표시하는 위젯
class PostItCard extends StatelessWidget {
  const PostItCard({
    required String title,
    required String description,
    required List<String> keywords,
    required SnsIds snsIds,
    required bool isShowSnsIds,
    required bool isOnTap,
    Function? onTap,
    super.key,
  })  : _title = title,
        _description = description,
        _keywords = keywords,
        _snsIds = snsIds,
        _isShowSnsIds = isShowSnsIds,
        _isOnTap = isOnTap,
        _onTap = onTap;

  final String _title;
  final String _description;
  final List<String> _keywords;
  final SnsIds _snsIds;
  final bool _isShowSnsIds;
  final bool _isOnTap;
  final Function? _onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _isOnTap ? _onTap!() : {},
      child: Card(
        child: Container(
          width: MediaQuery.of(context).size.width - ((defaultSpacing + defaultSpacingQuarter) * 2),
          padding: const EdgeInsets.all(defaultSpacingHalf),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                _title,
                style: DesignerTextStyle.title2,
              ),
              const SizedBox(height: defaultSpacingHalf),
              Text(
                _description,
                style: DesignerTextStyle.caption1,
              ),
              const SizedBox(height: defaultSpacing),
              KeywordListWrap(keywords: _keywords),
              Visibility(
                visible: _isShowSnsIds,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const SizedBox(height: defaultSpacing),
                    const Divider(color: Colors.black12),
                    const SizedBox(height: defaultSpacingHalf),
                    SnsListWrap(snsIds: _snsIds),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}