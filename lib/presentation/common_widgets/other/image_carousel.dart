import 'package:flutter/material.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:amar_thikana/core/theme/app_colors.dart';
import 'package:amar_thikana/presentation/common_widgets/loaders/shimmer_loader.dart';

class ImageCarousel extends StatefulWidget {
  final List<String> imageUrls;
  final double height;
  final double? width;
  final BoxFit fit;
  final bool showIndicator;
  final Function(int)? onPageChanged;

  const ImageCarousel({
    super.key,
    required this.imageUrls,
    this.height = 200,
    this.width,
    this.fit = BoxFit.cover,
    this.showIndicator = true,
    this.onPageChanged,
  });

  @override
  State<ImageCarousel> createState() => _ImageCarouselState();
}

class _ImageCarouselState extends State<ImageCarousel> {
  late PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: widget.height,
          width: widget.width,
          child: PageView.builder(
            controller: _pageController,
            itemCount: widget.imageUrls.length,
            onPageChanged: (index) {
              setState(() => _currentPage = index);
              widget.onPageChanged?.call(index);
            },
            itemBuilder: (context, index) {
              return CachedNetworkImage(
                imageUrl: widget.imageUrls[index],
                fit: widget.fit,
                placeholder: (context, url) => const ShimmerLoader(),
                errorWidget:
                    (context, url, error) =>
                        const Center(child: Icon(Icons.error_outline)),
              );
            },
          ),
        ),
        if (widget.showIndicator && widget.imageUrls.length > 1)
          Positioned(
            bottom: 8,
            left: 0,
            right: 0,
            child: Center(
              child: DotsIndicator(
                dotsCount: widget.imageUrls.length,
                position: _currentPage,
                decorator: DotsDecorator(
                  color: Colors.grey[400]!,
                  activeColor: AppColors.primary,
                  size: const Size(8, 8),
                  activeSize: const Size(8, 8),
                  spacing: const EdgeInsets.all(4),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
