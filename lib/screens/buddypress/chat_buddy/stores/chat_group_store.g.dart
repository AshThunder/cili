// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_group_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ChatGroupStore on ChatGroupStoreBase, Store {
  Computed<bool>? _$loadingComputed;

  @override
  bool get loading => (_$loadingComputed ??= Computed<bool>(() => super.loading,
          name: 'ChatGroupStoreBase.loading'))
      .value;
  Computed<int>? _$nextPageComputed;

  @override
  int get nextPage =>
      (_$nextPageComputed ??= Computed<int>(() => super.nextPage,
              name: 'ChatGroupStoreBase.nextPage'))
          .value;
  Computed<ObservableList<ChatGroup>>? _$chatGroupsComputed;

  @override
  ObservableList<ChatGroup> get chatGroups => (_$chatGroupsComputed ??=
          Computed<ObservableList<ChatGroup>>(() => super.chatGroups,
              name: 'ChatGroupStoreBase.chatGroups'))
      .value;
  Computed<bool>? _$canLoadMoreComputed;

  @override
  bool get canLoadMore =>
      (_$canLoadMoreComputed ??= Computed<bool>(() => super.canLoadMore,
              name: 'ChatGroupStoreBase.canLoadMore'))
          .value;
  Computed<int>? _$perPageComputed;

  @override
  int get perPage => (_$perPageComputed ??= Computed<int>(() => super.perPage,
          name: 'ChatGroupStoreBase.perPage'))
      .value;
  Computed<String>? _$searchComputed;

  @override
  String get search =>
      (_$searchComputed ??= Computed<String>(() => super.search,
              name: 'ChatGroupStoreBase.search'))
          .value;

  late final _$fetchChatGroupsFutureAtom =
      Atom(name: 'ChatGroupStoreBase.fetchChatGroupsFuture', context: context);

  @override
  ObservableFuture<List<ChatGroup>?> get fetchChatGroupsFuture {
    _$fetchChatGroupsFutureAtom.reportRead();
    return super.fetchChatGroupsFuture;
  }

  @override
  set fetchChatGroupsFuture(ObservableFuture<List<ChatGroup>?> value) {
    _$fetchChatGroupsFutureAtom.reportWrite(value, super.fetchChatGroupsFuture,
        () {
      super.fetchChatGroupsFuture = value;
    });
  }

  late final _$_chatGroupsAtom =
      Atom(name: 'ChatGroupStoreBase._chatGroups', context: context);

  @override
  ObservableList<ChatGroup> get _chatGroups {
    _$_chatGroupsAtom.reportRead();
    return super._chatGroups;
  }

  @override
  set _chatGroups(ObservableList<ChatGroup> value) {
    _$_chatGroupsAtom.reportWrite(value, super._chatGroups, () {
      super._chatGroups = value;
    });
  }

  late final _$_perPageAtom =
      Atom(name: 'ChatGroupStoreBase._perPage', context: context);

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
      Atom(name: 'ChatGroupStoreBase._nextPage', context: context);

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
      Atom(name: 'ChatGroupStoreBase._canLoadMore', context: context);

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
      Atom(name: 'ChatGroupStoreBase._include', context: context);

  @override
  ObservableList<ChatGroup> get _include {
    _$_includeAtom.reportRead();
    return super._include;
  }

  @override
  set _include(ObservableList<ChatGroup> value) {
    _$_includeAtom.reportWrite(value, super._include, () {
      super._include = value;
    });
  }

  late final _$_excludeAtom =
      Atom(name: 'ChatGroupStoreBase._exclude', context: context);

  @override
  ObservableList<ChatGroup> get _exclude {
    _$_excludeAtom.reportRead();
    return super._exclude;
  }

  @override
  set _exclude(ObservableList<ChatGroup> value) {
    _$_excludeAtom.reportWrite(value, super._exclude, () {
      super._exclude = value;
    });
  }

  late final _$_searchAtom =
      Atom(name: 'ChatGroupStoreBase._search', context: context);

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
      Atom(name: 'ChatGroupStoreBase.pending', context: context);

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

  late final _$getChatGroupsAsyncAction =
      AsyncAction('ChatGroupStoreBase.getChatGroups', context: context);

  @override
  Future<List<ChatGroup>> getChatGroups({bool cancelPrevious = false}) {
    return _$getChatGroupsAsyncAction
        .run(() => super.getChatGroups(cancelPrevious: cancelPrevious));
  }

  late final _$ChatGroupStoreBaseActionController =
      ActionController(name: 'ChatGroupStoreBase', context: context);

  @override
  Future<void> refresh() {
    final _$actionInfo = _$ChatGroupStoreBaseActionController.startAction(
        name: 'ChatGroupStoreBase.refresh');
    try {
      return super.refresh();
    } finally {
      _$ChatGroupStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void onChanged(
      {List<ChatGroup>? include, List<ChatGroup>? exclude, String? search}) {
    final _$actionInfo = _$ChatGroupStoreBaseActionController.startAction(
        name: 'ChatGroupStoreBase.onChanged');
    try {
      return super
          .onChanged(include: include, exclude: exclude, search: search);
    } finally {
      _$ChatGroupStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
fetchChatGroupsFuture: ${fetchChatGroupsFuture},
pending: ${pending},
loading: ${loading},
nextPage: ${nextPage},
chatGroups: ${chatGroups},
canLoadMore: ${canLoadMore},
perPage: ${perPage},
search: ${search}
    ''';
  }
}
