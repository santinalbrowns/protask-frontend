import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:protask/models/chat.dart';
import 'package:protask/repo/chat_repo.dart';
import 'package:socket_io_client/socket_io_client.dart';

part 'chats_event.dart';
part 'chats_state.dart';

class ChatsBloc extends Bloc<ChatsEvent, ChatsState> {
  final ChatRepo chatRepo;

  ChatsBloc(this.chatRepo) : super(ChatsInitial()) {
    String token =
        "eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjYyYzQ2MzdkYTU0ZTQ1OTljM2I3NWY5MSIsImlhdCI6MTY1NzgxMTI5OSwiZXhwIjoxNjYwNDAzMjk5fQ.maKHaYyJPf8axIiCWTCt11REQ90-yxJ_4mqb0v6o2QQ0lXy7YhX9KbxEQZCnt0K7QYOAhkvIDPSyzcmFxpe2tyLXTRzWdM2E6vvFAmYmibxlaDF5Ys-JSKI5cq_vARaa9-dx-UXv0fSgKFfDFHXVadVv8sm6Kjod_aCTdMddhTM";

    Socket socket = io(
      'http://localhost:5000',
      OptionBuilder().setTransports(['websocket']).setExtraHeaders(
          {HttpHeaders.authorizationHeader: 'Bearer $token'}).build(),
    );

    socket.onConnect((_) => print('Socket connected'));

    socket.onDisconnect((_) => print('disconnect'));

    socket.on('message', (data) => chatRepo.addChats(data));

    socket.on('chats', (data) => chatRepo.addChats(data));

    /* socket.on('chats', (data) {
      List<Chat> chats = data.map<Chat>((e) => Chat.fromJson(e)).toList();

      chats.sort((a, b) => b.time.compareTo(a.time));

      add(ChatsData(chats));
    }); */

    _streamSubscription =
        chatRepo.getResponse.listen((event) => add(ChatsData(event)));

    on<ChatsEvent>((event, emit) async {
      if (event is ChatsData) {
        emit(ChatsLoaded(event.chats));
      }
    });
  }

  late StreamSubscription _streamSubscription;
  //late StreamSubscription _sub;

  @override
  Future<void> close() {
    _streamSubscription.cancel();
    chatRepo.dispose();
    return super.close();
  }
}
