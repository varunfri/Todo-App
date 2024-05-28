import 'package:flutter/material.dart';

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        backgroundColor: Colors.yellow[400],
        title: const Text("Info"),
        centerTitle: true,
      ),
      body: Padding(
        padding:const EdgeInsets.all(25),
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 50),
              Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: const DecorationImage(
                    image: AssetImage("lib/images/logo.png"),
                  ),
                ),
              ),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 30),
                  Info(
                    info: "How to use Todo-app",
                    bold: FontWeight.bold,
                    size: 25,
                  ),
                  SizedBox(height: 15),
                  Info(
                    info: "Click '+' to add new task.",
                    size: 20,
                  ),
                  SizedBox(height: 10),
                  Info(
                    info: "Click the checkbox to mark task as complete.",
                    size: 20,
                  ),
                  SizedBox(height: 10),
                  Info(
                    info: "Swipe left to delete task.",
                    size: 20,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Info extends StatelessWidget {
  const Info({
    super.key,
    required this.info,
    this.bold,
    required this.size,
  });
  final String info;
  final double size;
  final FontWeight? bold;

  @override
  Widget build(BuildContext context) {
    return Text(
      info,
      style: TextStyle(
        fontSize: size,
        fontWeight: bold,
      ),
    );
  }
}
