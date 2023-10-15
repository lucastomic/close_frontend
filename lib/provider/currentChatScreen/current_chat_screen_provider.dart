import '../../domain/user/user.dart';

class CurrentChatScreen{
  static User? _currentReceiver;

  static set currentReceiver(User user){
    _currentReceiver = user;
  }

  static void deleteCurrentReceiver(){
    _currentReceiver = null;
  }

  static bool receiverIs(User user){
    if(_currentReceiver == null) return false;
    return user.id == _currentReceiver!.id;
  }
}