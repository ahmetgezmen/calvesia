import 'package:flutter/material.dart';

class UpcomingEventsCardWidget extends StatefulWidget {
  final String title;
  UpcomingEventsCardWidget({Key? key, required this.title}) : super(key: key);

  @override
  State<UpcomingEventsCardWidget> createState() => _UpcomingEventsCardWidgetState();
}

class _UpcomingEventsCardWidgetState extends State<UpcomingEventsCardWidget> {

 @override
  void didUpdateWidget(covariant UpcomingEventsCardWidget oldWidget) {
   super.didUpdateWidget(oldWidget);
   if (oldWidget.title != widget.title) {
     setState(() {});
   }
  }

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(left: 40, right: 40, top: 20),
      child: Card(
        elevation: 5,
        child: Center(
          child: Text(widget.title),
        ),
      ),
    );
  }
}
