import 'package:mobile_news_app/feature/home_screen/data/firebase_latest_mobile_data.dart';
import 'package:mobile_news_app/feature/home_screen/model/latest_mobile_brands_model.dart';
import 'package:provider/provider.dart';

import '../../exports.dart';

class HomePage extends StatelessWidget {
  static const String routeName = '/home';
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    double height = mediaQueryHeight(context);
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        drawer: const Drawer(),
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.search_rounded,
                  size: height * 0.04,
                )),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.filter_alt_outlined,
                  size: height * 0.04,
                )),
          ],
          title: customText(
              context: context,
              text: 'Mobile Prices',
              color: Colors.white,
              fontSize: height * 0.025,
              fontWeight: FontWeight.w500),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CarouselSlider(
                items: ImagePath()
                    .images
                    .map(
                      (images) => Image.asset(
                        images,
                        fit: BoxFit.fitHeight,
                      ),
                    )
                    .toList(),
                options: CarouselOptions(
                  aspectRatio: 2,
                  autoPlay: true,
                  viewportFraction: 1,
                ),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: height * 0.01,
                ),
                child: customText(
                    context: context,
                    text: 'Letest Mobile Brands',
                    fontSize: height * 0.03,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 1.2),
              ),
              FutureBuilder<List<LatestMobile>>(
                future: Provider.of<LatestMobilePorivder>(context)
                    .fetchLatestMobileData(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Text('No data available.');
                  } else {
                    List<LatestMobile> latestMobileBrands = snapshot.data!;

                    return SizedBox(
                      height: height * 0.25,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: latestMobileBrands.length,
                        itemBuilder: (context, index) {
                          final imageUrl = latestMobileBrands[index].imageUrl;
                          final price = latestMobileBrands[index].prices;
                          final brandName = latestMobileBrands[index].brandName;
                          return GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, '/detail');
                            },
                            child: buildLetestMobileBrandSpecs(
                              context,
                              imageUrl!,
                              brandName!,
                              price.toString(),
                            ),
                          );
                        },
                      ),
                    );
                  }
                },
              ),
              sizedBox(context: context),
              Padding(
                padding: EdgeInsets.all(height * 0.008),
                child: customText(
                  context: context,
                  text: 'Mobile Brands',
                  fontWeight: FontWeight.w500,
                  letterSpacing: 1.2,
                  fontSize: height * 0.03,
                ),
              ),
              SizedBox(
                height: height * 0.22,
                width: height,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: mobileBrands.length,
                  itemBuilder: (context, index) {
                    final mobileBrand = mobileBrands[index];
                    return buildMobileBrands(
                      context: context,
                      brandName: mobileBrand.brandName,
                      imageUrl: mobileBrand.imageUrl,
                    );
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(height * 0.008),
                child: customText(
                  context: context,
                  text: 'News & Updates',
                  fontWeight: FontWeight.w500,
                  letterSpacing: 1.2,
                  fontSize: height * 0.03,
                ),
              ),
              buildNewsCard(
                  context: context,
                  title: 'Samsung Mobile New Realease Realease',
                  description:
                      'Samsung Galaxy S24 Ultra Realease In August 28, Live event in Ameraica,Nothing Planing to lauch new phone Nothing 3. Iphone 15 launching date is march 21'),
              buildNewsCard(
                  context: context,
                  title: 'Samsung Mobile New Realease Realease',
                  description:
                      'Samsung Galaxy S24 Ultra Realease In August 28, Live event in Amersaica,Nothing Planing to lauch new phone Nothing 3. Iphone 15 launching date is march 21'),
              buildNewsCard(
                  context: context,
                  title: 'Samsung Mobile New Realease Realease',
                  description:
                      'Samsung Galaxy S24 Ultra Realease In August 28, Live event in Ameraica,Nothing Planing to lauch new phone Nothing 3. Iphone 15 launching date is march 21'),
              buildNewsCard(
                  context: context,
                  title: 'Samsung Mobile New Realease Realease',
                  description:
                      'Samsung Galaxy S24 Ultra Realease In August 28, Live event in Ameraica,Nothing Planing to lauch new phone Nothing 3. Iphone 15 launching date is march 21'),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildNewsCard(
      {required BuildContext context,
      required String title,
      required String description}) {
    double height = mediaQueryHeight(context);
    return Card(
      elevation: 3,
      child: Row(
        children: [
          Image.asset(
            'assets/images/4.png',
            height: height * 0.18,
          ),
          Flexible(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              customText(
                context: context,
                text: title,
                fontWeight: FontWeight.bold,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
              SizedBox(
                height: height * 0.02,
              ),
              customText(
                context: context,
                text: description,
                fontSize: height * 0.016,
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          )),
        ],
      ),
    );
  }
}
