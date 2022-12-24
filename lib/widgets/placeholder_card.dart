import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../utils/colors.dart';

class PlaceholderCard extends StatefulWidget {
  const PlaceholderCard();

  @override
  _PlaceholderCardState createState() => _PlaceholderCardState();
}

class _PlaceholderCardState extends State<PlaceholderCard> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: ColorsCustom.secondaryColor,
      highlightColor: Colors.white,
      child: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        height: 85,
        width: MediaQuery.of(context).size.width,
      ),
    );
  }
}
