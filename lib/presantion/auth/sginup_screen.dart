import 'package:bath_room_app/core/colors/colours.dart';
import 'package:bath_room_app/core/network/app_constants.dart';
import 'package:bath_room_app/core/routing/router.dart';
import 'package:bath_room_app/presantion/auth/login_screen.dart';
import 'package:bath_room_app/presantion/widgets/snak_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/controllers/auth/auth_controller.dart';
import '../../core/validators/vaildation.dart';
import '../widgets/custom_button.dart';
import '../widgets/custoum_text_filed.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key});

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        AppConstants.imageBeens,
                        height: 150,
                      ),
                      const SizedBox(width: 40),
                      Flexible(
                        child: Text(
                          "CREATE ACCOUNT",
                          style: TextStyle(
                              fontSize: 35,
                              color: ConstantsColors.navigationColor,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 13,
                          ),
                          child: Text(
                            'Enter display name',
                            style: TextStyle(
                                color: ConstantsColors.navigationColor,
                                fontSize: 19,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                        const SizedBox(height: 5),
                        CustomTextField(
                          controller: nameController,
                          validator: validateName,
                          prefixIcon: Icons.person,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 13,
                          ),
                          child: Text(
                            'Enter your email',
                            style: TextStyle(
                                color: ConstantsColors.navigationColor,
                                fontSize: 19,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                        const SizedBox(height: 5),
                        CustomTextField(
                          controller: emailController,
                          validator: validateEmail,
                          prefixIcon: Icons.email_outlined,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 13,
                          ),
                          child: Text(
                            'Enter password',
                            style: TextStyle(
                                color: ConstantsColors.navigationColor,
                                fontSize: 19,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                        const SizedBox(height: 5),
                        CustomTextField(
                          controller: passwordController,
                          validator: validatePassword,
                          prefixIcon: Icons.password,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 13,
                          ),
                          child: Text(
                            'Confirm password',
                            style: TextStyle(
                                color: ConstantsColors.navigationColor,
                                fontSize: 19,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                        const SizedBox(height: 5),
                        CustomTextField(
                          controller: confirmController,
                          validator: (confirm) {
                            return validateConfirmPassword(
                                passwordController.text, confirm);
                          },
                          prefixIcon: Icons.password,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  CustomButton(
                    text: "Create account",
                    width: 200,
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        formKey.currentState!.save();
                        final res = await Provider.of<AuthController>(context,
                                listen: false)
                            .register(context,
                                displayName: nameController.text,
                                email: emailController.text,
                                password: passwordController.text);
                        if (res) {
                          Navigator.pushNamed(context, Routes.login);
                          showSnackBar(context,
                              text: "user created successfully",
                              color: Colors.green);
                        } else {
                          showSnackBar(context,
                              text: "something went wrong", color: Colors.red);
                        }
                      }
                    },
                  ),
                  const SizedBox(height: 30),
                  CustomButton(
                    text: "LOGIN",
                    width: 200,
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, Routes.login);
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
