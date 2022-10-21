import 'package:flutter/material.dart';

class LoginScreen2 extends StatefulWidget {
  const LoginScreen2({Key? key}) : super(key: key);

  @override
  State<LoginScreen2> createState() => _LoginScreen2State();
}

class _LoginScreen2State extends State<LoginScreen2> {
  bool hidePassword = true;
  int count = 11;
   validpassword({required value}) {
    if (value == null) {
      return "Password is required";
    }
    if (value.length < 5) {
      return "Password must be more than 5 character";
    }
    return null;
  }

   validEmail({required value}) {
    bool checkEmail = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(value);
    if (checkEmail == false) {
      return "Please enter your email gain";
    }
    return null;
  }

void checkoscure(){
      hidePassword = !hidePassword;
                      print(hidePassword);
                      setState(() {});
}


  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login ")),
      body: Form(
        key: formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                onFieldSubmitted: (data) {
                  print("----------on submitted called-------");
                  print(data);
                },
                // onChanged: (value){
                //   print(value);
                // },

                validator: (val) =>validEmail(value: val),
                  
                autofocus: true,
                textInputAction: TextInputAction.send,
                decoration: InputDecoration(
                  hintText: "Enter your Email",
                  labelText: "Email",
                  prefixIcon: const Icon(Icons.email),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(32.0)),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green, width: 3),
                  ),
                  focusedErrorBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red, width: 3),
                  ),
                  errorBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red, width: 3),
                  ),
                  enabledBorder: const OutlineInputBorder(),
                  disabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.yellow),
                  ),
                ),
              ),
              TextFormField(
                obscureText: hidePassword,
                validator: (val) => validpassword(value: val),
                decoration: InputDecoration(
                  hintText: "Enter Password",
                  prefixIcon: const Icon(Icons.lock),
                  suffixIcon: InkWell(
                    onTap: checkoscure,
                    child: Icon(
                      hidePassword == true
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              MaterialButton(
                onPressed: () {
                  if (formKey.currentState != null) {
                    formKey.currentState!.save();
                    bool isValid = formKey.currentState!.validate();
                  }
                },
                color: Colors.blue,
                child: const Text(
                  "SIGN IN",
                  style: TextStyle(color: Colors.white),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
