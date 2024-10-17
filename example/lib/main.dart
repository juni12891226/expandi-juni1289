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
          margin: const EdgeInsetsDirectional.only(top: 100),
          child: Expandi(
            expandableChildAnimationMilliSecondsDuration: 500,
            expandableIconAnimationMilliSecondsDuration: 1,
            //optional
            onExpandCollapseCallback: (bool isExpanded) {
              setState(() {
                expanded = !isExpanded;
              });
            },
            marginBetweenExpandableIcon: 40,
            isExpanded: expanded,
            headerContainerDecoration: const BoxDecoration(color: Colors.yellow),
            headerContainerMargin: const EdgeInsetsDirectional.all(40),
            headerContainerPadding: const EdgeInsetsDirectional.all(40),

            headerWidget: const Row(
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


class Expandi extends StatefulWidget {
  ///if widget is expanded or not
  final bool isExpanded;

  ///widget below the header widget
  ///expandable widget
  final Widget expandableChild;

  ///top header
  ///non expandable widget
  final Widget headerWidget;

  ///expandable child animation duration default is 500 ms
  final int expandableChildAnimationMilliSecondsDuration;

  ///icon animation duration default is 300 ms
  final int expandableIconAnimationMilliSecondsDuration;

  ///callback fired, when the widget
  ///change its state from collapse to expand and vice versa
  final Function(bool isExpanded) onExpandCollapseCallback;

  ///margin between the header widget and the icon (if provided)
  final double marginBetweenExpandableIcon;

  ///expandable icon widget can by any widget (icon)
  final Widget? expandableIconWidget;

  final BoxDecoration? headerContainerDecoration;
  final EdgeInsetsDirectional? headerContainerPadding;
  final EdgeInsetsDirectional? headerContainerMargin;

  const Expandi({Key? key,
    this.expandableIconWidget,
    this.headerContainerMargin,
    this.headerContainerPadding,
    this.headerContainerDecoration,
    this.marginBetweenExpandableIcon = 0,
    required this.onExpandCollapseCallback,
    required this.headerWidget,
    required this.isExpanded,
    required this.expandableChild,
    this.expandableChildAnimationMilliSecondsDuration = 1000,
    this.expandableIconAnimationMilliSecondsDuration = 500})
      : super(key: key);

  @override
  State<Expandi> createState() => _ExpandiState();
}

class _ExpandiState extends State<Expandi> with TickerProviderStateMixin {
  late AnimationController controller;
 late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration:  Duration(milliseconds: widget.expandableChildAnimationMilliSecondsDuration),
      vsync: this,
    );
    animation = CurvedAnimation(
      parent: controller,
      curve: Curves.fastLinearToSlowEaseIn,
    );
  }


  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisSize: MainAxisSize.min, mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      GestureDetector(
        onTap: () {
          widget.onExpandCollapseCallback(widget.isExpanded);
          if (animation.status != AnimationStatus.completed) {
            controller.forward();
          } else {
            controller.animateBack(0, duration: Duration(milliseconds: widget.expandableChildAnimationMilliSecondsDuration));
          }
        },
        child: Container(
          decoration: widget.headerContainerDecoration,
          padding: widget.headerContainerPadding,
          margin: widget.headerContainerMargin,
          child: Row(mainAxisSize: MainAxisSize.max, mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.center, children: [
            Expanded(
                child: widget.headerWidget),

            SizedBox(width: widget.marginBetweenExpandableIcon),
            GestureDetector(
                onTap: () {
                  widget.onExpandCollapseCallback(widget.isExpanded);
                },
                child: AnimatedRotation(
                  turns: widget.isExpanded ? 0.5 : 0,
                  duration: Duration(milliseconds: widget.expandableIconAnimationMilliSecondsDuration),
                  child: widget.expandableIconWidget ?? const Icon(Icons.keyboard_arrow_down, size: 16, color: Colors.purple,),
                )),
          ]),
        ),
      ),
      SizeTransition(
        sizeFactor: animation,
        axis: Axis.vertical,
        child:Container(child: widget.expandableChild)
        ),

    ]);
  }
}

