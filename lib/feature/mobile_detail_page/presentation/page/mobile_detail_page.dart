import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:mobile_news_app/core/utils/constrants/constrants.dart';
import 'package:mobile_news_app/core/utils/custom_widgets/custom_text.dart';
import 'package:mobile_news_app/feature/mobile_brands/presentation/provider/selected_mobile_provider.dart';
import 'package:mobile_news_app/feature/mobile_detail_page/data/mobile_sepcs_detail_data.dart';
import 'package:mobile_news_app/feature/mobile_detail_page/presentation/page/full_screen_image_view_page.dart';
import 'package:provider/provider.dart';

class MobileDetailScreen extends StatelessWidget {
  static const String routeName = '/detail';

  const MobileDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = mediaQueryHeight(context);
    final selectedMobileProvider = Provider.of<SelectedMobileProvider>(context);
    final mobile = selectedMobileProvider.selectedMobile;
    final mobileImages = [
      mobile!.imageUrl,
      mobile.image1,
      mobile.image2,
      mobile.image3,
    ].whereType<String>().toList();
    return Scaffold(
      appBar: AppBar(
        title: customText(
          context: context,
          text: mobile.brandName,
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
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => FullScreenImageScreen(
                                  imageUrls: mobileImages,
                                ),
                              ));
                            },
                            child: Hero(
                              tag: mobile.imageUrl,
                              child: Image.network(
                                mobile.imageUrl,
                                height: height * 0.23,
                                fit: BoxFit.cover,
                              ),
                            ),
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
              alignment: Alignment.center,
              height: height * 0.12,
              width: double.infinity,
              color: Colors.grey.shade200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 4,
                itemBuilder: (context, index) {
                  final specs = mobileSpecs[index];
                  final specTitle =
                      mobile.specifications!.values.elementAt(index);
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: height * 0.02),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Image.asset(
                          specs.imageUrl,
                          fit: BoxFit.cover,
                          height: height * 0.07,
                        ),
                        customText(
                          context: context,
                          text: specTitle,
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
            ListView.separated(
              separatorBuilder: (context, index) => Divider(
                height: height * 0.01,
                thickness: 1,
              ),
              itemCount: mobile.specifications!.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                final String specTitle =
                    mobile.specifications!.keys.elementAt(index);
                final String specValue =
                    mobile.specifications!.values.elementAt(index);

                return Padding(
                  padding: EdgeInsets.symmetric(vertical: height * 0.008),
                  child: _specificationRow(
                      context: context, title: specTitle, subtitle: specValue),
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
    double height = mediaQueryHeight(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: height * 0.022),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          customText(
            context: context,
            text: title,
            fontWeight: FontWeight.w500,
            fontSize: height * 0.022,
          ),
          customText(
            context: context,
            text: subtitle,
            fontWeight: FontWeight.bold,
            fontSize: height * 0.02,
          ),
        ],
      ),
    );
  }
}
