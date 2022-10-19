import 'package:flutter/material.dart';
import 'package:info_dev/const/app_const.dart';
import 'package:info_dev/dashboard/model/movie_model.dart';
import 'package:info_dev/dashboard/service/api_service.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  Future<List<MovieModel>>? _future;
  @override
  void initState() {
    _future = ApiRepo().gePopularMovielist();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppConst.appBarTitle),
      ),
      body: SingleChildScrollView(
        child: FutureBuilder<List<MovieModel>>(
          future: _future,
          builder: (context, snapData) {
            if (snapData.hasData) {
              return SingleChildScrollView(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ...snapData.data!.map((e) => Container(
                            margin: const EdgeInsets.symmetric(
                                vertical: 8, horizontal: 8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.1),
                                  spreadRadius: 4,
                                  blurRadius: 9,
                                  offset: const Offset(
                                      11, 3), // changes position of shadow
                                ),
                              ],
                            ),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    constraints: const BoxConstraints(
                                        maxHeight: 100, maxWidth: 100),
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(e.fullImageUrl),
                                    )),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 14, vertical: 10),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
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
                                          Text(
                                              "Release Date :${e.realeaseDate}")
                                        ],
                                      ),
                                    ),
                                  )
                                ]),
                          ))
                    ]),
              );
            } else if (snapData.hasError) {
              return Text(snapData.error.toString());
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
