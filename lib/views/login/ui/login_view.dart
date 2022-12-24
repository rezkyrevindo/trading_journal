import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:trading_journal/utils/colors.dart';
import 'package:trading_journal/utils/text_enum.dart';
import 'package:trading_journal/widgets/custom_button.dart';
import 'package:trading_journal/widgets/text.dart';
import 'package:trading_journal/widgets/text_field.dart';

import '../../../utils/alert_function.dart';
import '../../../utils/assets_list.dart';
import '../../../utils/strings.dart';
import '../../../utils/validations.dart';
import '../../../widgets/cache_image_network.dart';
import '../../detail_promotion/detail_promotion_view.dart';
import '../provider/login_provider.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void init() {
    final provider = Provider.of<LoginProvider>(context, listen: false);
    provider.clearData();
    provider.getListPromotion(context: context);
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      init();
    });

    super.initState();
  }

  void onPressedLogin({required LoginProvider provider}) {
    final form = formKey.currentState;
    if (form?.validate() ?? false) {
      provider.processLogin(
        context: context,
      );
    } else {
      AlertFunction.okSmartAlert(
        context: context,
        title: "Warning",
        message: Strings.inputError,
      );
    }
    FocusManager.instance.primaryFocus?.unfocus();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: ColorsCustom.mainColor,
        body: Consumer<LoginProvider>(
          builder: (context, provider, _) {
            return LoadingOverlay(
              isLoading: provider.isLoading,
              color: Colors.black,
              opacity: 0.65,
              progressIndicator: Lottie.asset(
                'assets/lottie/loading.json',
                width: 100,
                height: 100,
              ),
              child: SizedBox(
                height: height,
                width: width,
                child: Form(
                  key: formKey,
                  autovalidateMode: AutovalidateMode.always,
                  child: Column(
                    children: [
                      Container(
                        height: 200,
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Container(
                                alignment: Alignment.topRight,
                                child: Row(
                                  children: [
                                    const Expanded(child: SizedBox()),
                                    Expanded(
                                      child: Container(
                                        alignment: Alignment.center,
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(100),
                                          child: Image.asset(
                                            AssetsList.logo.name,
                                            height: 75,
                                            width: 75,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: GestureDetector(
                                        onTap: () {
                                          if (!provider.isLoading) {
                                            provider.openCSChat();
                                          }
                                        },
                                        child: Container(
                                          alignment: Alignment.topRight,
                                          child: Column(
                                            children: [
                                              Image.asset(
                                                AssetsList.icChat.name,
                                                width: 32,
                                                height: 32,
                                                color: Colors.white,
                                              ),
                                              const TextCustom(
                                                text: "Live Chat",
                                                type: TextEnum.LABEL,
                                                color: Colors.white,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            TextCustom(
                              text: Strings.title,
                              type: TextEnum.HEADLINE1,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(30),
                              topLeft: Radius.circular(30),
                            ),
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 30.0,
                                color: ColorsCustom.secondaryColor,
                              ),
                            ],
                            border: Border.all(
                              width: 0,
                              color: ColorsCustom.mainColor,
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                padding: const EdgeInsets.all(20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    const TextCustom(
                                      text: "Login",
                                      type: TextEnum.HEADLINE2,
                                    ),
                                    const TextCustom(
                                      text:
                                          "Silahkan login untuk masuk ke aplikasi",
                                      type: TextEnum.HEADLINE6,
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    TextFieldCustom(
                                      icon: Container(
                                        margin: const EdgeInsets.only(
                                          right: 20,
                                        ),
                                        child: Icon(
                                          Icons.phone_android_rounded,
                                          color: ColorsCustom.mainColor,
                                        ),
                                      ),
                                      isFieldOnly: true,
                                      inputType: TextInputType.number,
                                      hintText: "ex : 085732134342",
                                      controller: provider.phoneNumber,
                                      maxLength: 16,
                                      onEditingComplete: () {
                                        onPressedLogin(
                                          provider: provider,
                                        );
                                      },
                                      validator: (value) => Validations(
                                        noHp: true,
                                        length: 8,
                                        maxLength: 16,
                                        mandatory: true,
                                      ).validate(value),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          flex: 2,
                                          child: CustomButton(
                                            title: "Login",
                                            isActive: !provider.isLoading,
                                            onTap: () {
                                              onPressedLogin(
                                                provider: provider,
                                              );
                                            },
                                            type: ButtonEnum.primary,
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              Expanded(
                                child: SizedBox(
                                  width: width,
                                  child: CarouselSlider(
                                    options: CarouselOptions(
                                      enlargeCenterPage: true,
                                      autoPlay: true,
                                    ),
                                    items: provider.listPromotion.map((i) {
                                      return Builder(
                                        builder: (BuildContext context) {
                                          return GestureDetector(
                                            onTap: () {
                                              Navigator.pushReplacement(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      DetailPromotionView(
                                                    content: i,
                                                    from: "Login",
                                                  ),
                                                ),
                                              );
                                            },
                                            child: Container(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              margin:
                                                  const EdgeInsets.symmetric(
                                                horizontal: 5.0,
                                              ),
                                              decoration: BoxDecoration(
                                                color:
                                                    ColorsCustom.secondaryColor,
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                              ),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                child: CacheImageNetworkCustom(
                                                  img: i.img ?? "",
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      );
                                    }).toList(),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class BackgroundPainter extends CustomPainter {
  final double titleBarHeight;
  const BackgroundPainter(this.titleBarHeight);

  @override
  // ignore: long-method
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = ColorsCustom.mainColor;

    const smallRadius = 70.0;
    const bigRadius = 130.0;

    canvas.drawCircle(
      Offset(smallRadius, titleBarHeight - smallRadius),
      smallRadius,
      paint,
    );

    canvas.drawRect(
      Rect.fromPoints(
        Offset.zero,
        Offset(size.width, titleBarHeight - smallRadius),
      ),
      paint,
    );
    canvas.drawRect(
      Rect.fromPoints(
        Offset(smallRadius, titleBarHeight - smallRadius),
        Offset(size.width, titleBarHeight),
      ),
      paint,
    );

    paint.color = ColorsCustom.secondaryColor;
    canvas.drawCircle(
      Offset(size.width, titleBarHeight + 60),
      bigRadius,
      paint,
    );

    paint.color = Colors.white;

    canvas.drawCircle(
      Offset(size.width - smallRadius, titleBarHeight + smallRadius),
      smallRadius,
      paint,
    );
    canvas.drawRect(
      Rect.fromPoints(
        Offset(size.width - bigRadius, titleBarHeight),
        Offset(size.width - smallRadius, titleBarHeight + 60 + bigRadius),
      ),
      paint,
    );
    canvas.drawRect(
      Rect.fromPoints(
        Offset(size.width - smallRadius, titleBarHeight + smallRadius),
        Offset(size.width, titleBarHeight + 60 + bigRadius),
      ),
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
