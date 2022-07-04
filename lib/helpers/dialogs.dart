import 'package:flutter/material.dart';

// Dialog Box for Loading and Error
class Dialogs {
  Future<void> loading(context, {String? content}) {
    final width = MediaQuery.of(context).size.width / 100;

    return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.white.withOpacity(0.7),
          content: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(width * 4),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const CircularProgressIndicator(),
                SizedBox(height: width * 4),
                Text(content ?? 'Please Wait...'),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> error({@required context, String? title, String? content}) {
    return showDialog(
      context: context,
      builder: (context) {
        final width = MediaQuery.of(context).size.width;

        return AlertDialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(width * 0.02)),
          title: Text(title ?? 'Oops!'),
          content: Text(content ?? 'Something went wrong. Please try later.'),
          actions: [
            TextButton(
              child: const Text('Okay'),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        );
      },
    );
  }

  Future<void> display(context, String title, String content) {
    return showDialog(
      context: context,
      builder: (context) {
        final width = MediaQuery.of(context).size.width;

        return AlertDialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(width * 0.02)),
          title: Text(title),
          content: Text(content),
          actions: [
            TextButton(
              child: const Text('Okay'),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        );
      },
    );
  }

  dismiss(context) => Navigator.of(context).pop();
}
