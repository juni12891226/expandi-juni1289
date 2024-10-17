import 'package:flutter/material.dart';

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

  ///padding to the end of header widget
  final double headerWidgetEndPadding;

  const Expandi(
      {Key? key,
      this.expandableIconWidget,
      this.marginBetweenExpandableIcon = 0,
      required this.onExpandCollapseCallback,
      required this.headerWidget,
      required this.isExpanded,
      required this.expandableChild,
      this.expandableChildAnimationMilliSecondsDuration = 850,
      this.expandableIconAnimationMilliSecondsDuration = 500,
      this.headerWidgetEndPadding = 0})
      : super(key: key);

  @override
  State<Expandi> createState() => _ExpandiState();
}

class _ExpandiState extends State<Expandi> with SingleTickerProviderStateMixin {
  AnimationController? _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: widget.expandableIconAnimationMilliSecondsDuration),
      upperBound: 0.5,
    );
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisSize: MainAxisSize.min, mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      Row(mainAxisSize: MainAxisSize.max, mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.center, children: [
        Expanded(
            child: GestureDetector(
                onTap: () {
                  widget.onExpandCollapseCallback(widget.isExpanded);
                },
                child: widget.headerWidget)),

          SizedBox(width: widget.marginBetweenExpandableIcon),
          GestureDetector(
              onTap: () {
                widget.onExpandCollapseCallback(widget.isExpanded);
              },
              child: AnimatedRotation(
                turns: widget.isExpanded ? 0.5 : 0,
                duration:  Duration(milliseconds:widget.expandableIconAnimationMilliSecondsDuration),
                child: widget.expandableIconWidget??const Icon(Icons.keyboard_arrow_down,size: 16,color: Colors.purple,),
              )),
          SizedBox(width: widget.headerWidgetEndPadding)

      ]),
      AnimatedSize(
          duration: Duration(milliseconds: widget.expandableChildAnimationMilliSecondsDuration),
          curve: Curves.fastOutSlowIn,
          child: widget.isExpanded ? widget.expandableChild : const SizedBox(height: 0, width: 0))
    ]);
  }
}
