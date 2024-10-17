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
       Expandi(
        expandableChildAnimationMilliSecondsDuration: 500,
        expandableIconAnimationMilliSecondsDuration: 500,
        //optional
        onExpandCollapseCallback: (bool isExpanded) {
          setState(() {
            expanded = !isExpanded;
          });
        },
        //added rotating icon here
        expandableIconWidget: const Icon(Icons.keyboard_arrow_down,size: 40,color: Colors.red,),
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
          padding:
              const EdgeInsets.only(top: 20, bottom: 20, left: 12, right: 12),
          margin: const EdgeInsets.only(left: 20, right: 20),
          color: Colors.blue,
          child: const Text(
            "Hello world, greetings from the expandi, this would be a long journey!",
            style: TextStyle(color: Colors.white),
          ),
        ),
      )
```

## Constructor Example

```
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
```

