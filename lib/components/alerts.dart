import 'package:doodi/constants/colors.dart';
import 'package:doodi/constants/text_style.dart';
import 'package:flutter/material.dart';

class AlertData {
  final String title;
  final String content;
  final Widget? input;
  final String confirmTxt;
  final String? cancelTxt;

  const AlertData({
    required this.title,
    required this.content,
    this.input,
    required this.confirmTxt,
    this.cancelTxt,
  });
}

class Alerts extends StatelessWidget {
  final String type;
  // final VoidCallback onConfirm;
  // final VoidCallback? onCancel;

  const Alerts({
    super.key,
    required this.type,
    // required this.onConfirm,
    // this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    final data = getAlertData(type);

    return AlertDialog(
      title: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 7),
            child: Icon(Icons.error_outline),
          ),

          Text(data.title, style: AppTextStyles.free17),
        ],
      ),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            Text(data.content, style: AppTextStyles.free12),
            if (data.input != null) data.input!,
          ],
        ),
      ),
      actions: <Widget>[
        // cancel button
        if (data.cancelTxt != null)
          TextButton(
            child: Text(
              data.cancelTxt!,
              style: AppTextStyles.free13.copyWith(
                color: Theme.of(context).textTheme.bodyMedium?.color,
              ),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),

        // confirm button
        TextButton(
          child: Text(
            data.confirmTxt,
            style: AppTextStyles.free13.copyWith(color: AppColors.pointBlue),
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }

  // alert 내용 정의
  AlertData getAlertData(String type) {
    switch (type) {
      // 입력 내용이 없음 알림
      case 'empty':
        return AlertData(
          title: '알림',
          content: '필수 입력 항목을 작성하지 않았습니다.',
          confirmTxt: '확인',
        );

      default:
        return AlertData(
          title: 'error !',
          content: '다시 시도해주십시오.',
          confirmTxt: '확인',
        );
    }
  }
}
