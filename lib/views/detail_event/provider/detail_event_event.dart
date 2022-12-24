import 'package:flutter/material.dart';

import '../../../utils/provider_interface.dart';

abstract class DetailEventEvent implements ProviderInterface {
  Future getDetailEvent({
    required BuildContext context,
  });
  Future getParticipant({
    required BuildContext context,
  });
  Future saveComment({
    required BuildContext context,
  });
}
