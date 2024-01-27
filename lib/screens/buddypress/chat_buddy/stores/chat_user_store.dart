import 'package:cirilla/service/helpers/request_helper.dart';
import 'package:cirilla/utils/debug.dart';
import 'package:dio/dio.dart';
import 'package:mobx/mobx.dart';

import '../models/models.dart';

part 'chat_user_store.g.dart';

class ChatUserStore = ChatUserStoreBase with _$ChatUserStore;

abstract class ChatUserStoreBase with Store {
  final String? key;

  // Request helper instance
  final RequestHelper _requestHelper;
  CancelToken _token = CancelToken();

  // store for handling errors
  // final ErrorStore errorStore = ErrorStore();

  // constructor:---------------------------------------------------------------
  ChatUserStoreBase(
    this._requestHelper, {
    this.key,
    int? perPage,
    int? page,
    List<ChatUser>? include,
    List<ChatUser>? exclude,
    String? search,
  }) {
    if (page != null) _nextPage = page;
    if (perPage != null) _perPage = perPage;
    if (include != null) _include = ObservableList<ChatUser>.of(include);
    if (exclude != null) _exclude = ObservableList<ChatUser>.of(exclude);
    if (search != null) _search = search;
    _reaction();
  }

  // store variables:-----------------------------------------------------------
  static ObservableFuture<List<ChatUser>> emptyChatUserResponse = ObservableFuture.value([]);

  @observable
  ObservableFuture<List<ChatUser>?> fetchChatUsersFuture = emptyChatUserResponse;

  @observable
  ObservableList<ChatUser> _chatUsers = ObservableList<ChatUser>.of([]);

  @observable
  int _perPage = 10;

  @observable
  int _nextPage = 1;

  @observable
  bool _canLoadMore = true;

  @observable
  ObservableList<ChatUser> _include = ObservableList<ChatUser>.of([]);

  @observable
  ObservableList<ChatUser> _exclude = ObservableList<ChatUser>.of([]);

  @observable
  String _search = "";

  // computed:-------------------------------------------------------------------
  @computed
  bool get loading => fetchChatUsersFuture.status == FutureStatus.pending;

  @observable
  bool pending = false;

  @computed
  int get nextPage => _nextPage;

  @computed
  ObservableList<ChatUser> get chatUsers => _chatUsers;

  @computed
  bool get canLoadMore => _canLoadMore;

  @computed
  int get perPage => _perPage;

  @computed
  String get search => _search;

  // actions:-------------------------------------------------------------------
  @action
  Future<List<ChatUser>> getChatUsers({bool cancelPrevious = false}) async {
    if (cancelPrevious) {
      _token.cancel("cancel");
      _token = CancelToken();
    }
    if (pending) {
      return ObservableList<ChatUser>.of([]);
    }

    pending = true;

    Map<String, dynamic> qs = {
      "page": _nextPage,
      "per_page": _perPage,
      "include": _include.map((e) => e.id).toList().join(','),
      "exclude": _exclude.map((e) => e.id).toList().join(','),
      "search": _search,
    };

    final future = _requestHelper.getChatUsers(queryParameters: qs, cancelToken: _token);
    fetchChatUsersFuture = ObservableFuture(future);
    return future.then((data) {
      // Replace state in the first time or refresh
      if (_nextPage <= 1) {
        _chatUsers = ObservableList<ChatUser>.of(data!);
      } else {
        // Add posts when load more page
        _chatUsers.addAll(ObservableList<ChatUser>.of(data!));
      }

      // Check if can load more item
      if (data.length >= _perPage) {
        _nextPage++;
      } else {
        _canLoadMore = false;
      }

      pending = false;
      return _chatUsers;
    }).catchError((error) {
      pending = false;
      _canLoadMore = false;
      avoidPrint(error);
      throw error;
    });
  }

  @action
  Future<void> refresh() {
    pending = false;
    _canLoadMore = true;
    _nextPage = 1;
    _chatUsers.clear();
    return getChatUsers(cancelPrevious: true);
  }

  @action
  void onChanged({List<ChatUser>? include, List<ChatUser>? exclude, String? search}) {
    if (include != null) {
      _include = ObservableList<ChatUser>.of(include);
    }
    if (exclude != null) {
      _exclude = ObservableList<ChatUser>.of(exclude);
    }
    if (search != null) {
      _search = search;
    }
  }

  // disposers:-----------------------------------------------------------------
  late List<ReactionDisposer> _disposers;

  void _reaction() {
    _disposers = [
      reaction((_) => _search, (dynamic search) {
        refresh();
      }),
    ];
  }

  void dispose() {
    for (final d in _disposers) {
      d();
    }
    _token.cancel("cancel");
  }
}
