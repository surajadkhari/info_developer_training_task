import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:info_dev/const/app_config.dart';
import 'package:info_dev/home/data/model/blog_model.dart';
import 'package:info_dev/utils/normalnavigation.dart';

import '../../../../news_detail/news_detail.dart';

class NewsCard extends StatelessWidget {
  const NewsCard({Key? key, required this.e}) : super(key: key);
  final BlogModel e;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => {letsgo(context: context, screen: NewsDetailScreen(e: e))},
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
                      image: NetworkImage(AppConfig.mainURL + e.image),
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
                        e.title,
                        overflow: TextOverflow.clip,
                        maxLines: 2,
                        style: Theme.of(context)
                            .textTheme
                            .headline3!
                            .copyWith(fontSize: 14),
                      ),
                      // const SizedBox(
                      //   height: 10,
                      // ),
                      Html(
                        data: e.content,
                        // overflow: TextOverflow.clip,
                        // maxLines: 2,
                        // style: const TextStyle(fontSize: 13),
                        style: {
                          'p': Style(
                              maxLines: 2, textOverflow: TextOverflow.ellipsis),
                        },
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
