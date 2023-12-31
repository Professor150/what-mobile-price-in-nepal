import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mobile_news_app/feature/home_screen/exports.dart';
import 'package:mobile_news_app/feature/mobile_brands/data/model/mobile_brands_model.dart';

class LatestMobilePorivder with ChangeNotifier {
  Future<List<MobilebrandsModel>> fetchLatestMobileData() async {
    List<MobilebrandsModel> mobileDataList = [];
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('mobile').get();

    for (var doc in querySnapshot.docs) {
      Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
      String brandName = data['brandname'] ?? '';
      String imageUrl = data['image'] ?? '';
      String price = data['price'] ?? '';
      MobilebrandsModel mobile = MobilebrandsModel(
        price: price,
        brandName: brandName,
        imageUrl: imageUrl,
        specifications: {
          "Camera": "48 MP, f/1.8, PDAF",
          "Battery": "5000 mAh, Non-removable",
          "Display": "6.5 inches, AMOLED",
        },
      );

      mobileDataList.add(mobile);
    }

    return mobileDataList;
  }
}
