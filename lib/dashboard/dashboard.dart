import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../home/presentation/widget/home_carousel/home_carousel.dart';
import '../home/presentation/widget/home_sectiontitle/home_section_title.dart';
import '../home/presentation/widget/home_service_section/home_services.dart';
import '../home/presentation/widget/news_section/news_section.dart';

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
              const NewsSection()
            ],
          ),
        ),
      ),
    );
  }
}
