import 'package:flutter/material.dart';
import 'package:swara/components/drawer.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("This is America"),
          backgroundColor: Theme.of(context).colorScheme.inversePrimary),
      drawer: CustomDrawer(),
    );
  }
}
