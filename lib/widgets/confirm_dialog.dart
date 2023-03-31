import 'package:flutter/material.dart';

void showConfirmDialog({
  required BuildContext context,
  String? title,
  required String message,
  required VoidCallback onConfirm,
}) {
  showGeneralDialog(
    context: context,
    barrierDismissible: true,
    barrierColor: Colors.black.withOpacity(0.3),
    barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
    pageBuilder: (_, __, ___) {
      return Container(
        alignment: Alignment.center,
        child: Material(
          color: Colors.transparent,
          child: _Dialog(
            title: title,
            message: message,
            onConfirm: onConfirm,
          ),
        ),
      );
    },
  );
}

class _Dialog extends StatefulWidget {
  final String? title;
  final String message;
  final VoidCallback onConfirm;

  const _Dialog({
    super.key,
    this.title,
    required this.message,
    required this.onConfirm,
  });

  @override
  State<_Dialog> createState() => _DialogState();
}

class _DialogState extends State<_Dialog> {

  @override
  void dispose() {
    print('confirm dialog dispose');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 32),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            widget.title ?? 'Title...',
            style: Theme.of(context).textTheme.headline6,
          ),
          SizedBox(height: 8),
          Text(
            widget.message,
            style: Theme.of(context).textTheme.bodyText1,
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Huỷ'),
              ),
              ElevatedButton(
                onPressed: () {
                  widget.onConfirm();
                  Navigator.of(context).pop();
                },
                child: Text('Đồng ý'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
