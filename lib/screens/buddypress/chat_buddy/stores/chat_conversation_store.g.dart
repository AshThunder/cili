// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_conversation_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ChatConversationStore on ChatConversationStoreBase, Store {
  Computed<bool>? _$loadingComputed;

  @override
  bool get loading => (_$loadingComputed ??= Computed<bool>(() => super.loading,
          name: 'ChatConversationStoreBase.loading'))
      .value;
  Computed<ObservableList<ChatConversation>>? _$conversationsComputed;

  @override
  ObservableList<ChatConversation> get conversations =>
      (_$conversationsComputed ??= Computed<ObservableList<ChatConversation>>(
              () => super.conversations,
              name: 'ChatConversationStoreBase.conversations'))
          .value;
  Computed<int>? _$nextPageComputed;

  @override
  int get nextPage =>
      (_$nextPageComputed ??= Computed<int>(() => super.nextPage,
              name: 'ChatConversationStoreBase.nextPage'))
          .value;
  Computed<bool>? _$canLoadMoreComputed;

  @override
  bool get canLoadMore =>
      (_$canLoadMoreComputed ??= Computed<bool>(() => super.canLoadMore,
              name: 'ChatConversationStoreBase.canLoadMore'))
          .value;
  Computed<int>? _$perPageComputed;

  @override
  int get perPage => (_$perPageComputed ??= Computed<int>(() => super.perPage,
          name: 'ChatConversationStoreBase.perPage'))
      .value;
  Computed<String>? _$boxComputed;

  @override
  String get box => (_$boxComputed ??= Computed<String>(() => super.box,
          name: 'ChatConversationStoreBase.box'))
      .value;

  late final _$fetchChatConversationsFutureAtom = Atom(
      name: 'ChatConversationStoreBase.fetchChatConversationsFuture',
      context: context);

  @override
  ObservableFuture<List<ChatConversation>?> get fetchChatConversationsFuture {
    _$fetchChatConversationsFutureAtom.reportRead();
    return super.fetchChatConversationsFuture;
  }

  @override
  set fetchChatConversationsFuture(
      ObservableFuture<List<ChatConversation>?> value) {
    _$fetchChatConversationsFutureAtom
        .reportWrite(value, super.fetchChatConversationsFuture, () {
      super.fetchChatConversationsFuture = value;
    });
  }

  late final _$_conversationsAtom =
      Atom(name: 'ChatConversationStoreBase._conversations', context: context);

  @override
  ObservableList<ChatConversation> get _conversations {
    _$_conversationsAtom.reportRead();
    return super._conversations;
  }

  @override
  set _conversations(ObservableList<ChatConversation> value) {
    _$_conversationsAtom.reportWrite(value, super._conversations, () {
      super._conversations = value;
    });
  }

  late final _$_boxAtom =
      Atom(name: 'ChatConversationStoreBase._box', context: context);

  @override
  String get _box {
    _$_boxAtom.reportRead();
    return super._box;
  }

  @override
  set _box(String value) {
    _$_boxAtom.reportWrite(value, super._box, () {
      super._box = value;
    });
  }

  late final _$_perPageAtom =
      Atom(name: 'ChatConversationStoreBase._perPage', context: context);

  @override
  int get _perPage {
    _$_perPageAtom.reportRead();
    return super._perPage;
  }

  @override
  set _perPage(int value) {
    _$_perPageAtom.reportWrite(value, super._perPage, () {
      super._perPage = value;
    });
  }

  late final _$_nextPageAtom =
      Atom(name: 'ChatConversationStoreBase._nextPage', context: context);

  @override
  int get _nextPage {
    _$_nextPageAtom.reportRead();
    return super._nextPage;
  }

  @override
  set _nextPage(int value) {
    _$_nextPageAtom.reportWrite(value, super._nextPage, () {
      super._nextPage = value;
    });
  }

  late final _$_canLoadMoreAtom =
      Atom(name: 'ChatConversationStoreBase._canLoadMore', context: context);

  @override
  bool get _canLoadMore {
    _$_canLoadMoreAtom.reportRead();
    return super._canLoadMore;
  }

  @override
  set _canLoadMore(bool value) {
    _$_canLoadMoreAtom.reportWrite(value, super._canLoadMore, () {
      super._canLoadMore = value;
    });
  }

  late final _$pendingAtom =
      Atom(name: 'ChatConversationStoreBase.pending', context: context);

  @override
  bool get pending {
    _$pendingAtom.reportRead();
    return super.pending;
  }

  @override
  set pending(bool value) {
    _$pendingAtom.reportWrite(value, super.pending, () {
      super.pending = value;
    });
  }

  late final _$getChatConversationsAsyncAction = AsyncAction(
      'ChatConversationStoreBase.getChatConversations',
      context: context);

  @override
  Future<List<ChatConversation>?> getChatConversations() {
    return _$getChatConversationsAsyncAction
        .run(() => super.getChatConversations());
  }

  late final _$ChatConversationStoreBaseActionController =
      ActionController(name: 'ChatConversationStoreBase', context: context);

  @override
  Future<void> refresh() {
    final _$actionInfo = _$ChatConversationStoreBaseActionController
        .startAction(name: 'ChatConversationStoreBase.refresh');
    try {
      return super.refresh();
    } finally {
      _$ChatConversationStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void onChanged({String? box}) {
    final _$actionInfo = _$ChatConversationStoreBaseActionController
        .startAction(name: 'ChatConversationStoreBase.onChanged');
    try {
      return super.onChanged(box: box);
    } finally {
      _$ChatConversationStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
fetchChatConversationsFuture: ${fetchChatConversationsFuture},
pending: ${pending},
loading: ${loading},
conversations: ${conversations},
nextPage: ${nextPage},
canLoadMore: ${canLoadMore},
perPage: ${perPage},
box: ${box}
    ''';
  }
}
