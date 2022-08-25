import 'package:calvesia/Utils/Style/color_palette.dart';
import 'package:calvesia/feature/pages/services/image_services.dart';
import 'package:flutter/material.dart';

class EventPageComponent extends StatelessWidget {
  final List indexs;
  final String postKey;
  final String title;
  const EventPageComponent(
      {Key? key,
      required this.postKey,
      required this.title,
      required this.indexs})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Text(
            title,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        SizedBox(
          height: 100.0,
          child: Row(
            children: <Widget>[
              PhotoCard(
                index: indexs[0],
                postKey: postKey,
              ),
              PhotoCard(
                index: indexs[1],
                postKey: postKey,
              ),
              PhotoCard(
                index: indexs[2],
                postKey: postKey,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class PhotoCard extends StatefulWidget {
  final int index;
  final String postKey;
  const PhotoCard({Key? key, required this.index, required this.postKey})
      : super(key: key);

  @override
  State<PhotoCard> createState() => _PhotoCardState();
}

class _PhotoCardState extends State<PhotoCard> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: () async {
              final result =  await changePostImageWidgetButton(context, widget.postKey, widget.index);
              if(result==true){
                setState((){});
              }
            },
            child: FutureBuilder(
                future: ImageServices.getPostImageServices(
                    widget.postKey, widget.index),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    return Image(image: MemoryImage(snapshot.data));
                  } else if (snapshot.hasError) {
                    return const NullContainerWidget();
                  } else {
                    return const CircularProgressIndicator();
                  }
                }),
          )),
    );
  }
}

changePostImageWidgetButton(BuildContext context, postKey, index) async {

  await showDialog(
    context: context,
    builder: (BuildContext dialogContext) {
      return AlertDialog(
        title: ChangeProfileImageWidget(postKey: postKey, index: index,dialogContext: dialogContext, ),
      );
    },
  );

  return true;
}

class ChangeProfileImageWidget extends StatelessWidget {
  final dialogContext;
  final String postKey;
  final int index;
  const ChangeProfileImageWidget({Key? key, required this.postKey, required this.index, this.dialogContext}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          IconButton(
              onPressed: () async {
                await ImageServices.putPostImageInCamera(
                    postKey, index.toString());
                Navigator.of(dialogContext).pop();
              },
              icon: const Icon(Icons.camera_alt)),
          IconButton(
              onPressed: () async {
                await ImageServices.putPostImageInGallery(
                    postKey, index.toString());
                Navigator.of(dialogContext).pop();
              },
              icon: const Icon(Icons.photo_library)),
        ],
      ),
    );
  }
}

class NullContainerWidget extends StatelessWidget {
  const NullContainerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          width: 2.0,
          color: BaseColorPalet.postPageFillColor,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: const [
          CircleAvatar(
            child: Icon(Icons.photo_camera_outlined),
          ),
          Text("Fotoğraf Ekle"),
        ],
      ),
    );
  }
}
