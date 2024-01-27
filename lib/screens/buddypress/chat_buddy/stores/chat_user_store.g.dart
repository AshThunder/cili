// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_user_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ChatUserStore on ChatUserStoreBase, Store {
  Computed<bool>? _$loadingComputed;

  @override
  bool get loading => (_$loadingComputed ??= Computed<bool>(() => super.loading,
          name: 'ChatUserStoreBase.loading'))
      .value;
  Computed<int>? _$nextPageComputed;

  @override
  int get nextPage =>
      (_$nextPageComputed ??= Computed<int>(() => super.nextPage,
              name: 'ChatUserStoreBase.nextPage'))
          .value;
  Computed<ObservableList<ChatUser>>? _$chatUsersComputed;

  @override
  ObservableList<ChatUser> get chatUsers => (_$chatUsersComputed ??=
          Computed<ObservableList<ChatUser>>(() => super.chatUsers,
              name: 'ChatUserStoreBase.chatUsers'))
      .value;
  Computed<bool>? _$canLoadMoreComputed;

  @override
  bool get canLoadMore =>
      (_$canLoadMoreComputed ??= Computed<bool>(() => super.canLoadMore,
              name: 'ChatUserStoreBase.canLoadMore'))
          .value;
  Computed<int>? _$perPageComputed;

  @override
  int get perPage => (_$perPageComputed ??=
          Computed<int>(() => super.perPage, name: 'ChatUserStoreBase.perPage'))
      .value;
  Computed<String>? _$searchComputed;

  @override
  String get search =>
      (_$searchComputed ??= Computed<String>(() => super.search,
              name: 'ChatUserStoreBase.search'))
          .value;

  late final _$fetchChatUsersFutureAtom =
      Atom(name: 'ChatUserStoreBase.fetchChatUsersFuture', context: context);

  @override
  ObservableFuture<List<ChatUser>?> get fetchChatUsersFuture {
    _$fetchChatUsersFutureAtom.reportRead();
    return super.fetchChatUsersFuture;
  }

  @override
  set fetchChatUsersFuture(ObservableFuture<List<ChatUser>?> value) {
    _$fetchChatUsersFutureAtom.reportWrite(value, super.fetchChatUsersFuture,
        () {
      super.fetchChatUsersFuture = value;
    });
  }

  late final _$_chatUsersAtom =
      Atom(name: 'ChatUserStoreBase._chatUsers', context: context);

  @override
  ObservableList<ChatUser> get _chatUsers {
    _$_chatUsersAtom.reportRead();
    return super._chatUsers;
  }

  @override
  set _chatUsers(ObservableList<ChatUser> value) {
    _$_chatUsersAtom.reportWrite(value, super._chatUsers, () {
      super._chatUsers = value;
    });
  }

  late final _$_perPageAtom =
      Atom(name: 'ChatUserStoreBase._perPage', context: context);

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
      Atom(name: 'ChatUserStoreBase._nextPage', context: context);

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
      Atom(name: 'ChatUserStoreBase._canLoadMore', context: context);

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

  late final _$_includeAtom =
      Atom(name: 'ChatUserStoreBase._include', context: context);

  @override
  ObservableList<ChatUser> get _include {
    _$_includeAtom.reportRead();
    return super._include;
  }

  @override
  set _include(ObservableList<ChatUser> value) {
    _$_includeAtom.reportWrite(value, super._include, () {
      super._include = value;
    });
  }

  late final _$_excludeAtom =
      Atom(name: 'ChatUserStoreBase._exclude', context: context);

  @override
  ObservableList<ChatUser> get _exclude {
    _$_excludeAtom.reportRead();
    return super._exclude;
  }

  @override
  set _exclude(ObservableList<ChatUser> value) {
    _$_excludeAtom.reportWrite(value, super._exclude, () {
      super._exclude = value;
    });
  }

  late final _$_searchAtom =
      Atom(name: 'ChatUserStoreBase._search', context: context);

  @override
  String get _search {
    _$_searchAtom.reportRead();
    return super._search;
  }

  @override
  set _search(String value) {
    _$_searchAtom.reportWrite(value, super._search, () {
      super._search = value;
    });
  }

  late final _$pendingAtom =
      Atom(name: 'ChatUserStoreBase.pending', context: context);

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

  late final _$getChatUsersAsyncAction =
      AsyncAction('ChatUserStoreBase.getChatUsers', context: context);

  @override
  Future<List<ChatUser>> getChatUsers({bool cancelPrevious = false}) {
    return _$getChatUsersAsyncAction
        .run(() => super.getChatUsers(cancelPrevious: cancelPrevious));
  }

  late final _$ChatUserStoreBaseActionController =
      ActionController(name: 'ChatUserStoreBase', context: context);

  @override
  Future<void> refresh() {
    final _$actionInfo = _$ChatUserStoreBaseActionController.startAction(
        name: 'ChatUserStoreBase.refresh');
    try {
      return super.refresh();
    } finally {
      _$ChatUserStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void onChanged(
      {List<ChatUser>? include, List<ChatUser>? exclude, String? search}) {
    final _$actionInfo = _$ChatUserStoreBaseActionController.startAction(
        name: 'ChatUserStoreBase.onChanged');
    try {
      return super
          .onChanged(include: include, exclude: exclude, search: search);
    } finally {
      _$ChatUserStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
fetchChatUsersFuture: ${fetchChatUsersFuture},
pending: ${pending},
loading: ${loading},
nextPage: ${nextPage},
chatUsers: ${chatUsers},
canLoadMore: ${canLoadMore},
perPage: ${perPage},
search: ${search}
    ''';
  }
}
