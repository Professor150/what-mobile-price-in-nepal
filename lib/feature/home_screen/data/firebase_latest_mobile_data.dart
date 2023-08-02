import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mobile_news_app/feature/home_screen/exports.dart';
import 'package:mobile_news_app/feature/home_screen/model/latest_mobile_brands_model.dart';

class LatestMobilePorivder with ChangeNotifier {
  Future<List<LatestMobile>> fetchLatestMobileData() async {
    List<LatestMobile> mobileDataList = [];
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('mobile').get();

    for (var doc in querySnapshot.docs) {
      Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
      String brandName = data['brandname'] ?? '';
      String imageUrl = data['image'] ?? '';
      String price = data['price'] ?? '';

      LatestMobile mobileData = LatestMobile(
        brandName: brandName,
        imageUrl: imageUrl,
        prices: price,
      );
      mobileDataList.add(mobileData);
    }

    return mobileDataList;
  }
}
