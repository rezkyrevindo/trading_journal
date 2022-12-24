import 'package:flutter/material.dart';

import '../../../../utils/assets_list.dart';
import '../../../../utils/text_enum.dart';
import '../../../../widgets/cache_image_network.dart';
import '../../../../widgets/text.dart';

class InfoPertandingan extends StatelessWidget {
  final String linkImgHome;
  final String linkImgAway;
  final String nameHome;
  final String nameAway;
  final String jadwalTanding;
  const InfoPertandingan({
    super.key,
    required this.linkImgHome,
    required this.linkImgAway,
    required this.nameHome,
    required this.nameAway,
    required this.jadwalTanding,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: ExactAssetImage(
            AssetsList.stadium.name,
          ),
          fit: BoxFit.fill,
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.4),
            BlendMode.darken,
          ),
        ),
        color: Colors.black,
      ),
      width: width,
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CacheImageNetworkCustom(
                height: 100,
                width: 100,
                img: linkImgHome,
              ),
              CacheImageNetworkCustom(
                height: 100,
                width: 100,
                img: linkImgAway,
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          TextCustom(
            text: nameHome,
            type: TextEnum.HEADLINE5,
            color: Colors.white,
          ),
          const SizedBox(
            height: 10,
          ),
          const TextCustom(
            text: "Vs",
            type: TextEnum.LABEL,
            color: Colors.white,
          ),
          const SizedBox(
            height: 10,
          ),
          TextCustom(
            text: nameAway,
            type: TextEnum.HEADLINE5,
            color: Colors.white,
          ),
          const SizedBox(
            height: 10,
          ),
          TextCustom(
            text: jadwalTanding,
            type: TextEnum.LABEL,
            color: Colors.white,
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
