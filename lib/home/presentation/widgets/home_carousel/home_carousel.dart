// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:info_dev/const/app_config.dart';
// import 'package:shimmer/shimmer.dart';
// import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// import '../../../../dashboard/dashboard.dart';
// import '../../../data/model/features_imagemodel.dart';
// import '../../controller/abroad_study_controller.dart';

// class FeaturesImaegSection extends ConsumerWidget {
//   const FeaturesImaegSection({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     int currentIndex = ref.watch(carouselIndexProvider);
//     final result = ref.watch(abroadStudyControllerProvider);
//     Size screenSize = MediaQuery.of(context).size;
//     return result.when(
//         data: (data) {
//           return Column(children: [
//             CarouselSlider(
//               items: [
//                 ...data.map(
//                   (e) => Container(
//                     width: screenSize.width,
//                     margin: const EdgeInsets.symmetric(horizontal: 12),
//                     decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(10),
//                         image: DecorationImage(
//                             fit: BoxFit.cover,
//                             image: CachedNetworkImageProvider(
//                                 AppConfig.mainURL + e.image))),
//                   ),
//                 )
//               ],
//               options: CarouselOptions(
//                   enlargeCenterPage: false,
//                   viewportFraction: 1,
//                   autoPlay: true,
//                   autoPlayInterval: const Duration(milliseconds: 3000),
//                   height: screenSize.height * 0.21,
//                   onPageChanged: (int index, reason) {
//                     currentIndex =
//                         ref.read(carouselIndexProvider.notifier).state = index;
//                   }),
//             ),
//             Padding(
//               padding: const EdgeInsets.symmetric(vertical: 10),
//               child: AnimatedSmoothIndicator(
//                 effect: const WormEffect(
//                     spacing: 8.0,
//                     radius: 8.0,
//                     dotWidth: 9.0,
//                     dotHeight: 4.0,
//                     paintStyle: PaintingStyle.fill,
//                     strokeWidth: 1.5,
//                     dotColor: Colors.grey,
//                     activeDotColor: Colors.indigo),
//                 activeIndex: currentIndex,
//                 count: imageList.length,
//               ),
//             ),
//           ]);
//           // );
//         },
//         error: (error, stackTrace) => Text(error.toString()),
//         loading: () => SizedBox(
//               height: 150,
//               width: screenSize.width,
//               child: Shimmer.fromColors(
//                 baseColor: Colors.grey[300]!,
//                 highlightColor: Colors.grey[100]!,
//                 child: Container(
//                   margin: const EdgeInsets.symmetric(horizontal: 12),
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                 ),
//               ),
//             ));
//   }
// }
