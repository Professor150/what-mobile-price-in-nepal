import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:mobile_news_app/core/utils/constrants/constrants.dart';
import 'package:mobile_news_app/core/utils/custom_widgets/custom_text.dart';
import 'package:mobile_news_app/feature/home_screen/presentation/provider/mobile_brands_provider.dart';
import 'package:mobile_news_app/feature/mobile_brands/data/model/mobile_brands_model.dart';
import 'package:mobile_news_app/feature/mobile_brands/presentation/provider/selected_mobile_provider.dart';

class MobileBrandPage extends StatelessWidget {
  static const String routeName = '/mobileBrand';
  const MobileBrandPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = mediaQueryHeight(context);
    final provider = Provider.of<MobileBrandProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: customText(
            context: context,
            text: provider.selectedMobile!.brandName,
            color: Colors.white,
            fontSize: height * 0.025,
            letterSpacing: 1.5),
      ),
      body: Column(
        children: [
          FutureBuilder<List<MobilebrandsModel>>(
            future: Provider.of<MobileBrandProvider>(context).fetchDataForBrand(
                provider.selectedMobile!.brandName.toLowerCase()),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return Center(
                    child: customText(
                        context: context, text: 'No data available.'));
              } else {
                List<MobilebrandsModel> mobilebrand = snapshot.data!;

                return Flexible(
                  fit: FlexFit.loose,
                  child: GridView.builder(
                    padding: EdgeInsets.symmetric(vertical: height * 0.01),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisExtent: height * 0.3,
                      mainAxisSpacing: height * 0.013,
                      crossAxisSpacing: height * 0.01,
                      crossAxisCount: 2,
                    ),
                    itemCount: mobilebrand.length,
                    itemBuilder: (context, index) {
                      final imageUrl = mobilebrand[index].imageUrl;
                      final price = mobilebrand[index].price;
                      final brandName = mobilebrand[index].brandName;
                      return GestureDetector(
                        onTap: () {
                          final provider = Provider.of<SelectedMobileProvider>(
                              context,
                              listen: false);
                          provider.setSelectedMobile(mobilebrand[index]);
                          Navigator.pushNamed(
                            context,
                            '/detail',
                          );
                        },
                        child: Card(
                          elevation: 2,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Hero(
                                tag: imageUrl,
                                child: Image.network(
                                  imageUrl,
                                  fit: BoxFit.contain,
                                  height: height * 0.2,
                                  filterQuality: FilterQuality.high,
                                ),
                              ),
                              SizedBox(
                                height: height * 0.004,
                              ),
                              const Divider(
                                color: Colors.black,
                                thickness: 0.5,
                              ),
                              FittedBox(
                                child: customText(
                                  context: context,
                                  text: brandName,
                                ),
                              ),
                              SizedBox(
                                height: height * 0.006,
                              ),
                              customText(
                                context: context,
                                text: 'NPR. $price',
                                fontWeight: FontWeight.bold,
                              ),
                              SizedBox(
                                height: height * 0.006,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
