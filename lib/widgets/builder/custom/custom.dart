import 'dart:convert';

import 'package:cirilla/mixins/mixins.dart';
import 'package:cirilla/models/models.dart';
import 'package:cirilla/utils/utils.dart';
import 'package:flutter/material.dart';

import 'widgets/buddypress_groups.dart';
import 'widgets/buddypress_members.dart';
import 'widgets/default.dart';

class CustomWidget extends StatelessWidget with Utility, ContainerMixin {
  final WidgetConfig? widgetConfig;

  CustomWidget({
    Key? key,
    required this.widgetConfig,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Fields
    Map<String, dynamic> fields = widgetConfig?.fields ?? {};
    String keyCustom = get(fields, ['key'], "");
    String dataJsonCustom = get(fields, ['dataJson'], "");
    dynamic dataJson = isJSON(dataJsonCustom) ? jsonDecode(dataJsonCustom) : null;
    switch (keyCustom) {
      case "buddypress_members":
        return BuddyMemberWidget(
          id: widgetConfig?.id,
          dataJson: dataJson,
          styles: widgetConfig?.styles,
        );
      case "buddypress_groups":
        return BuddyGroupWidget(
          id: widgetConfig?.id,
          dataJson: dataJson,
          styles: widgetConfig?.styles,
        );
      default:
        return DefaultCustomWidget(styles: widgetConfig?.styles);
    }
  }
}
