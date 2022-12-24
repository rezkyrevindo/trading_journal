import 'package:flutter/material.dart';
import 'package:trading_journal/utils/alert_function.dart';
import 'package:trading_journal/widgets/custom_button.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../../utils/colors.dart';
import '../../../widgets/cache_image_network.dart';

class PopUpDialogAds extends StatelessWidget {
  final String linkImg;
  final String linkOnClick;
  const PopUpDialogAds({
    required this.linkImg,
    required this.linkOnClick,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        height: (height / 2) + 50,
        width: width - 40,
        color: Colors.transparent,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(100),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 7.5,
                      color: ColorsCustom.secondaryBlack,
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.close,
                  color: Colors.white,
                  size: 24,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: CacheImageNetworkCustom(
                    img: linkImg,
                  ),
                ),
              ),
            ),
            Container(
              transform: Matrix4.translationValues(0.0, -40.0, 0.0),
              margin: const EdgeInsets.symmetric(horizontal: 50),
              child: CustomButton(
                isActive: true,
                onTap: () async {
                  if (!(await launchUrlString(
                    linkOnClick,
                    mode: LaunchMode.externalApplication,
                  ))) {
                    AlertFunction.okSmartAlert(
                      context: context,
                      title: "Terdapat Kesalahan",
                      message: "Tidak dapat membuka link, silahkan coba lagi.",
                    );
                  }
                },
                type: ButtonEnum.primary,
                title: "Lihat Selengkapnya",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
