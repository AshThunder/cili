// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_message_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ChatMessageStore on ChatMessageStoreBase, Store {
  Computed<ChatConversation?>? _$conversationComputed;

  @override
  ChatConversation? get conversation => (_$conversationComputed ??=
          Computed<ChatConversation?>(() => super.conversation,
              name: 'ChatMessageStoreBase.conversation'))
      .value;
  Computed<ObservableList<ChatMessage>>? _$chatMessagesComputed;

  @override
  ObservableList<ChatMessage> get chatMessages => (_$chatMessagesComputed ??=
          Computed<ObservableList<ChatMessage>>(() => super.chatMessages,
              name: 'ChatMessageStoreBase.chatMessages'))
      .value;
  Computed<bool>? _$loadingComputed;

  @override
  bool get loading => (_$loadingComputed ??= Computed<bool>(() => super.loading,
          name: 'ChatMessageStoreBase.loading'))
      .value;
  Computed<bool>? _$errorComputed;

  @override
  bool get error => (_$errorComputed ??=
          Computed<bool>(() => super.error, name: 'ChatMessageStoreBase.error'))
      .value;

  late final _$_conversationAtom =
      Atom(name: 'ChatMessageStoreBase._conversation', context: context);

  @override
  ChatConversation? get _conversation {
    _$_conversationAtom.reportRead();
    return super._conversation;
  }

  @override
  set _conversation(ChatConversation? value) {
    _$_conversationAtom.reportWrite(value, super._conversation, () {
      super._conversation = value;
    });
  }

  late final _$_chatMessagesAtom =
      Atom(name: 'ChatMessageStoreBase._chatMessages', context: context);

  @override
  ObservableList<ChatMessage> get _chatMessages {
    _$_chatMessagesAtom.reportRead();
    return super._chatMessages;
  }

  @override
  set _chatMessages(ObservableList<ChatMessage> value) {
    _$_chatMessagesAtom.reportWrite(value, super._chatMessages, () {
      super._chatMessages = value;
    });
  }

  late final _$_statusAtom =
      Atom(name: 'ChatMessageStoreBase._status', context: context);

  @override
  String get _status {
    _$_statusAtom.reportRead();
    return super._status;
  }

  @override
  set _status(String value) {
    _$_statusAtom.reportWrite(value, super._status, () {
      super._status = value;
    });
  }

  late final _$getChatMessagesAsyncAction =
      AsyncAction('ChatMessageStoreBase.getChatMessages', context: context);

  @override
  Future<void> getChatMessages() {
    return _$getChatMessagesAsyncAction.run(() => super.getChatMessages());
  }

  late final _$createMessageAsyncAction =
      AsyncAction('ChatMessageStoreBase.createMessage', context: context);

  @override
  Future<List<ChatMessage>?> createMessage({Map<String, dynamic>? data}) {
    return _$createMessageAsyncAction
        .run(() => super.createMessage(data: data));
  }

  late final _$readMessageAsyncAction =
      AsyncAction('ChatMessageStoreBase.readMessage', context: context);

  @override
  Future<void> readMessage() {
    return _$readMessageAsyncAction.run(() => super.readMessage());
  }

  late final _$ChatMessageStoreBaseActionController =
      ActionController(name: 'ChatMessageStoreBase', context: context);

  @override
  void onChanged({List<ChatMessage>? messages}) {
    final _$actionInfo = _$ChatMessageStoreBaseActionController.startAction(
        name: 'ChatMessageStoreBase.onChanged');
    try {
      return super.onChanged(messages: messages);
    } finally {
      _$ChatMessageStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
conversation: ${conversation},
chatMessages: ${chatMessages},
loading: ${loading},
error: ${error}
    ''';
  }
}
