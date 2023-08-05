import 'package:flutter/material.dart';
import 'package:mobile_news_app/feature/mobile_brands/data/model/mobile_brands_model.dart';

class SelectedMobileProvider with ChangeNotifier {
  int _selectedIndex = -1;
  int get selectedIndex => _selectedIndex;

  void setSelectedIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }

  MobilebrandsModel? _selectedMobile;

  MobilebrandsModel? getSelectedMobile() => _selectedMobile;

  void setSelectedMobile(MobilebrandsModel mobile) {
    _selectedMobile = mobile;
    notifyListeners();
  }

  MobilebrandsModel? get selectedMobile => _selectedMobile;
}
