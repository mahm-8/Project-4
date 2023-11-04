import 'package:flutter/material.dart';
import 'package:store_watch/data/global.dart';
import 'package:store_watch/widgets/praimery_button.dart';
import 'package:store_watch/widgets/profile_text_filed.dart';
import 'package:badges/badges.dart' as badges;
//3
class Profile extends StatefulWidget {
  Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  TextEditingController nameContrler =
      TextEditingController(text: currentCustomer.name);
  TextEditingController mobileContrler = TextEditingController();
  TextEditingController emailContrler =
      TextEditingController(text: currentCustomer.email);
  TextEditingController passwordContrler =
      TextEditingController(text: currentCustomer.password);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const Icon(
          Icons.keyboard_arrow_left_rounded,
          color: Colors.black,
          size: 32,
        ),
        title: const Text(
          "My Profile",
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 16,
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.only(top: 32, bottom: 32),
                child: badges.Badge(
                  badgeAnimation: const badges.BadgeAnimation.fade(),
                  badgeStyle: const badges.BadgeStyle(
                    badgeColor: Color(0xfffcc873),
                  ),
                  badgeContent: const Icon(Icons.photo_camera_outlined),
                  child: ClipOval(
                    child: Image.asset(
                      "assets/profile_image.jpeg",
                      width: 100,
                    ),
                  ),
                ),
              ),
            ),
            ProfileTextFiled(
              hint: 'Name',
              labelText: 'Name',
              isPassword: false,
              controller: nameContrler,
            ),
            ProfileTextFiled(
              hint: 'Mobile Number',
              labelText: 'Mobile Number',
              isPassword: false,
              controller: mobileContrler,
            ),
            ProfileTextFiled(
              hint: 'Email Address',
              labelText: 'Email Address',
              isPassword: false,
              controller: emailContrler,
            ),
            ProfileTextFiled(
              hint: 'Password',
              labelText: 'Password',
              isPassword: true,
              icon: Icons.lock_outlined,
              controller: passwordContrler,
            ),
            SizedBox(
              height: 24,
            ),
            PraimeryButton(
                buttonTitle: "Update",
                onPressed: () {
                  if (nameContrler.text.isNotEmpty &&
                      mobileContrler.text.isNotEmpty &&
                      emailContrler.text.isNotEmpty &&
                      passwordContrler.text.isNotEmpty) {
                    currentCustomer.name = nameContrler.text;
                    currentCustomer.mobileNumber =
                        int.parse(mobileContrler.text);
                    currentCustomer.email = emailContrler.text;
                    currentCustomer.password = passwordContrler.text;

                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text(
                          "Your profile was successfully updated",
                        ),
                        backgroundColor: Color(0xff85e62c),
                        padding: EdgeInsets.only(top: 32, left: 16)));
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text(
                          "Please complete all fields",
                        ),
                        backgroundColor: Color(0xffff8989),
                        padding: EdgeInsets.only(top: 32, left: 16)));
                  }
                })
          ],
        ),
      ),
    );
  }
}
