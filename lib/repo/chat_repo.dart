import 'dart:async';

import 'package:protask/models/models.dart';

class ChatRepo {
  final _controller = StreamController<List<Chat>>();

  Stream<List<Chat>> get getResponse => _controller.stream;

  void addChats(event) {
    List<Chat> chats = event.map<Chat>((e) => Chat.fromJson(e)).toList();

    chats.sort((a, b) => b.time.compareTo(a.time));

    _controller.sink.add(chats);
  }

  void dispose() {
    _controller.close();
  }
}
