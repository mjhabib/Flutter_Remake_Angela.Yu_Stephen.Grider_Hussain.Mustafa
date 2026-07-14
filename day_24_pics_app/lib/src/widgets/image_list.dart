import 'package:flutter/material.dart';
import 'package:pics_app/src/models/image_model.dart';

class ImageList extends StatelessWidget {
  final List<ImageModel> images;
  final String staticImageURL =
      'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d7/LivTylerLOTR03.jpg/330px-LivTylerLOTR03.jpg';
  const ImageList({super.key, required this.images});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: images.length,
      itemBuilder: (context, index) {
        // unfortunately, the API's images are corrupted (not working)!
        // so instead we're gonna show a static image from a random URL
        // return Image.network(images[index].url);

        return Container(
          padding: EdgeInsets.all(20),
          margin: EdgeInsets.all(20),
          decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
          child: Column(
            children: [
              Image.network(staticImageURL, fit: BoxFit.cover),
              SizedBox(height: 10),
              Text(images[index].title),
            ],
          ),
        );
      },
    );
  }
}
