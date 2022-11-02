import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../home/data/model/features_imagemodel.dart';
import '../home/presentation/widget/home_carousel/home_carousel.dart';
import '../home/presentation/widget/home_news_section/home_news_section.dart';
import '../home/presentation/widget/home_service_section/home_services.dart';

final carouselIndexProvider = StateProvider<int>((ref) {
  return 0;
});

class Dashboard extends ConsumerWidget {
  const Dashboard({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) { 
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
              SectionHeading(
                leftHeading: 'Services',
                rightHeading: "See All",
                onPressed: () {},
              ),
              const HomeServiceSection(),
              SectionHeading(
                leftHeading: 'News',
                rightHeading: "See All",
                onPressed: () {},
              ),
              ...imageList.map(
                (e) => NewsCard(
                  e: e,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class SectionHeading extends StatelessWidget {
  const SectionHeading(
      {Key? key,
      required this.leftHeading,
      required this.rightHeading,
      required this.onPressed})
      : super(key: key);
  final String rightHeading;
  final String leftHeading;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          leftHeading,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        TextButton(
          onPressed: onPressed,
          child: Text(rightHeading),
        )
      ],
    );
  }
}
