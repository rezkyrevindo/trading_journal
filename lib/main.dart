import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:month_year_picker/month_year_picker.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:trading_journal/views/ads_controlling/provider/ads_controlling_provider.dart';
import 'package:trading_journal/views/detail_event/provider/detail_event_provider.dart';
import 'package:trading_journal/views/home/provider/home_provider.dart';
import 'package:trading_journal/views/login/provider/login_provider.dart';
import 'package:trading_journal/views/menu_togel/provider/menu_togel_provider.dart';
import 'package:trading_journal/views/prediksi_bola/provider/prediksi_bola_provider.dart';
import 'package:trading_journal/views/slot/provider/slot_provider.dart';
import 'package:trading_journal/views/togel/provider/togel_provider.dart';

import 'utils/colors.dart';
import 'utils/strings.dart';
import 'views/splash/splash_view.dart';

Future<void> main() async {
  hiveInit();
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      systemNavigationBarColor: ColorsCustom.mainColor,
      statusBarColor: ColorsCustom.mainColor,
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.light,
    ),
  );
  runApp(
    MultiProvider(
      providers: getListProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final FirebaseAnalytics analytics = FirebaseAnalytics.instance;
    return MaterialApp(
      builder: (context, widget) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
          child: widget!,
        );
      },
      navigatorObservers: [
        FirebaseAnalyticsObserver(analytics: analytics),
      ],
      debugShowCheckedModeBanner: false,
      title: Strings.title,
      routes: {
        '/': (context) => const SplashView(),
      },
      localizationsDelegates: const [
        GlobalWidgetsLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        MonthYearPickerLocalizations.delegate,
      ],
    );
  }
}

List<SingleChildWidget> getListProvider() {
  final List<SingleChildWidget> list = [];
  list.addAll([
    ChangeNotifierProvider(create: (context) => LoginProvider()),
    ChangeNotifierProvider(create: (context) => HomeProvider()),
    ChangeNotifierProvider(create: (context) => SlotProvider()),
    ChangeNotifierProvider(create: (context) => PrediksiBolaProvider()),
    ChangeNotifierProvider(create: (context) => TogelProvider()),
    ChangeNotifierProvider(create: (context) => DetailEventProvider()),
    ChangeNotifierProvider(create: (context) => MenuTogelProvider()),
    ChangeNotifierProvider(create: (context) => AdsControllingProvider()),
  ]);

  return list;
}

Future hiveInit() async {
  await Hive.initFlutter();
  // final appDocumentDir = await getApplicationDocumentsDirectory();
  // Hive
  //   ..init(appDocumentDir.path)
  //   ..registerAdapter(BookModelAdapter());
}
