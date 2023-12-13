import 'package:flutter/material.dart';
import '../config/app_colors.dart';
import '../config/text_styles.dart';

class CustomFormField extends StatelessWidget {
  final String headingText;
  final String? hintText;
  final bool obsecureText;
  final Widget? suffixIcon;
  final TextInputType? textInputType;
  final TextInputAction? textInputAction;
  final TextEditingController controller;
  final int maxLines;
  final String? Function(String?)? validator;
  final ValueChanged<String>? onSave;
  final ValueChanged<String?>? onFieldSubmitted;
  final ValueChanged<String>? onChanged;

  const CustomFormField(
      {Key? key,
      required this.headingText,
      this.hintText,
      this.obsecureText = false,
      this.suffixIcon,
      this.textInputType = TextInputType.text,
      this.textInputAction = TextInputAction.done,
      required this.controller,
      required this.maxLines,
      this.validator,
      this.onSave,
      this.onFieldSubmitted,
      this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    BorderRadius defaultBorderRadius = BorderRadius.circular(10);
    double defaultBorderWidth = 1.5;
    Color defaultBorderColor = AppColors.grayshade;
    Color defaultFillColor = AppColors.grayshade;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(
            left: 20,
            right: 20,
            bottom: 10,
          ),
          child: Text(
            headingText,
            style: KTextStyle.textFieldHeading,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: TextFormField(
            maxLines: maxLines,
            controller: controller,
            textInputAction: textInputAction,
            keyboardType: textInputType,
            obscureText: obsecureText,
            validator: validator,
            onChanged: onChanged,
            onFieldSubmitted: onFieldSubmitted,
            onSaved: (val) {
              if (val != null && val.isNotEmpty && onSave != null) {
                onSave!(val);
              }
            },
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 4, vertical: 10),
              filled: true,
              hintText: hintText,
              hintStyle: KTextStyle.textFieldHintStyle,
              suffixIcon: suffixIcon,
              fillColor: AppColors.grayshade,
              errorBorder: OutlineInputBorder(
                borderRadius: defaultBorderRadius,
                borderSide: BorderSide(
                    color: AppColors.error, width: defaultBorderWidth),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: defaultBorderRadius,
                borderSide: BorderSide(
                    color: defaultBorderColor, width: defaultBorderWidth),
              ),
              border: OutlineInputBorder(
                borderRadius: defaultBorderRadius,
                borderSide: BorderSide(
                    color: defaultBorderColor, width: defaultBorderWidth),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: defaultBorderRadius,
                borderSide: BorderSide(
                    color: defaultBorderColor, width: defaultBorderWidth),
              ),
            ),
          ),
        )
      ],
    );
  }
}
