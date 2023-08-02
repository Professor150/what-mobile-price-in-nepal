import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:mobile_news_app/core/utils/constrants/constrants.dart';
import 'package:mobile_news_app/core/utils/custom_widgets/custom_text.dart';
import 'package:mobile_news_app/feature/home_screen/data/latest_brands_mobile_data.dart';
import 'package:mobile_news_app/feature/home_screen/presentation/bloc/latest_mobile_bloc.dart';
import 'package:mobile_news_app/feature/mobile_detail_page/data/mobile_sepcs_detail_data.dart';
import 'package:mobile_news_app/feature/mobile_detail_page/data/specification_data.dart';

class DetailScreen extends StatelessWidget {
  static const String routeName = '/detail';

  const DetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = mediaQueryHeight(context);
    double width = mediaQueryWidth(context);
    final selectedBrandBloc = BlocProvider.of<SelectedBrandBloc>(context);
    final selectedIndex = selectedBrandBloc.state.selectedIndex;
    final selectedBrand = latestMobileBrands[selectedIndex];
    return Scaffold(
      appBar: AppBar(
        title: customText(
          context: context,
          text: selectedBrand.brandName,
          color: Colors.white,
        ),
      ),
      body: SingleChildScrollView(
        // Wrap the entire content with SingleChildScrollView
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
                          Image.asset(
                            'assets/images/4.png',
                            height: height * 0.3,
                            width: width * 0.4,
                            fit: BoxFit.fitHeight,
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
                            text: selectedBrand.brandName,
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
                            text: 'NPR.  ${selectedBrand.prices}',
                            fontSize: height * 0.022,
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
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: specificationData.length,
              itemBuilder: (context, index) {
                final data = specificationData[index];
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    _specificationRow(
                        context: context,
                        title: 'Launch Date',
                        subtitle: data.launchDate),
                    _specificationRow(
                        context: context,
                        title: 'Aspectratio',
                        subtitle: data.aspectRatio),
                    _specificationRow(
                        context: context,
                        title: 'Audio Jack',
                        subtitle: data.audioJack),
                    _specificationRow(
                        context: context,
                        title: 'Auto Foucs',
                        subtitle: data.autoFocus),
                    _specificationRow(
                        context: context,
                        title: 'Quixk Charging',
                        subtitle: data.batteryQuickCharging),
                    _specificationRow(
                        context: context,
                        title: 'Launch Date',
                        subtitle: data.launchDate),
                    _specificationRow(
                        context: context,
                        title: 'Launch Date',
                        subtitle: data.launchDate),
                    _specificationRow(
                        context: context,
                        title: 'Launch Date',
                        subtitle: data.launchDate),
                    _specificationRow(
                        context: context,
                        title: 'Launch Date',
                        subtitle: data.launchDate),
                    _specificationRow(
                        context: context,
                        title: 'Launch Date',
                        subtitle: data.launchDate),
                    _specificationRow(
                        context: context,
                        title: 'Launch Date',
                        subtitle: data.launchDate),
                    _specificationRow(
                        context: context,
                        title: 'Launch Date',
                        subtitle: data.launchDate),
                    _specificationRow(
                        context: context,
                        title: 'Launch Date',
                        subtitle: data.launchDate),
                    _specificationRow(
                        context: context,
                        title: 'Launch Date',
                        subtitle: data.launchDate),
                    _specificationRow(
                        context: context,
                        title: 'Launch Date',
                        subtitle: data.launchDate),
                    _specificationRow(
                        context: context,
                        title: 'Launch Date',
                        subtitle: data.launchDate),
                    _specificationRow(
                        context: context,
                        title: 'Launch Date',
                        subtitle: data.launchDate),
                    _specificationRow(
                        context: context,
                        title: 'Launch Date',
                        subtitle: data.launchDate),
                    _specificationRow(
                        context: context,
                        title: 'Launch Date',
                        subtitle: data.launchDate),
                    _specificationRow(
                        context: context,
                        title: 'Launch Date',
                        subtitle: data.launchDate),
                    _specificationRow(
                        context: context,
                        title: 'Launch Date',
                        subtitle: data.launchDate),
                    _specificationRow(
                        context: context,
                        title: 'Launch Date',
                        subtitle: data.launchDate),
                    _specificationRow(
                        context: context,
                        title: 'Launch Date',
                        subtitle: data.launchDate),
                    _specificationRow(
                        context: context,
                        title: 'Launch Date',
                        subtitle: data.launchDate),
                    _specificationRow(
                        context: context,
                        title: 'Launch Date',
                        subtitle: data.launchDate),
                    _specificationRow(
                        context: context,
                        title: 'Launch Date',
                        subtitle: data.launchDate),
                    _specificationRow(
                        context: context,
                        title: 'Launch Date',
                        subtitle: data.launchDate),
                    _specificationRow(
                        context: context,
                        title: 'Launch Date',
                        subtitle: data.launchDate),
                    _specificationRow(
                        context: context,
                        title: 'Launch Date',
                        subtitle: data.launchDate),
                    _specificationRow(
                        context: context,
                        title: 'Launch Date',
                        subtitle: data.launchDate),
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
