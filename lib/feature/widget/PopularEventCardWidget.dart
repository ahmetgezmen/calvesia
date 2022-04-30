import 'package:flutter/material.dart';

class PopularEventCard extends StatefulWidget {
  final String title;
  PopularEventCard({Key? key, required this.title}) : super(key: key);

  @override
  State<PopularEventCard> createState() => _PopularEventCardState();
}

class _PopularEventCardState extends State<PopularEventCard> {
  @override
  void didUpdateWidget(covariant PopularEventCard oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.title != widget.title) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Center(
        child: SizedBox(
          width: 250,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Text(widget.title)],
          ),
        ),
      ),
    );
  }
}
