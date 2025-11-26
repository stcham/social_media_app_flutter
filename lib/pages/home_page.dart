import 'package:flutter/material.dart';
import '../components/my_botton_nav_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("HomePage")),
      bottomNavigationBar: MyBottonNavBar(),
    );
  }
}
