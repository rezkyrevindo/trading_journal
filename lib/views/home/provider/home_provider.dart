import 'package:flutter/material.dart';
import 'package:livechatt/livechatt.dart';
import 'package:logger/logger.dart';
import 'package:trading_journal/utils/alert_function.dart';
import 'package:trading_journal/utils/colors.dart';
import 'package:trading_journal/utils/secure_storage_utils.dart';
import 'package:trading_journal/utils/text_enum.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../../widgets/cache_image_network.dart';
import '../../../widgets/text.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomeProvider extends HomeState implements HomeEvent {
  @override
  void clearData() {
    // TODO: implement clearData
  }
}
