import 'package:flutter/cupertino.dart';

import '../../../data/model/features_imagemodel.dart';
import '../home_news_section/home_news_section.dart';

class NewsSection extends StatelessWidget {
  const NewsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...imageList.map(
          (e) => NewsCard(
            e: e,
          ),
        )
      ],
    );
  }
}
