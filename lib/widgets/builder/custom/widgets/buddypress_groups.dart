import 'package:cirilla/mixins/mixins.dart';
import 'package:cirilla/screens/buddypress/chat_buddy/widgets/widgets.dart';
import 'package:cirilla/store/store.dart';
import 'package:cirilla/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import 'package:cirilla/screens/buddypress/chat_buddy/stores/stores.dart';
import 'package:cirilla/screens/buddypress/chat_buddy/models/models.dart';

class BuddyGroupWidget extends StatefulWidget {
  final String? id;
  final dynamic dataJson;
  final Map<String, dynamic>? styles;

  const BuddyGroupWidget({
    Key? key,
    this.id,
    this.dataJson,
    this.styles,
  }) : super(key: key);

  @override
  State<BuddyGroupWidget> createState() => _BuddyGroupWidgetState();
}

class _BuddyGroupWidgetState extends State<BuddyGroupWidget> with Utility, ContainerMixin {
  late AppStore _appStore;
  late ChatGroupStore _chatCroupStore;
  late SettingStore _settingStore;

  @override
  void didChangeDependencies() {
    _appStore = Provider.of<AppStore>(context);
    _settingStore = Provider.of<SettingStore>(context);

    // Filter
    int limit = ConvertData.stringToInt(get(widget.dataJson, ['limit'], '4'));

    String? key = "${widget.id}_buddypress_groups_limit=$limit";
    // Add store to list store
    if (_appStore.getStoreByKey(key) == null) {
      ChatGroupStore store = ChatGroupStore(_settingStore.requestHelper, key: key, perPage: limit)..getChatGroups();
      _appStore.addStore(store);
      _chatCroupStore = store;
    } else {
      _chatCroupStore = _appStore.getStoreByKey(key);
    }

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    SettingStore settingStore = Provider.of<SettingStore>(context);
    String themeModeKey = settingStore.themeModeKey;

    // Styles
    Map<String, dynamic>? styles = widget.styles;
    Map<String, dynamic>? margin = get(styles, ['margin'], {});
    Map<String, dynamic>? padding = get(styles, ['padding'], {});
    Color background = ConvertData.fromRGBA(get(styles, ['background', themeModeKey], {}), Colors.transparent);
    Color textColor =
        ConvertData.fromRGBA(get(styles, ['textColor', themeModeKey], {}), theme.textTheme.titleMedium?.color);
    Color subtextColor =
        ConvertData.fromRGBA(get(styles, ['subtextColor', themeModeKey], {}), theme.textTheme.bodyLarge?.color);
    Color dividerColor = ConvertData.fromRGBA(get(styles, ['dividerColor', themeModeKey], {}), theme.dividerColor);

    return Container(
      margin: ConvertData.space(margin, 'margin'),
      padding: ConvertData.space(padding, 'padding'),
      decoration: decorationColorImage(color: background),
      child: Observer(builder: (_) {
        bool loading = _chatCroupStore.loading;
        List<ChatGroup> groups = _chatCroupStore.chatGroups;
        List<ChatGroup> emptyGroup = List.generate(_chatCroupStore.perPage, (index) => ChatGroup()).toList();
        List<ChatGroup> data = loading ? emptyGroup : groups;

        return ListView(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
          children: data
              .map((e) => ChatGroupItem(
                    group: e,
                    textColor: textColor,
                    subtextColor: subtextColor,
                    dividerColor: dividerColor,
                  ))
              .toList(),
        );
      }),
    );
  }
}
