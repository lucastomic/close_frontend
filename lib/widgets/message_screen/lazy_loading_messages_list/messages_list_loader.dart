import 'package:close_frontend/domain/chat/chat.dart';
import 'package:close_frontend/domain/chat/message.dart';

class MessagesListLoader{
  final List<Message> _messagesLoaded = [];
  final Chat _chat;
  final int _maxMessagesAddedPerWave = 20;
  int _nextMessageToLoadIndex = 0;
  int _messagesAddedThisWave = 0;

  MessagesListLoader(this._chat);

  List<Message> get messages{
    return _messagesLoaded;
  }
  int get messagesLoaded{
    return _messagesLoaded.length;
  }

  void loadMessages(){
    if(_areMoreMessagesToLoad()){
      _addMessagesWave();
    }
  }

  void _addMessagesWave(){
    while(_continueAdding()){
      _addMessage();
    }
    _resetMessagesAddedThisWave();
  }

  bool _continueAdding(){
     return _maxMessagesAddedPerWaveNotReached() && _areMoreMessagesToLoad();
  }

  void _addMessage(){
    Message message = _chat.getMessageStartingFromLast(_nextMessageToLoadIndex++);
    _messagesLoaded.add(message);
    _messagesAddedThisWave++;
  }

  bool _areMoreMessagesToLoad(){
    return _nextMessageToLoadIndex < _chat.amountOfMessages;
  }

  bool _maxMessagesAddedPerWaveNotReached(){
    return _messagesAddedThisWave < _maxMessagesAddedPerWave;
  }

  void _resetMessagesAddedThisWave(){
    _messagesAddedThisWave = 0;
  }

}