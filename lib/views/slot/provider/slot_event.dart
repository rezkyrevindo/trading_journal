import 'package:flutter/material.dart';

import '../../../utils/provider_interface.dart';

abstract class SlotEvent implements ProviderInterface {
  Future getListSlot({
    required BuildContext context,
  });
}
