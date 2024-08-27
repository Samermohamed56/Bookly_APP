import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustumImageContainer extends StatelessWidget {
  const CustumImageContainer({super.key, required this.imageURL});
  final String imageURL;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: AspectRatio(
        aspectRatio: 2.5 / 4,
        child: ClipRRect(
          
          borderRadius: BorderRadius.circular(16),
          child: AspectRatio(
            
            aspectRatio: 2.6 / 4,
            child: CachedNetworkImage(
              
              imageUrl: imageURL,
            ),
          ),
        ),
      ),
    );
  }
}
