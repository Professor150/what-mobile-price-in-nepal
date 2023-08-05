import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mobile_news_app/feature/home_screen/model/mobile_brands_model.dart';
import 'package:mobile_news_app/feature/mobile_brands/data/model/mobile_brands_model.dart';

class MobileBrandProvider with ChangeNotifier {
  Mobilebrands? _selectedMobile;

  Mobilebrands? get selectedMobile => _selectedMobile;

  void setSelectedMobile(Mobilebrands mobile) {
    _selectedMobile = mobile;
    notifyListeners();
  }

  Future<List<MobilebrandsModel>> fetchDataForBrand(String brandName) async {
    List<MobilebrandsModel> mobileDataList = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection(brandName.toLowerCase())
        .get();

    for (var doc in querySnapshot.docs) {
      Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
      String brandName = data['brandname'] ?? '';
      String imageUrl = data['image'] ?? '';
      String price = data['price'] ?? '';
      MobilebrandsModel mobile = MobilebrandsModel(
        price: price,
        brandName: brandName,
        imageUrl: imageUrl,
        image1: data['image1'] ?? '',
        image2: data['image2'] ?? '',
        image3: data['image3'] ?? '',
        specifications: {
          "Camera": data['camera'] ?? '',
          "Battery": data['battery'] ?? '',
          "Display": data['displaysize'] ?? '',
          "Ram": data['ram'] ?? '',
        },
      );

      mobileDataList.add(mobile);
    }

    return mobileDataList;
  }
}
