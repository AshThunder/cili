import 'package:cirilla/mixins/mixins.dart';
import 'package:cirilla/store/store.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/models.dart';
import 'stores/stores.dart';

import 'widgets/widgets.dart';

class ChatBuddyMessageForm extends StatefulWidget {
  final Function callback;

  const ChatBuddyMessageForm({
    super.key,
    required this.callback,
  });

  @override
  State<ChatBuddyMessageForm> createState() => _ChatBuddyMessageListState();
}

class _ChatBuddyMessageListState extends State<ChatBuddyMessageForm> with AppBarMixin, LoadingMixin, SnackMixin {
  late SettingStore _settingStore;
  late ChatMessageStore _chatMessageStore;

  final _formKey = GlobalKey<FormState>();

  List<ChatUser> _send = [];
  final _txtSubject = TextEditingController();
  final _txtMessage = TextEditingController();

  FocusNode? _messageFocusNode;

  bool _loading = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _settingStore = Provider.of<SettingStore>(context);
    _chatMessageStore = ChatMessageStore(_settingStore.requestHelper);
  }

  @override
  void dispose() {
    _txtSubject.dispose();
    _txtMessage.dispose();
    _messageFocusNode?.dispose();
    super.dispose();
  }

  void _handleChat() async {
    try {
      setState(() {
        _loading = true;
      });
      Map<String, dynamic> data = {
        "context": "edit",
        "subject": _txtSubject.text,
        "message": _txtMessage.text,
        "recipients": _send.map((e) => e.id).toList(),
      };
      await _chatMessageStore.createMessage(
        data: data,
      );
      setState(() {
        _loading = false;
      });
      if (mounted) showSuccess(context, "Compose successfully");
      widget.callback();
    } catch (e) {
      setState(() {
        _loading = false;
      });
      if (mounted) showError(context, e);
    }
  }

  void _handleReset() async {
    if (!_loading) {
      _txtMessage.clear();
      _txtSubject.clear();
      setState(() {
        _send = [];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: baseStyleAppBar(
        context,
        title: "Compose",
        actions: [
          SizedBox(
            height: 34,
            child: TextButton(onPressed: _handleReset, child: const Text('Reset')),
          ),
          const SizedBox(width: 12),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              MessageFormSend(
                users: _send,
                onchangeUser: (List<ChatUser> data) => setState(() {
                  _send = data;
                }),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _txtSubject,
                decoration: const InputDecoration(
                  labelText: "Subject",
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Fill field";
                  }
                  return null;
                },
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (value) {
                  FocusScope.of(context).requestFocus(_messageFocusNode);
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _txtMessage,
                focusNode: _messageFocusNode,
                decoration: const InputDecoration(
                  labelText: "Message",
                ),
                maxLines: 5,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Fill field";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (!_loading && _formKey.currentState!.validate()) {
                      if (_send.isEmpty) {
                        showError(context, "Select Send");
                      } else {
                        _handleChat();
                      }
                    }
                  },
                  child: _loading
                      ? entryLoading(
                          context,
                          color: Theme.of(context).colorScheme.onPrimary,
                        )
                      : const Text('Send'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
