import 'package:flutter/material.dart';
import 'package:mobile_news_app/feature/home_screen/model/mobile_brands_model.dart';

class MobileBrandsProvider extends ChangeNotifier {
  Mobilebrands? _selectedMobile;

  Mobilebrands? get selectedMobile => _selectedMobile;

  void setSelectedMobile(Mobilebrands mobile) {
    _selectedMobile = mobile;
    notifyListeners();
  }
}
