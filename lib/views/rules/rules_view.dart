import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:trading_journal/utils/colors.dart';
import 'package:trading_journal/utils/secure_storage_utils.dart';

import '../../utils/strings.dart';
import '../../utils/text_enum.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/text.dart';
import '../home/ui/home_view.dart';
import '../login/ui/login_view.dart';

class RulesView extends StatefulWidget {
  const RulesView({super.key});

  @override
  State<RulesView> createState() => _RulesViewState();
}

class _RulesViewState extends State<RulesView> {
  String rules = "";
  bool isAgreed = false;
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      final String tempRules = await SecureStorageUtils.getRules() ?? "";
      setState(() {
        rules = tempRules;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        height: height,
        width: width,
        child: Column(
          children: [
            Stack(
              children: [
                CustomPaint(
                  size: Size(width, height * 1 / 4),
                  painter: BackgroundPainter(height * 1 / 4),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20, right: width * 1 / 3),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 80,
                      ),
                      const TextCustom(
                        text: "Rules at",
                        type: TextEnum.HEADLINE4,
                        color: Colors.white,
                      ),
                      TextCustom(
                        text: Strings.title,
                        type: TextEnum.HEADLINE2,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              height: height * 3 / 4 - 148,
              padding: const EdgeInsets.all(20),
              margin: const EdgeInsets.only(
                left: 20,
                right: 20,
                top: 20,
              ),
              decoration: BoxDecoration(
                border: Border.all(
                  color: ColorsCustom.secondaryColor,
                ),
                borderRadius: BorderRadius.circular(50),
              ),
              child: Scrollbar(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Html(
                        data: rules,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  Checkbox(
                    value: isAgreed,
                    onChanged: (bool? value) {
                      setState(() {
                        isAgreed = value ?? false;
                      });
                    },
                  ),
                  TextCustom(
                    text: "Accept the rules at ${Strings.title}",
                    type: TextEnum.CAPTION,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Container(
        width: width,
        height: 80,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: CustomButton(
                icon: Icon(
                  CupertinoIcons.back,
                  color: ColorsCustom.mainColor,
                ),
                onTap: () async {
                  await SecureStorageUtils.setToken(
                    "",
                  );
                  await SecureStorageUtils.setNoHp(
                    "",
                  );
                  await SecureStorageUtils.setIsAgreed(
                    "",
                  );
                  await Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginView(),
                    ),
                    (route) => false,
                  );
                },
                type: ButtonEnum.secondary,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              flex: 3,
              child: CustomButton(
                isActive: isAgreed,
                title: "Lanjutkan",
                onTap: () async {
                  await SecureStorageUtils.setIsAgreed(
                    "true",
                  );
                  await Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomeView(),
                    ),
                    (route) => false,
                  );
                },
                type: ButtonEnum.primary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
