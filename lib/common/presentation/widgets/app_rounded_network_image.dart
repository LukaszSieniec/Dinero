import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppRoundedNetworkImage extends StatelessWidget {
  final String imageUrl;

  const AppRoundedNetworkImage({
    required this.imageUrl,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.transparent,
      backgroundImage: NetworkImage(imageUrl),
      radius: 16.0.r,
    );
  }
}
