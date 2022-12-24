import 'package:flutter/material.dart';

import '../../../utils/provider_interface.dart';

abstract class HomeEvent implements ProviderInterface {
  Future getListPromotion({
    required BuildContext context,
  });
  Future getListAds({
    required BuildContext context,
  });
  Future openCSChat();
  Future logout({
    required BuildContext context,
  });
  void showBantuan(BuildContext context);
}
