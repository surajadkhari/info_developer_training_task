import 'package:flutter/material.dart';
import 'package:info_dev/dashboard/service/api_client.dart';

import 'model/request_model.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController nameController;
  late TextEditingController jobController;

  @override
  void initState() {
    nameController = TextEditingController();
    jobController = TextEditingController();
  }

  @override
  void dispose() {
    nameController.dispose();
    jobController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        key: _formKey,
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: const InputDecoration(hintText: "Name"),
                  controller: nameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter your name";
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: const InputDecoration(hintText: "Job"),
                  controller: jobController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter job';
                    }
                    return null;
                  },
                ),
              ),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    var data = UserRequesttModel(
                        userjob: jobController.text,
                        username: nameController.text);

                    await ApiService().createUser(
                      userModel: data.sendData(),
                    );
                  }
                },
                child: const Text("Submit"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
