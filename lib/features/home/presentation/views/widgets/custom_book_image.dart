import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomBookImage extends StatelessWidget {
 const  CustomBookImage({super.key, required this.imageUrl});
final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: AspectRatio(
        
        aspectRatio: 2.6/4,
        child:CachedNetworkImage(
            imageUrl: imageUrl,
        fit: BoxFit.fill,
          errorWidget: (context, url, error) =>const Icon(FontAwesomeIcons.exclamation),
          
        ),
      ),
    );
  }
}
