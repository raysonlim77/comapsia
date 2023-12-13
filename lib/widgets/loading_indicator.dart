import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../config/app_assets.dart';
import '../config/app_colors.dart';

class LoadingIndicator extends StatefulWidget {
  final double? size;
  final bool isBox;
  const LoadingIndicator({this.size, super.key, this.isBox = false});

  @override
  State<LoadingIndicator> createState() => _LoadingIndicatorState();
}

class _LoadingIndicatorState extends State<LoadingIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.isBox) {
      return Container(
          decoration: BoxDecoration(
              gradient: AppColors.whiteGradient,
              borderRadius: BorderRadius.circular(8)),
          child: Padding(
            padding: const EdgeInsets.all(4),
            child: buildLoading(),
          ));
    } else {
      return buildLoading();
    }
  }

  Widget buildLoading() {
    return Container(
      child: Lottie.asset(
        AppAssets.loadingLottie,
        fit: BoxFit.contain,
        height: widget.isBox ? 50 : widget.size ?? 50,
        width: widget.isBox ? 50 : widget.size ?? 50,
      ),
    );
  }
}
