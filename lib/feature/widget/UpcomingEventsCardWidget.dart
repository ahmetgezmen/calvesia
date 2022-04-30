import 'package:calvesia/Utils/Style/ColorPalette.dart';
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
        ),
        elevation: 5,
        child: Row(
          children: <Widget>[
            SizedBox(
              height: 100,
              width: 100,
              child: Container(
                decoration: BoxDecoration(
                    color: BaseColorPalet.UpcomingCardContainer,
                    borderRadius: BorderRadius.circular(15.0)),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text(
                      widget.title,
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Row(
                      children: const <Widget>[
                        Expanded(
                          child: Text(
                            "23k",
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                        Icon(Icons.favorite, color: Colors.grey, size: 16,),
                        Text(
                          "3000",
                          style: TextStyle(color: Colors.grey),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5.0,top: 5.0 , bottom: 5.0),
                    child: Row(
                      children: const [
                        Icon(Icons.location_on, size: 16, color: BaseColorPalet.LinkLabel,),
                        Text("Caracas, Venezuela", style: TextStyle(
                            color: BaseColorPalet.LinkLabel
                        ),),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5.0, bottom: 5.0),
                    child: const SizedBox(height: 20, width: 70, child: Placeholder()),
                  )
                ],
              ),
            ),
            Column(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.favorite_outline),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.arrow_forward),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
