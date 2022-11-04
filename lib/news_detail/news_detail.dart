import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import '../const/app_config.dart';
import '../home/data/model/blog_model.dart';

class NewsDetailScreen extends StatelessWidget {
  const NewsDetailScreen({super.key, required this.e});
  final BlogModel e;
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(e.title),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                constraints: BoxConstraints(
                    maxHeight: screenSize.height / 4,
                    maxWidth: screenSize.width),
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(8),
                        bottomLeft: Radius.circular(8)),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(AppConfig.mainURL + e.image),
                    )),
              ),
              const SizedBox(
                height: 10,
              ),
              Html(data: e.content)
            ],
          ),
        ),
      ),
    );
  }
}
