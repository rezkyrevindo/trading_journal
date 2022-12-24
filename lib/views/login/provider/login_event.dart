import 'package:flutter/material.dart';

import '../../../utils/provider_interface.dart';

abstract class LoginEvent implements ProviderInterface {
  Future processLogin({
    required BuildContext context,
  });
  Future getListPromotion({
    required BuildContext context,
  });
  Future openCSChat();
}
