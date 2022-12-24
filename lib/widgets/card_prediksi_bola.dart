import 'package:flutter/material.dart';
import 'package:trading_journal/widgets/text.dart';

import '../data/models/list_prediction_bola_response.dart';
import '../utils/colors.dart';
import '../utils/text_enum.dart';

class CardPrediksiBola extends StatelessWidget {
  final ListPredictionBola value;
  const CardPrediksiBola({
    super.key,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    String textStatus = "";
    textStatus = value.status == "otw"
        ? "On Going"
        : value.status == "draw"
            ? "Draw"
            : value.status == "success"
                ? "Berhasil"
                : value.status == "fail"
                    ? "Gagal"
                    : "";
    Color backgroundStatus = Colors.white;
    backgroundStatus = value.status == "otw"
        ? ColorsCustom.mainColor
        : value.status == "draw"
            ? ColorsCustom.thirdColor
            : value.status == "success"
                ? Colors.green
                : value.status == "fail"
                    ? Colors.red
                    : ColorsCustom.mainColor;
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      width: width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            blurRadius: 5.5,
            color: ColorsCustom.greyMudaColor,
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            width: width,
            decoration: BoxDecoration(
              color: backgroundStatus,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: TextCustom(
                    text: textStatus,
                    color: Colors.white,
                    type: TextEnum.LABEL,
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      if ((value.score ?? "") != "") ...[
                        const TextCustom(
                          text: "Expected Score",
                          color: Colors.white,
                          type: TextEnum.CAPTION,
                        ),
                        TextCustom(
                          text: value.score ?? "",
                          color: Colors.white,
                          type: TextEnum.LABEL,
                        ),
                      ]
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    alignment: Alignment.topRight,
                    child: TextCustom(
                      text: (value.kategori ?? "") != ""
                          ? "Partai ${value.kategori ?? ""}"
                          : "",
                      type: TextEnum.LABEL,
                      color: Colors.white,
                      textAlign: TextAlign.center,
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: TextCustom(
                    text: value.homeTeam,
                    type: TextEnum.LABEL,
                    color: Colors.lightBlue,
                    textAlign: TextAlign.right,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                const TextCustom(
                  text: " Vs ",
                  type: TextEnum.CAPTION,
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: TextCustom(
                    text: value.awayTeam,
                    type: TextEnum.LABEL,
                    color: Colors.redAccent,
                    textAlign: TextAlign.left,
                  ),
                ),
              ],
            ),
          ),
          Divider(
            height: 0,
            color: ColorsCustom.secondaryBlack,
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      TextCustom(
                        text: value.leagueName,
                        type: TextEnum.LABEL,
                        textAlign: TextAlign.center,
                      ),
                      TextCustom(
                        text: value.tanggalString,
                        type: TextEnum.CAPTION,
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 1,
                  height: 20,
                  decoration: BoxDecoration(
                    border: Border.all(),
                  ),
                ),
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    child: TextCustom(
                      text: value.comment,
                      type: TextEnum.LABEL,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
