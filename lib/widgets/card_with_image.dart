import 'package:flutter/material.dart';
import 'package:trading_journal/widgets/text.dart';

import '../utils/colors.dart';
import '../utils/text_enum.dart';

class CardWithImage extends StatelessWidget {
  final String? img;
  final String? assetsUrl;
  final String title;
  final String subtitle;
  final Function()? onTap;
  const CardWithImage({
    super.key,
    this.img,
    required this.title,
    required this.subtitle,
    this.assetsUrl,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final valueImage = assetsUrl != null
        ? ExactAssetImage(assetsUrl ?? "")
        : NetworkImage(
            img ?? "",
          );
    final width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: valueImage as ImageProvider<Object>,
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.5),
              BlendMode.darken,
            ),
          ),
          color: Colors.black,
          borderRadius: const BorderRadius.all(
            Radius.circular(20),
          ),
          boxShadow: [
            BoxShadow(
              blurRadius: 1.0,
              color: ColorsCustom.secondaryBlack,
            ),
          ],
          border: Border.all(
            width: 0,
            color: ColorsCustom.mainColor,
          ),
        ),
        margin: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
        height: width / 4,
        width: width,
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextCustom(
                  text: title,
                  type: TextEnum.HEADLINE5,
                  color: Colors.white,
                ),
                TextCustom(
                  text: subtitle,
                  type: TextEnum.CAPTION,
                  color: Colors.white,
                ),
              ],
            ),
            if (onTap != null) ...[
              const Icon(
                Icons.arrow_forward_ios_outlined,
                color: Colors.white,
                size: 16,
              )
            ]
          ],
        ),
      ),
    );
  }
}
