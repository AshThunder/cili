import 'package:cirilla/mixins/mixins.dart';
import 'package:cirilla/store/store.dart';
import 'package:cirilla/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DefaultCustomWidget extends StatelessWidget with Utility, ContainerMixin {
  final Map<String, dynamic>? styles;

  DefaultCustomWidget({
    Key? key,
    required this.styles,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SettingStore settingStore = Provider.of<SettingStore>(context);
    String themeModeKey = settingStore.themeModeKey;

    Map<String, dynamic>? margin = get(styles, ['margin'], {});
    Map<String, dynamic>? padding = get(styles, ['padding'], {});
    Map? background = get(styles, ['backgroundColor', themeModeKey], {});

    Color backgroundColor = ConvertData.fromRGBA(background, Colors.transparent);

    return Container(
      margin: ConvertData.space(margin, 'margin'),
      padding: ConvertData.space(padding, 'padding'),
      decoration: decorationColorImage(color: backgroundColor),
    );
  }
}
