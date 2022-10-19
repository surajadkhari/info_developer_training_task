import 'package:flutter/material.dart';
import 'package:info_dev/const/app_const.dart';
import 'package:info_dev/dashboard/model/movie_model.dart';
import 'package:info_dev/dashboard/service/api_service.dart';

import '../../core/api_exception.dart';
import 'component/movie_card.dart';

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
      body: FutureBuilder<List<MovieModel>>(
        future: _future,
        builder: (context, snapData) {
          if (snapData.hasData) {
            return SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ...snapData.data!.map((e) => MovieCard(
                            e: e,
                          ))
                    ]),
              ),
            );
          } else if (snapData.hasError) {
            if (snapData.hasError is ApiException) {
              return errorText(error: '${snapData.error}');
            }
            return errorText(error: "Oops, something unexpected happened");
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  Widget errorText({required String error}) {
    return Center(child: Text(error));
  }
}
