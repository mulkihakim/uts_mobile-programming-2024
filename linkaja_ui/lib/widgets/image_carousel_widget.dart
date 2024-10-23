import 'dart:async'; // Tambahkan ini untuk menggunakan Timer
import 'package:flutter/material.dart';

class ImageCarouselWidget extends StatefulWidget {
  @override
  _ImageCarouselWidgetState createState() => _ImageCarouselWidgetState();
}

class _ImageCarouselWidgetState extends State<ImageCarouselWidget> {
  final PageController _pageController = PageController(viewportFraction: 0.8);
  int _carouselIndex = 0;
  Timer? _timer; // Timer untuk mengatur auto-slide

  @override
  void initState() {
    super.initState();
    _startAutoSlide();
  }

  void _startAutoSlide() {
    _timer = Timer.periodic(Duration(seconds: 3), (Timer timer) {
      if (_carouselIndex < 4) {
        _carouselIndex++;
      } else {
        _carouselIndex = 0;
      }

      _pageController.animateToPage(
        _carouselIndex,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _timer?.cancel(); // Jangan lupa menghentikan timer saat widget dihancurkan
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 150,
          child: PageView.builder(
            controller: _pageController,
            onPageChanged: (index) => setState(() => _carouselIndex = index),
            itemCount: 5, // Adjust based on the number of images
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: index == 0 ? Colors.orange : Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      blurRadius: 4,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    'assets/images/gambar${index + 1}.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          ),
        ),
        SizedBox(height: 8),
        _buildPageIndicator(),
      ],
    );
  }

  Widget _buildPageIndicator() {
    return Row(
      children: List.generate(5, (index) {
        return AnimatedContainer(
          duration: Duration(milliseconds: 300),
          margin: EdgeInsets.only(
            left: index == 0 ? 16 : 4, // Tambahkan margin lebih besar untuk indikator pertama
            right: 4, // Margin kanan tetap sama
          ),
          width: _carouselIndex == index ? 12 : 8,
          height: 8,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: _carouselIndex == index ? Colors.red : Colors.grey,
          ),
        );
      }),
    );
  }
}