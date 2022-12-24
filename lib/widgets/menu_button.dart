import 'package:flutter/material.dart';
import 'package:trading_journal/widgets/text.dart';

import '../utils/assets_list.dart';
import '../utils/colors.dart';
import '../utils/text_enum.dart';

class MenuButton extends StatelessWidget {
  final Color color;
  final String title;
  final AssetsList iconAssets;
  final void Function()? onTap;
  const MenuButton({
    super.key,
    required this.color,
    required this.title,
    required this.iconAssets,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: width,
            height: 70,
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                  blurRadius: 10.0,
                  color: color,
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Image.asset(
                    iconAssets.name,
                    width: 42,
                    height: 42,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          TextCustom(
            text: title,
            type: TextEnum.BUTTON2,
            maxLines: 2,
            textAlign: TextAlign.center,
            color: ColorsCustom.secondaryBlack[400],
          ),
        ],
      ),
    );
  }
}
