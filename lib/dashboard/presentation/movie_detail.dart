import 'package:flutter/material.dart';

import '../model/movie_model.dart';

class MovieDetailScreen extends StatelessWidget {
  const MovieDetailScreen({super.key, required this.movieData});
  final MovieModel movieData;
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(movieData.movieName),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                constraints: BoxConstraints(
                    maxHeight: screenSize.height * 0.3,
                    maxWidth: screenSize.width),
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(8),
                        bottomLeft: Radius.circular(8)),
                    image: DecorationImage(
                      fit: BoxFit.contain,
                      image: NetworkImage(
                        movieData.fullImageUrl,
                      ),
                    )),
              ),
              ListTile(
                contentPadding: EdgeInsets.zero,
                title: Text(movieData.movieName),
                subtitle: Text(movieData.realeaseDate),
              ),
              Text(movieData.overView,
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium!
                      .copyWith(fontSize: 16)),
              Text(movieData.rating.toString())
            ],
          ),
        ),
      ),
    );
  }
}
