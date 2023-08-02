import 'package:flutter/material.dart';
import 'package:mobile_news_app/core/utils/constrants/constrants.dart';
import 'package:mobile_news_app/core/utils/custom_widgets/custom_text.dart';

Widget buildMobileBrands(
    {required BuildContext context,
    required String imageUrl,
    required String brandName}) {
  double height = mediaQueryHeight(context);
  return SizedBox(
    width: height * 0.18,
    child: Card(
      elevation: 5,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(height * 0.01),
              child: Image.asset(imageUrl,
                  fit: BoxFit.contain, height: height * 0.15)),
          customText(
            context: context,
            text: brandName,
            fontSize: height * 0.025,
            color: Colors.deepPurpleAccent.shade400,
          ),
        ],
      ),
    ),
  );
}
