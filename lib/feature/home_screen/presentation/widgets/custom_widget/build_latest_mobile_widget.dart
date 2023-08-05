import 'package:flutter/material.dart';
import 'package:mobile_news_app/core/utils/constrants/constrants.dart';
import 'package:mobile_news_app/core/utils/custom_widgets/custom_text.dart';

Widget buildLetestMobileBrandSpecs(
    BuildContext context, String imageUrl, String brandName, String prices) {
  double height = mediaQueryHeight(context);
  return SizedBox(
    height: height * 0.25,
    width: height * 0.2,
    child: Card(
      elevation: 5,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(height * 0.01),
            child: Hero(
              tag: imageUrl,
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
                height: height * 0.16,
              ),
            ),
          ),
          const Divider(
            color: Colors.black,
            thickness: 1,
          ),
          FittedBox(
            child: customText(
              context: context,
              text: brandName,
              color: Colors.black,
              fontWeight: FontWeight.w500,
            ),
          ),
          customText(
              context: context,
              text: 'NPR. $prices',
              color: Colors.red,
              fontWeight: FontWeight.w500),
        ],
      ),
    ),
  );
}
