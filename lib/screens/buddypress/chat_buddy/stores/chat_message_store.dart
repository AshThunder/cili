import 'package:cirilla/service/helpers/request_helper.dart';
import 'package:dio/dio.dart';
import 'package:mobx/mobx.dart';

import '../models/models.dart';

part 'chat_message_store.g.dart';

class ChatMessageStore = ChatMessageStoreBase with _$ChatMessageStore;

abstract class ChatMessageStoreBase with Store {
  final String? key;

  // Request helper instance
  final RequestHelper _requestHelper;

  // store for handling errors
  // final ErrorStore errorStore = ErrorStore();

  // constructor:---------------------------------------------------------------
  ChatMessageStoreBase(
    this._requestHelper, {
    this.key,
    ChatConversation? conversation,
  }) {
    if (conversation != null) _conversation = conversation;
    _reaction();
  }

  // store variables:-----------------------------------------------------------
  @observable
  ChatConversation? _conversation;

  @observable
  ObservableList<ChatMessage> _chatMessages = ObservableList<ChatMessage>.of([]);

  @observable
  String _status = "init";

  // computed:-------------------------------------------------------------------
  @computed
  ChatConversation? get conversation => _conversation;

  @computed
  ObservableList<ChatMessage> get chatMessages => _chatMessages;

  @computed
  bool get loading => _status == "loading";

  @computed
  bool get error => _status == "error";

  // actions:-------------------------------------------------------------------
  @action
  Future<void> getChatMessages() async {
    if (_conversation?.id != null) {
      _status = "loading";
      final future = _requestHelper.getChatMessages(id: _conversation?.id ?? 0);
      return future.then((data) {
        _status = "success";
        _chatMessages = ObservableList<ChatMessage>.of(data ?? [] as List<ChatMessage>);
      }).catchError((_) {
        _status = "error";
      });
    }
  }

  @action
  Future<List<ChatMessage>?> createMessage({Map<String, dynamic>? data}) async {
    var formData = FormData.fromMap(data!);
    return _requestHelper.createChatMessages(data: formData, queryParameters: {'app-builder-decode': true});
  }

  @action
  Future<void> readMessage() async {
    if (_conversation?.unreadCount != null && conversation!.unreadCount! > 0) {
      var formData = FormData.fromMap({
        "context": 'edit',
      });
      final future = _requestHelper.readChatMessages(
        id: _conversation?.id ?? 0,
        queryParameters: {
          "read": true,
        },
        data: formData,
      );
      return future.then((data) {
        _conversation = data;
      }).catchError((_) {});
    }
  }

  @action
  void onChanged({List<ChatMessage>? messages}) {
    if (messages != null) {
      _chatMessages = ObservableList<ChatMessage>.of(messages);
    }
  }

  // disposers:-----------------------------------------------------------------
  late List<ReactionDisposer> _disposers;

  void _reaction() {
    _disposers = [];
  }

  void dispose() {
    for (final d in _disposers) {
      d();
    }
  }
}
