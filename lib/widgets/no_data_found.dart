import 'package:compasia/config/constants.dart';
import 'package:flutter/material.dart';

import '../config/app_assets.dart';
import '../config/app_colors.dart';

class NoDataFound extends StatelessWidget {
  final String? assetImage;
  final String? title;
  const NoDataFound({
    Key? key,
    this.assetImage,
    this.title,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width * 0.45;
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          ColorFiltered(
            colorFilter: const ColorFilter.matrix(AppColors.GREYSCALE_MATRIX),
            child: Container(
              width: width,
              height: width,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(assetImage?? AppAssets.noDataFound),
                    fit: BoxFit.contain),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top:size.width * 0.01, bottom: 12),
            child: Align(
              heightFactor: 0.1,
              child: SizedBox(
                width: width * 1.1,
                child: Text(
               title?? Constants.noDataFound,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    decoration: TextDecoration.none,
                    color: AppColors.caption,
                    fontSize: width * 0.082,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );

  }
}
