import 'package:flutter/material.dart';
import 'package:mobile_news_app/core/utils/constrants/constrants.dart';
import 'package:mobile_news_app/core/utils/custom_widgets/custom_text.dart';
import 'package:mobile_news_app/feature/home_screen/presentation/provider/mobile_brands_provider.dart';
import 'package:mobile_news_app/feature/mobile_brands/data/model/mobile_brands_model.dart';
import 'package:mobile_news_app/feature/mobile_brands/presentation/provider/samsung_mobile_provider.dart';
import 'package:mobile_news_app/feature/mobile_brands/presentation/provider/selected_mobile_provider.dart';
import 'package:provider/provider.dart';

class MobileBrandPage extends StatelessWidget {
  const MobileBrandPage({super.key});

  @override
  Widget build(BuildContext context) {
    double height = mediaQueryHeight(context);
    double width = mediaQueryWidth(context);
    final provider = Provider.of<MobileBrandsProvider>(context, listen: false);

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
            future: Provider.of<SamsungMobileProvider>(context).fetcheData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return const Text('No data available.');
              } else {
                List<MobilebrandsModel> latestMobileBrands = snapshot.data!;

                return Flexible(
                  fit: FlexFit.loose,
                  child: GridView.builder(
                    padding: EdgeInsets.symmetric(vertical: height * 0.01),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisExtent: height * 0.27,
                      mainAxisSpacing: height * 0.013,
                      crossAxisSpacing: height * 0.01,
                      crossAxisCount: 2,
                    ),
                    itemCount: latestMobileBrands.length,
                    itemBuilder: (context, index) {
                      final imageUrl = latestMobileBrands[index].imageUrl;
                      final price = latestMobileBrands[index].price;
                      final brandName = latestMobileBrands[index].brandName;
                      return GestureDetector(
                        onTap: () {
                          final provider = Provider.of<SelectedMobileProvider>(
                              context,
                              listen: false);
                          provider.setSelectedMobile(latestMobileBrands[index]);
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
                              Image.network(
                                imageUrl,
                                fit: BoxFit.cover,
                                height: height * 0.15,
                                width: width * 0.35,
                                filterQuality: FilterQuality.high,
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
