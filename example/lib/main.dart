import 'package:expandi_juni1289/expandi_juni1289.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool expanded = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsetsDirectional.only(top: 100),
        child: Expandi(
          expandableChildAnimationMilliSecondsDuration: 300,//optional
          onExpandCollapseCallback: (bool isExpanded) {
            setState(() {
              expanded = !isExpanded;
            });
          },
          isExpanded: expanded,
          headerWidget: Container(
            padding: const EdgeInsets.only(top: 20, bottom: 20, right: 20),
            margin: const EdgeInsets.only(left: 20, right: 20),
            color: Colors.black,
            child: const Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                    child: Text(
                      "Expand",
                      style: TextStyle(color: Colors.white),
                      textAlign: TextAlign.end,
                    ))
              ],
            ),
          ),
          expandableChild: Container(
            padding: const EdgeInsets.only(top: 20, bottom: 20, left: 12, right: 12),
            margin: const EdgeInsets.only(left: 20, right: 20),
            color: Colors.blue,
            child: const Text(
              "Hello world, greetings from the expandi, this would be a long journey!",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      )
    );
  }
}
