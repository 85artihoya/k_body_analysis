import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

void showMessage(String message,
    {SnackPosition snackPosition = SnackPosition.BOTTOM,
      void Function(GetSnackBar)? onTap}) {
  Get.snackbar(
    "KBODY",
    message,
    colorText: Colors.white,
    backgroundColor: Colors.black.withOpacity(0.2),
    titleText: Text(
      "KBODY",
      style: TextStyle(fontFamily: 'azonix', color: Colors.white),
    ),
    snackPosition: snackPosition,
    onTap: onTap,
  );
}

void showDialogMessage(BuildContext context, String text,
    {void Function()? onTap}) {
  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    content: Text(text, style: TextStyle(fontSize: 13)),
    actions: [
      TextButton(
        child: new Text("네", style: TextStyle(color: Colors.red)),
        onPressed: onTap,
      ),
      TextButton(
          child: new Text("아니오"),
          onPressed: () {
            Get.back();
          }),
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

void showDialogWidget(
    BuildContext context, Widget widget, String button1, String button2,
    {void Function()? onTap}) {
  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    alignment: Alignment.center,
    content: widget,
    actions: [
      TextButton(
        child: Text(button1, style: TextStyle(color: Colors.blue)),
        onPressed: onTap,
      ),
      TextButton(
          child: Text(button2, style: TextStyle(color: Colors.grey)),
          onPressed: () {
            Get.back();
          }),
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

void showDialogChoice(BuildContext context, String title, String text,
    String button1, String button2,
    {void Function()? onTap}) {
  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    title: Text(
      title,
      style: TextStyle(fontSize: 18, color: Colors.black54),
    ),
    content: Text(text, style: TextStyle(fontSize: 13, color: Colors.black54)),
    actions: [
      TextButton(
        child: Text(
          button1,
          style: TextStyle(color: Colors.blue),
        ),
        onPressed: onTap,
      ),
      TextButton(
          child: Text(
            button2,
            style: TextStyle(color: Colors.black54),
          ),
          onPressed: () {
            Get.back();
          }),
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
