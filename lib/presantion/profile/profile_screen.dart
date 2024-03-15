import 'package:bath_room_app/core/colors/colours.dart';
import 'package:bath_room_app/core/routing/router.dart';
import 'package:bath_room_app/presantion/widgets/custom_switcher.dart';
import 'package:flutter/material.dart';
import '../widgets/custoum_text_filed.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  Image.asset(
                    "assets/beens.png",
                    height: 150,
                  ),
                  const SizedBox(
                    width: 40,
                  ),
                  Flexible(
                    child: Text(
                      "APP NAME?",
                      style: TextStyle(
                          fontSize: 40,
                          color: ConstantsColors.navigationColor,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      Text(
                        "Recently added:",
                        style: TextStyle(
                            fontSize: 25,
                            color: ConstantsColors.navigationColor,
                            fontWeight: FontWeight.bold),
                      ),
                      const Spacer(),
                      Icon(Icons.edit, color: ConstantsColors.navigationColor),
                    ],
                  ),
                  const SizedBox(height: 10),
                  CustomTextField(
                    controller: nameController,
                    hintText: 'user',
                    prefixIcon: Icons.person,
                    readOnly: true,
                  ),
                  const SizedBox(height: 20),
                  CustomTextField(
                    controller: emailController,
                    hintText: 'user@gmail.com',
                    prefixIcon: Icons.email,
                    readOnly: true,
                  ),
                  const SizedBox(height: 10),
                  const CustomSwitcher(title: "Push Notifications"),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: CustomRowButton(
                      title: "Reset Password",
                      onTap: () {},
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: CustomRowButton(
                      title: "My Reviews",
                      onTap: () {
                        Navigator.pushNamed(context, Routes.reviews);
                      },
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            Row(
              children: [
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "Log out",
                    style: TextStyle(
                        color: ConstantsColors.navigationColor, fontSize: 20),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
