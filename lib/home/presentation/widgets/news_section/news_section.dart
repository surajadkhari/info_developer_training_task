import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shimmer/shimmer.dart';

import '../../controller/blog_controller.dart';
import '../home_news_section/home_news_section.dart';

class NewsSection extends ConsumerWidget {
  const NewsSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final result = ref.watch(blogControllerProvider);
    return result.when(
        data: (data) {
          return Column(
            children: [
              ...data.map(
                (e) => NewsCard(
                  e: e,
                ),
              )
            ],
          );
        },
        error: (error, stackTrace) => Text(error.toString()),
        loading: () {
          return Column(
            children: [
              ...List.generate(
                4,
                (index) => Shimmer.fromColors(
                  baseColor: Colors.grey.shade300,
                  highlightColor: Colors.grey.shade100,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(12.0)),
                    margin: const EdgeInsets.all(12.0),
                    height: 100,
                    width: double.infinity,
                  ),
                ),
              )
            ],
          );
        });
  }
}
