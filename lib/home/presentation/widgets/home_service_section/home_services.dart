import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:info_dev/const/app_config.dart';
import 'package:shimmer/shimmer.dart';

import '../../controller/home_featured_services_controller.dart';

class HomeServiceSection extends ConsumerWidget {
  const HomeServiceSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Size screenSize = MediaQuery.of(context).size;
    final result = ref.watch(homefeaturedServiceControllerProvider);
    return result.when(
        data: (data) {
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                ...data.map(
                  (e) => Container(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 4,
                    ),
                    height: screenSize.height * 0.26,
                    width: screenSize.height * 0.2,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10)),
                    ),
                    child: Column(
                      children: [
                        Container(
                          height: screenSize.height * 0.18,
                          width: screenSize.width,
                          decoration: BoxDecoration(
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10),
                              ),
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: CachedNetworkImageProvider(
                                      AppConfig.mainURL + e.image))),
                        ),
                        Container(
                          alignment: Alignment.center,
                          height: screenSize.height * 0.25 -
                              screenSize.height * 0.18,
                          decoration: const BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Color.fromARGB(255, 218, 218, 218),
                                blurRadius: 4.0, // soften the shadow
                                spreadRadius: 0.0, //extend the shadow
                                offset: Offset(
                                  0.0, // Move to right 10  horizontally
                                  8.0, // Move to bottom 10 Vertically
                                ),
                              )
                            ],
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10),
                            ),
                          ),
                          child: Text(e.title),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        },
        error: (error, stackTrace) => Text(error.toString()),
        loading: () =>
            // const CircularProgressIndicator.adaptive(),
            SizedBox(
              height: screenSize.height * 0.15,
              width: screenSize.width,
              child: Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: Builder(builder: (context) {
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  );
                }),
              ),
            ));
  }
}
