// class MobilebrandsModel {
//   final String brandName;
//   final String imageUrl;
//   final String price;
//   Map<String, String>? specifications;

//   MobilebrandsModel({
//     required this.brandName,
//     required this.imageUrl,
//     required this.price,
//     this.specifications,
//   });
// }
class MobilebrandsModel {
  final String brandName;
  final String imageUrl;
  final String price;
  Map<String, String>? specifications;
  String? image1;
  final String? image2;
  final String? image3;

  MobilebrandsModel({
    required this.brandName,
    required this.imageUrl,
    required this.price,
    this.specifications,
    this.image1,
    this.image2,
    this.image3,
  });
}
