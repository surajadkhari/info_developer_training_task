import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../data/model/features_imagemodel.dart';

final carouselIndexProvider = StateProvider<int>((ref) {
  return 0;
});

class Dashboard extends ConsumerWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int currentIndex = ref.watch(carouselIndexProvider);
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      drawer: const Drawer(),
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Home"),
        actions: [
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {},
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: Column(
            children: [
              const FeaturesImaegSection(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [Text("h"), Text("data")],
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}

class FeaturesImaegSection extends ConsumerWidget {
  const FeaturesImaegSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int currentIndex = ref.watch(carouselIndexProvider);
    Size screenSize = MediaQuery.of(context).size;
    return Column(
      children: [
        CarouselSlider(
          items: [
            ...imageList.map(
              (e) => Container(
                width: screenSize.width,
                margin: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(e.featureImage))),
              ),
            )
          ],
          options: CarouselOptions(
              enlargeCenterPage: false,
              viewportFraction: 1,
              autoPlay: true,
              autoPlayInterval: const Duration(milliseconds: 3000),
              height: screenSize.height * 0.21,
              onPageChanged: (int index, reason) {
                currentIndex =
                    ref.read(carouselIndexProvider.notifier).state = index;
              }),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: AnimatedSmoothIndicator(
            effect: const WormEffect(
                spacing: 8.0,
                radius: 8.0,
                dotWidth: 10.0,
                dotHeight: 8.0,
                paintStyle: PaintingStyle.fill,
                strokeWidth: 1.5,
                dotColor: Colors.grey,
                activeDotColor: Colors.indigo),
            activeIndex: currentIndex,
            count: imageList.length,
          ),
        ),
      ],
    );
  }
}
