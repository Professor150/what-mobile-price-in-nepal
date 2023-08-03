import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:mobile_news_app/core/utils/constrants/constrants.dart';
import 'package:mobile_news_app/core/utils/custom_widgets/custom_text.dart';
import 'package:mobile_news_app/feature/mobile_brands/presentation/provider/selected_mobile_provider.dart';
import 'package:mobile_news_app/feature/mobile_detail_page/data/mobile_sepcs_detail_data.dart';
import 'package:provider/provider.dart';

class DetailScreen extends StatelessWidget {
  static const String routeName = '/detail';

  const DetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = mediaQueryHeight(context);
    final selectedMobileProvider = Provider.of<SelectedMobileProvider>(context);
    final mobile = selectedMobileProvider.selectedMobile;
    return Scaffold(
      appBar: AppBar(
        title: customText(
          context: context,
          text: mobile!.brandName,
          color: Colors.white,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              elevation: 2,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: height * 0.01),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.network(
                            mobile.imageUrl,
                            height: height * 0.23,
                            fit: BoxFit.cover,
                          ),
                          const SizedBox(height: 8),
                        ],
                      ),
                    ),
                  ),
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: height * 0.035,
                        ),
                        Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: height * 0.01),
                          child: customText(
                            context: context,
                            text: mobile.brandName,
                            fontSize: height * 0.025,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(
                          height: height * 0.01,
                        ),
                        Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: height * 0.01),
                          child: RatingBar.builder(
                            initialRating: 2.5,
                            minRating: 1,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemSize: height * 0.025,
                            itemBuilder: (context, _) => const Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            onRatingUpdate: (rating) {},
                          ),
                        ),
                        SizedBox(
                          height: height * 0.01,
                        ),
                        Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: height * 0.01),
                          child: customText(
                            context: context,
                            text: 'NPR. ${mobile.price}',
                            fontSize: height * 0.022,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.4,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: height * 0.11,
              width: double.infinity,
              color: Colors.grey.shade200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: mobileSpecs.length,
                itemBuilder: (context, index) {
                  final specs = mobileSpecs[index];
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: height * 0.02),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                          height: height * 0.01,
                        ),
                        Image.asset(
                          specs.imageUrl,
                          fit: BoxFit.cover,
                          height: height * 0.07,
                        ),
                        customText(
                          context: context,
                          text: specs.specification,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: height * 0.02,
            ),
            ListView.builder(
              itemCount: mobile.specifications!.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                final String specTitle =
                    mobile.specifications!.keys.elementAt(index);
                final String specValue =
                    mobile.specifications!.values.elementAt(index);

                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    _specificationRow(
                        context: context,
                        title: specTitle,
                        subtitle: specValue),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _specificationRow(
      {required BuildContext context,
      required String title,
      required String subtitle}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          customText(
            context: context,
            text: title,
          ),
          customText(
            context: context,
            text: subtitle,
          ),
        ],
      ),
    );
  }
}
