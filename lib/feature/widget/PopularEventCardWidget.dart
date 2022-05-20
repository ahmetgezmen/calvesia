import 'package:calvesia/feature/pages/models/post_model.dart';
import 'package:flutter/material.dart';

import '../../Utils/Style/ColorPalette.dart';

class PopularEventCard extends StatefulWidget {
  final PostModel post;
  const PopularEventCard({Key? key, required this.post}) : super(key: key);

  @override
  State<PopularEventCard> createState() => _PopularEventCardState();
}

class _PopularEventCardState extends State<PopularEventCard> {
  @override
  void didUpdateWidget(covariant PopularEventCard oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.post != widget.post) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    final post = widget.post;
    return Card(
      borderOnForeground: true,
      shadowColor: colorsMatch(post),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      elevation: 5,
      child: Center(
        child: SizedBox(
          width: 250,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                    color: BaseColorPalet.upcomingCardContainer,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(15.0),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                post.date.toString(),
                                style: const TextStyle(color: Colors.grey),
                              ),
                            ],
                          ),
                          Text(
                            post.title.toString(),
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.location_on,
                                  size: 16,
                                  color: BaseColorPalet.linkLabel,
                                ),
                                Text(
                                  post.location.toString(),
                                  style: const TextStyle(
                                    color: BaseColorPalet.linkLabel,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          SizedBox(
                            height: 20,
                            width: 70,
                            child: Text(post.price.toString() + " TL"),
                          ),
                          Text(post.time.toString()),
                        ],
                      ),
                    ],
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

MaterialColor? colorsMatch(PostModel post) {
  switch (post.category.toString()) {
    case "party":
      return BaseColorPalet.partyColor;
    case "career":
      return BaseColorPalet.careerColor;
    case "health":
      return BaseColorPalet.healthColor;
    case "education":
      return BaseColorPalet.educationColor;
  }
  return null;
}
