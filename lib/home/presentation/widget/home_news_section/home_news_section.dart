import 'package:flutter/material.dart';

import '../../../data/model/features_imagemodel.dart';

class NewsCard extends StatelessWidget {
  const NewsCard({Key? key, required this.e}) : super(key: key);
  final FeaturedImageModel e;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => {},
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 4,
              blurRadius: 9,
              offset: const Offset(11, 3), // changes position of shadow
            ),
          ],
        ),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                constraints:
                    const BoxConstraints(maxHeight: 100, maxWidth: 100),
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(8),
                        bottomLeft: Radius.circular(8)),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(e.featureImage),
                    )),
              ),
              Expanded(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Study in Cananda",
                        overflow: TextOverflow.clip,
                        maxLines: 2,
                        style: Theme.of(context)
                            .textTheme
                            .displayLarge!
                            .copyWith(fontSize: 14),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        "Studying in Canada, colleges, and universities have their own set of admission requirements that students need to meet to get admission.",
                        style: TextStyle(fontSize: 13),
                      )
                    ],
                  ),
                ),
              )
            ]),
      ),
    );
  }
}
