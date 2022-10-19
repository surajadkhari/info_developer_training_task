import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:info_dev/dashboard/model/movie_model.dart';
import 'package:info_dev/utils/normalnavigation.dart';

import '../movie_detail.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({Key? key, required this.e}) : super(key: key);
  final MovieModel e;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => letsgo(context: context, screen:  MovieDetailScreen(movieData:e ,)),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
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
                      image: NetworkImage(e.fullImageUrl),
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
                        e.movieName,
                        overflow: TextOverflow.clip,
                        maxLines: 2,
                        style: Theme.of(context)
                            .textTheme
                            .headline6!
                            .copyWith(fontSize: 18),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text("Release Date :${e.realeaseDate}")
                    ],
                  ),
                ),
              )
            ]),
      ),
    );
  }
}
