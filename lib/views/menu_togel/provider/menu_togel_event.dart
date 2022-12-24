import 'package:flutter/material.dart';

import '../../../utils/provider_interface.dart';

abstract class MenuTogelEvent implements ProviderInterface {
  Future getListMenuTogel({
    required BuildContext context,
  });
  Future openLink(
    String link,
    BuildContext context,
  );
}
