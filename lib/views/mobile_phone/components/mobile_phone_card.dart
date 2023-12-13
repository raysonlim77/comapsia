import 'package:compasia/config/text_styles.dart';
import 'package:compasia/models/mobile_phone.dart';
import 'package:flutter/material.dart';

class MobilePhoneCard extends StatelessWidget {
  final MobilePhone mobilePhone;
  const MobilePhoneCard({super.key, required this.mobilePhone});
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                mobilePhone.name,
                style: KTextStyle.bodyLarge,
              ),
              Text(
                mobilePhone.variant,
                style: KTextStyle.bodyLarge,
              ),
              Text(
                mobilePhone.imei,
                style: KTextStyle.bodyLarge,
              ),
            ]),
      ),
    );
  }
}
