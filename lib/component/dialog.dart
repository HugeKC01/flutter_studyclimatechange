import 'package:flutter/material.dart';

void showLesson1CompletionDialog({
  required BuildContext context,
  required VoidCallback lesson2Continue,
  required VoidCallback backToMain,
}) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Complete'),
        content: const Text(
          'คุณต้องการไปยังเรื่องที่ 2 หรือไม่?',
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
            },
            child: const Text('ยกเลิก'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
              backToMain(); // Call the callback to navigate back to the main screen
            },
            child: const Text('กลับหน้าหลัก'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
              lesson2Continue(); // Call the callback to navigate to Lesson 2
            },
            child: const Text('ไปยังเรื่องที่ 2'),
          ),
        ],
      );
    },
  );
}



void showLesson2CompletionDialog({
  required BuildContext context,
  required VoidCallback activity,
  required VoidCallback backToMain,
}) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Complete'),
        content: const Text(
          'คุณได้เรียนรู้เรื่องที่ 2 เสร็จสิ้นแล้ว\n'
          'คุณสามารถทำกิจกรรมความเข้าใจของคุณได้\n\n'
          'หากคุณกลับหน้าหลัก จะต้องเริ่มการเรียนรู้เรื่องที่ 2 ใหม่\n\n'
          'คุณต้องการทำกิจกรรมนี้หรือไม่?'
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
            },
            child: const Text('ยกเลิก'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
              backToMain(); // Call the callback to navigate back to the main screen
            },
            child: const Text('กลับหน้าหลัก'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
              activity(); // Call the callback to navigate to Lesson 2
            },
            child: const Text('ไปทำกิจกรรม'),
          ),
        ],
      );
    },
  );
}