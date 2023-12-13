import 'package:flutter/material.dart';
import '../config/app_colors.dart';
import '../config/text_styles.dart';

class AppButton extends StatelessWidget {
  final String text;
  final Function() onTap;
  final bool isLoading;

  const AppButton(
      {Key? key,
      required this.onTap,
      required this.text,
      required this.isLoading})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.05,
      margin: const EdgeInsets.only(left: 20, right: 20),
      decoration: const BoxDecoration(
          color: AppColors.blue,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: InkWell(
        onTap: onTap,
        child: Stack(
          children: [
            Center(
              child: Text(
                text,
                style: KTextStyle.authButtonTextStyle,
              ),
            ),
            if (isLoading)
              const Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: EdgeInsets.only(right: 18.0),
                    child: SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(
                        strokeWidth: 3,
                        color: AppColors.grayshade,
                      ),
                    ),
                  ))
          ],
        ),
      ),
    );
  }
}
