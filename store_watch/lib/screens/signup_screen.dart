// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:store_watch/data/global.dart';
import 'package:store_watch/models/customer.dart';
import 'package:store_watch/screens/signin_screen.dart';
import 'package:store_watch/widgets/button_text.dart';
import 'package:store_watch/widgets/header.dart';
import 'package:store_watch/widgets/praimery_button.dart';
import 'package:store_watch/widgets/glass_text_filde.dart';

//5
class SignUp extends StatelessWidget {
  SignUp({super.key});
  TextEditingController userNameOremailContrler = TextEditingController();
  TextEditingController nameContrler = TextEditingController();
  TextEditingController passwordContrler = TextEditingController();
  bool isFound = false;
  late String email;
  late String userName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
            top: 140,
            left: 200,
            child: Container(
              child: Image.asset(
                "assets/watch_login.png",
                width: 200,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.2,
                    ),
                    Image.asset(
                      "assets/ads_logo.png",
                      width: 100,
                      height: 100,
                    ),
                    const SizedBox(
                      height: 28,
                    ),
                    const Header(
                        title: "Let's Sign up",
                        subTitle: "Let's sign up to get rewards."),
                    const SizedBox(height: 4),
                    GlassTextFiled(
                      hint: "Enter Username or Email",
                      labelText: "Username or Email",
                      icon: Icons.email_outlined,
                      isPassword: false,
                      controller: userNameOremailContrler,
                    ),
                    const SizedBox(height: 4),
                    GlassTextFiled(
                      hint: "Enter Name Here",
                      labelText: "Full Name",
                      icon: Icons.person_outlined,
                      isPassword: false,
                      controller: nameContrler,
                    ),
                    const SizedBox(height: 4),
                    GlassTextFiled(
                      hint: "Enter Password",
                      labelText: "Password",
                      icon: Icons.lock_outline,
                      isPassword: true,
                      controller: passwordContrler,
                    ),
                    Padding(
                        padding: const EdgeInsets.only(top: 12, bottom: 14),
                        child: PraimeryButton(
                            buttonTitle: "Sign Up",
                            onPressed: () {
                              if (userNameOremailContrler.text.isNotEmpty &&
                                  nameContrler.text.isNotEmpty &&
                                  passwordContrler.text.isNotEmpty) {
                                print("1");
                                if (nameContrler.text.length > 2) {
                                  print("2");
                                  if (userNameOremailContrler.text
                                          .contains('@') &&
                                      userNameOremailContrler.text
                                          .endsWith('.com')) {
                                    email = userNameOremailContrler.text;
                                    userName = "null";
                                    print("email $email");
                                    print("3");
                                  } else {
                                    email = "null";
                                    userName = userNameOremailContrler.text;
                                    print("here name $userName");
                                    print("4");
                                  }

                                  for (var customer in customerList) {
                                    print(customer.email);
                                    if (customer.email == email ||
                                        customer.userName == userName) {
                                      isFound = true;
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(const SnackBar(
                                        content: Text(
                                            "This email or userName already used "),
                                        backgroundColor: Color(0xffFF7779),
                                      ));
                                    }
                                  }
                                  if (!isFound) {
                                    Customer newCustomer = Customer(
                                      userName: userName,
                                      email: email,
                                      name: nameContrler.text,
                                      password: passwordContrler.text,
                                    );

                                    customerList.add(newCustomer);
                                    print("6");
                                    print(customerList.length);
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => SignInUp(),
                                        ));
                                  }
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text(
                                        "Please enter correct name",
                                      ),
                                      backgroundColor: Color(0xffff8989),
                                      padding:
                                          EdgeInsets.only(top: 32, left: 16),
                                    ),
                                  );
                                }
                              } else {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(const SnackBar(
                                  content: Text("Please complete all fields"),
                                  padding: EdgeInsets.only(top: 32, left: 16),
                                  backgroundColor: Color(0xffff8989),
                                ));
                              }
                            })),
                    const SizedBox(height: 32),
                    ButtonText(
                      title: "Joined us before?",
                      titleButton: " Sign in",
                      onTap: () => Navigator.push(context,
                          MaterialPageRoute(builder: (context) => SignInUp())),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}







/*
  final GlobalKey<FlutterPwValidatorState> validatorKey =
      GlobalKey<FlutterPwValidatorState>();
 FlutterPwValidator(
                        key: validatorKey,
                        controller: passwordContrler,
                        minLength: 8,
                        uppercaseCharCount: 2,
                        lowercaseCharCount: 3,
                        numericCharCount: 3,
                        specialCharCount: 1,
                        normalCharCount: 3,
                        width: 320,
                        height: 320,
                        onSuccess: () {
                          print("MATCHED");
                          ScaffoldMessenger.of(context).showSnackBar(
                              new SnackBar(
                                  content: new Text("Password is matched")));
                        },
                        onFail: () {
                          print("NOT MATCHED");
                        },
                      ),
                      */