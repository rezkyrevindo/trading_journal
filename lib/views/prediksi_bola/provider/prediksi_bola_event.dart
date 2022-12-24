import 'package:flutter/material.dart';

import '../../../utils/provider_interface.dart';

abstract class PrediksiBolaEvent implements ProviderInterface {
  Future getListBolaKecil({
    required BuildContext context,
  });
  Future getListBolaBesar({
    required BuildContext context,
  });
  Future getListBolaSuccess({
    required BuildContext context,
  });
}
