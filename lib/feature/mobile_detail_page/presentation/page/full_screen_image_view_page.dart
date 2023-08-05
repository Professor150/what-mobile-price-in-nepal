import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class FullScreenImageScreen extends StatefulWidget {
  final List<String> imageUrls;

  const FullScreenImageScreen({
    Key? key,
    required this.imageUrls,
  }) : super(key: key);

  @override
  State<FullScreenImageScreen> createState() => _FullScreenImageScreenState();
}

class _FullScreenImageScreenState extends State<FullScreenImageScreen> {
  final _pageController = PageController();
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page!.round();
      });
    });
  }

  Widget _buildCustomIndicator(int index) {
    double size = 12.0;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      margin: const EdgeInsets.symmetric(horizontal: 4.0),
      width: _currentPage == index ? size * 2 : size,
      height: size,
      decoration: BoxDecoration(
        color: _currentPage == index ? Colors.deepOrange : Colors.grey,
        borderRadius: BorderRadius.circular(size / 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<String> filteredImageUrls =
        widget.imageUrls.where((url) => url.isNotEmpty).toList();

    return Scaffold(
      body: Stack(
        children: [
          PhotoViewGallery.builder(
            itemCount: filteredImageUrls.length,
            builder: (context, index) {
              final imageUrl = filteredImageUrls[index];
              return PhotoViewGalleryPageOptions(
                filterQuality: FilterQuality.high,
                heroAttributes: PhotoViewHeroAttributes(tag: imageUrl),
                imageProvider: NetworkImage(imageUrl),
                minScale: PhotoViewComputedScale.contained,
                maxScale: PhotoViewComputedScale.covered * 2,
              );
            },
            pageController: _pageController,
          ),
          Positioned(
            bottom: 20.0,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                filteredImageUrls.length,
                (index) => _buildCustomIndicator(index),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
