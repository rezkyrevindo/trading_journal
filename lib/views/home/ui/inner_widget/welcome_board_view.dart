import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';

import '../../../../utils/alert_function.dart';
import '../../../../utils/assets_list.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/text_enum.dart';
import '../../../../widgets/text.dart';
import '../../provider/home_provider.dart';

class WelcomeBoardView extends StatelessWidget {
  final HomeProvider provider;
  const WelcomeBoardView({super.key, required this.provider});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            blurRadius: 10.0,
            color: ColorsCustom.secondaryBlack[200] ?? Colors.white,
          ),
        ],
      ),
      width: width,
      height: 140,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      margin: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextCustom(
                    text: "Welcome,",
                    type: TextEnum.HEADLINE5,
                    color: ColorsCustom.secondaryBlack[400],
                  ),
                  TextCustom(
                    text: provider.noHp.isNotEmpty
                        ? "${provider.noHp.substring(0, provider.noHp.length - 3)}***"
                        : "",
                    type: TextEnum.HEADLINE2,
                    color: ColorsCustom.secondaryBlack[400],
                  ),
                ],
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () async {
                      if (!provider.isLoading) {
                        provider.showBantuan(context);
                      }
                    },
                    child: SizedBox(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            AssetsList.icBantuan.name,
                            width: 32,
                            height: 32,
                            color: ColorsCustom.secondaryBlack[400],
                          ),
                          TextCustom(
                            text: "Bantuan",
                            type: TextEnum.LABEL,
                            color: ColorsCustom.secondaryBlack[400],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      AlertFunction.yesNoSmartAlert(
                        context: context,
                        title: "Logout",
                        message: "Apakah anda yakin keluar?",
                        onConfirmPressed: () {
                          provider.logout(context: context);
                        },
                        onCancelPressed: null,
                      );
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          AssetsList.icLogout.name,
                          width: 32,
                          height: 32,
                          color: ColorsCustom.secondaryBlack[400],
                        ),
                        TextCustom(
                          text: "Logout",
                          type: TextEnum.LABEL,
                          color: ColorsCustom.secondaryBlack[400],
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
          Divider(
            color: ColorsCustom.secondaryBlack,
          ),
          SizedBox(
            width: width,
            height: 25,
            child: Marquee(
              text: "${provider.runningText} ",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: ColorsCustom.secondaryBlack[400],
              ),
              blankSpace: 50,
            ),
          ),
        ],
      ),
    );
  }
}
