import 'package:flutter/material.dart';

import '../../../utils/provider_interface.dart';

abstract class TogelEvent implements ProviderInterface {
  Future getListTogel({
    required BuildContext context,
  });
}
