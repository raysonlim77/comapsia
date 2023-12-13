
import 'package:flutter/material.dart';

import '../models/mobile_phone.dart';
import '../views/mobile_phone/mobile_phone_editor_view.dart';

class AppRoute {
  static Future<void> toMobilePhoneEditorView(
      {required BuildContext context,
      MobilePhone? mobilePhone,}) async {

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MobilePhoneEditorView(
          mobilePhone: mobilePhone,
        ),
      ),
    );
  }
}
