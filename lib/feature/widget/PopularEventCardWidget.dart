import 'package:flutter/material.dart';

import '../../Utils/Style/ColorPalette.dart';

class PopularEventCard extends StatefulWidget {
  final double? cardWidth;
  final Color? shadowColor;
  final String title;
  PopularEventCard({Key? key, required this.title, this.shadowColor, this.cardWidth}) : super(key: key);

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
      shadowColor: Colors.black ?? widget.shadowColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      elevation: 5,
      child: Center(
        child: SizedBox(
          width: 250 ?? widget.cardWidth,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      color: BaseColorPalet.UpcomingCardContainer,
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(15.0))),
                ),
              ),
              Expanded(
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("17th July, 2021", style: TextStyle(
                                color: Colors.grey
                            ),),
                            Text(
                              widget.title,
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                            Row(
                              children: const [
                                Icon(Icons.location_on, size: 16, color: BaseColorPalet.LinkLabel,),
                                Text("Caracas, Venezuela", style: TextStyle(
                                    color: BaseColorPalet.LinkLabel
                                ),),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                          const SizedBox(
                              height: 20, width: 70, child: Placeholder(),),
                        Text("10:00pm"),
                        ],),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
