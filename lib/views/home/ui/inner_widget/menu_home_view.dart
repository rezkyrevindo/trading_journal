import 'package:flutter/material.dart';
import 'package:trading_journal/utils/assets_list.dart';

import '../../../../utils/colors.dart';
import '../../../../widgets/menu_button.dart';
import '../../../detail_event/ui/detail_event_view.dart';
import '../../../menu_togel/ui/menu_togel_view.dart';
import '../../../prediksi_bola/ui/prediksi_bola_view.dart';
import '../../../slot/ui/slot_view.dart';

class MenuHomeView extends StatelessWidget {
  const MenuHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: MenuButton(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const PrediksiBolaView(),
                        ),
                      );
                    },
                    color: Colors.purple[300] ?? Colors.black,
                    title: "Prediksi\nBola",
                    iconAssets: AssetsList.icBola,
                  ),
                ),
                Expanded(
                  child: MenuButton(
                    color: Colors.lightGreen[300] ?? Colors.black,
                    title: "Games",
                    iconAssets: AssetsList.icGames,
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SlotView(),
                        ),
                      );
                    },
                  ),
                ),
                Expanded(
                  child: MenuButton(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const DetailEventView(),
                        ),
                      );
                    },
                    color: ColorsCustom.thirdColor,
                    title: "Event\nBola",
                    iconAssets: AssetsList.icEvent,
                  ),
                ),
                Expanded(
                  child: MenuButton(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MenuTogelView(),
                        ),
                      );
                    },
                    color: Colors.red[300] ?? Colors.black,
                    title: "Togel",
                    iconAssets: AssetsList.icTogel,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
