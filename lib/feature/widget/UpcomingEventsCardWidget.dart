import 'package:flutter/material.dart';

class UpcomingEventsCardWidget extends StatefulWidget {
  final String title;
  UpcomingEventsCardWidget({Key? key, required this.title}) : super(key: key);

  @override
  State<UpcomingEventsCardWidget> createState() =>
      _UpcomingEventsCardWidgetState();
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
    return Padding(
      padding: const EdgeInsets.only(left: 40, right: 40, top: 20),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),        elevation: 5,
        child: Row(
          children: <Widget>[
            SizedBox(
              height: 100,
              width: 100,
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xffd966a5),
                  borderRadius: BorderRadius.circular(15.0)
                ) ,
              ),
            )
          ],
        ),
      ),
    );
  }
}
