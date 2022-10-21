import 'package:flutter/material.dart';
import 'package:info_dev/dashboard/service/api_client.dart';
import 'package:intl/intl.dart';

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

  void dimisskeyBoard() {
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus) {
      return currentFocus.unfocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: dimisskeyBoard,
      child: Scaffold(
        appBar: AppBar(),
        body: Form(
          key: _formKey,
          child: Center(
            child: SingleChildScrollView(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              child: Column(
                children: [
                  const Text("Post Data"),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        hintText: "Name",
                        fillColor: Colors.grey.withOpacity(0.2),
                        hintStyle:
                            TextStyle(color: Colors.grey.withOpacity(0.9)),
                        filled: true,
                      ),
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
                      textInputAction: TextInputAction.done,
                      decoration: InputDecoration(
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        hintStyle:
                            TextStyle(color: Colors.grey.withOpacity(0.9)),
                        hintText: "Job",
                        fillColor: Colors.grey.withOpacity(0.2),
                        filled: true,
                      ),
                      controller: jobController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter job';
                        }
                        return null;
                      },
                    ),
                  ),
                  AspectRatio(
                    aspectRatio: 12 / 2,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: ElevatedButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            var data = UserRequesttModel(
                                userjob: jobController.text,
                                username: nameController.text);

                            var result = await ApiService().createUser(
                              userModel: data.toJson(),
                            );

                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                content: Container(
                                  height: 128,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(0),
                                    color: Colors.white,
                                  ),
                                  child: Column(
                                    children: [
                                      const Text(
                                          "You have successfully send data"),
                                      ListTile(
                                        title: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text('ID: ${result.id}'),
                                            Text("Name : ${result.name}"),
                                            Text("Job  ${result.job}"),
                                            Text(
                                                "Created at${DateFormat("dd MMMM yyy").format(result.createdAt)}")
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }
                        },
                        child: const Text("Submit"),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

