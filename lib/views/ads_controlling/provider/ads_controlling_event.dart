import 'dart:async';

import 'package:flutter/material.dart';

import '../../../utils/provider_interface.dart';

abstract class AdsControllingEvent implements ProviderInterface {
  Timer? getTimer({
    required BuildContext buildContext,
    required String screenName,
  });
  Future displayDialog({required BuildContext context});
}
