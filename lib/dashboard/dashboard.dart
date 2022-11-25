import 'package:flutter/material.dart';
import 'package:info_dev/home/api_services.dart';
import 'package:info_dev/home/model/user_model.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<UserModel>(
          future: ApiSerivce().getuserData(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final result = snapshot.data!;
              return Column(
                children: [
                  Text(result.page.toString()),
                  Text(result.support.text),
                  ...result.data.map((e) => Text(e.email))
                ],
              );
            } else if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            }
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }),
    );
  }
}
