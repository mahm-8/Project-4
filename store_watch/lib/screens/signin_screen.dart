import 'package:flutter/material.dart';
import 'package:store_watch/data/global.dart';
import 'package:store_watch/screens/navi_bar.dart';
import 'package:store_watch/screens/signup_screen.dart';
import 'package:store_watch/widgets/button_text.dart';
import 'package:store_watch/widgets/header.dart';
import 'package:store_watch/widgets/glass_text_filde.dart';
import 'package:store_watch/widgets/image_button.dart';
import 'package:store_watch/widgets/praimery_button.dart';

//4
class SignInUp extends StatefulWidget {
  const SignInUp({super.key});

  @override
  State<SignInUp> createState() => _SignInUpState();
}

class _SignInUpState extends State<SignInUp> {
  TextEditingController userNameOremailContrler = TextEditingController();

  TextEditingController passwordContrler = TextEditingController();

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
                        title: "Let's Sign in",
                        subTitle: "Fill the details below to continue."),
                    const SizedBox(height: 8),
                    GlassTextFiled(
                      hint: "Enter Username or Email",
                      labelText: "Username or Email",
                      icon: Icons.email_outlined,
                      isPassword: false,
                      controller: userNameOremailContrler,
                    ),
                    GlassTextFiled(
                      hint: "Enter Password",
                      labelText: "Password",
                      icon: Icons.lock_outline,
                      isPassword: true,
                      controller: passwordContrler,
                    ),
                    const Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        "Forgot Password?",
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Color(0xff364c75)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 12, bottom: 14),
                      child: PraimeryButton(
                        buttonTitle: "Sign in",
                        onPressed: () {
                          for (var customer in customerList) {
                            print(customer.userName);
                            if (customer.userName ==
                                    userNameOremailContrler.text ||
                                customer.email ==
                                        userNameOremailContrler.text &&
                                    customer.password ==
                                        passwordContrler.text) {
                              currentCustomer = customer;
                              print("2");

                              /*Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Profile(),
                                ),
                                (route) => false,
                              );   ;*/

                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const NaviBar(),
                                  ));
                            }
                            return;
                          }
//
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                  "Please enter correct username or email"),
                              backgroundColor: Color(0xffff8989),
                              padding: EdgeInsets.only(top: 32, left: 16),
                            ),
                          );
                        },
                      ),
                    ),
                    const Align(
                      alignment: Alignment.center,
                      child: Text("OR",
                          style: TextStyle(fontWeight: FontWeight.w600)),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 12, bottom: 14),
                      child: ImageButton(),
                    ),
                    ButtonText(
                      title: "New To ADS Watch",
                      titleButton: " Sign up",
                      onTap: () => Navigator.push(context,
                          MaterialPageRoute(builder: (context) => SignUp())),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
