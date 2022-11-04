import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../home/presentation/controller/abroad_study_controller.dart';
import '../home/presentation/controller/blog_controller.dart';
import '../home/presentation/controller/home_featured_services_controller.dart';
import '../home/presentation/widgets/home_carousel/home_carousel.dart';
import '../home/presentation/widgets/home_sectiontitle/home_section_title.dart';
import '../home/presentation/widgets/home_service_section/home_services.dart';
import '../home/presentation/widgets/news_section/news_section.dart';

final carouselIndexProvider = StateProvider<int>((ref) {
  return 0;
});

class Dashboard extends ConsumerWidget {
  const Dashboard({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return RefreshIndicator(
      onRefresh: () async {
        ref.refresh(blogControllerProvider);
        ref.refresh(homefeaturedServiceControllerProvider);
        ref.refresh(abroadStudyControllerProvider);
      },
      child: Scaffold(
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
        body: ListView(cacheExtent: 5000, children: [
          Padding(
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
        ]),
      ),
    );
  }
}
