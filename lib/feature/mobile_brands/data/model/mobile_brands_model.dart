class MobilebrandsModel {
  final String brandName;
  final String imageUrl;
  final String price;
  Map<String, String>? specifications;

  MobilebrandsModel({
    required this.brandName,
    required this.imageUrl,
    required this.price,
    this.specifications,
  });
}
