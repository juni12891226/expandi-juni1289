A Flutter widget that can expand and collapse with animation

## Features

#### A flutter widget that can:

* Expand
* Collapsed
* Allows you to use a custom header widget
* Allows you to use a custom child widget
* Allows you to add a custom icon to handle expand and collapse

## Additional information

* Easy to use and manage
* You have to use your state management, in order to control the state of the widget
* You can bind this widget with GetX, Provider or any state management you like!

## Basic Setup

```
class MyExpandableWidget extends StatefulWidget {
const MyExpandableWidget({super.key});

@override
State<MyExpandableWidget> createState() => _MyExpandableWidgetState();
}

class _MyExpandableWidgetState extends State<MyExpandableWidget> {
bool expanded = false;

@override
Widget build(BuildContext context) {
return Expandi(
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
child: Row(
mainAxisSize: MainAxisSize.max,
mainAxisAlignment: MainAxisAlignment.start,
crossAxisAlignment: CrossAxisAlignment.start,
children: const [
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
);
}
}
```
