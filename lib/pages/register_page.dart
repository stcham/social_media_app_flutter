import 'package:flutter/material.dart';
import 'package:social_media_app/components/my_button.dart';
import 'package:social_media_app/components/my_textfield.dart';
import 'package:social_media_app/models/social_app_database.dart';

import 'home_page.dart';

class RegisterPage extends StatelessWidget {
  final void Function()? onTap;

  RegisterPage({super.key, required this.onTap});

  final TextEditingController userNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  final SocialAppDatabase db = SocialAppDatabase();

  /// ✅ Register new user
  Future<void> registeruser(dynamic context) async {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    String confirmPassword = confirmPasswordController.text.trim();

    if (email.isEmpty || password.isEmpty || confirmPassword.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please fill in all fields")),
      );
      return;
    }

    if (password != confirmPassword) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Passwords do not match")));
      return;
    }

    // ✅ Create user in database
    await db.createUser(email, password);

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text("Registration successful")));

    // ✅ Go to Home Page
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const HomePage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.person,
              size: 80,
              color: Theme.of(context).colorScheme.inverseSurface,
            ),
            const SizedBox(height: 25),

            const Text("M I N I M A L", style: TextStyle(fontSize: 20)),
            MyTextfield(
              hintText: "UserName",
              obscureText: false,
              controller: userNameController,
              prefixIcon: Icons.person_search_sharp,
            ),
            const SizedBox(height: 10),

            MyTextfield(
              hintText: "Email",
              obscureText: false,
              controller: emailController,
              prefixIcon: Icons.email,
              keyboardType: TextInputType.emailAddress,
            ),

            const SizedBox(height: 10),

            MyTextfield(
              hintText: "Password",
              obscureText: true,
              controller: passwordController,
              prefixIcon: Icons.lock,
            ),

            const SizedBox(height: 10),

            MyTextfield(
              hintText: "Confirm Password",
              obscureText: true,
              controller: confirmPasswordController,
              prefixIcon: Icons.lock_reset_rounded,
            ),

            const SizedBox(height: 20),

            MyButton(
              text: "Register",
              icon: Icons.login,
              onPressed: () {
                registeruser(context);
              },
            ),
            const SizedBox(height: 27),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have an account? ",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                ),
                GestureDetector(
                  onTap: onTap,
                  child: Text(
                    "LOGIN HERE",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
