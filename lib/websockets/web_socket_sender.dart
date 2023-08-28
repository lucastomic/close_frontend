import 'package:close_frontend/provider/authentication/auth_provider.dart';
import 'package:close_frontend/services/navigation/navigation_service.dart';
import 'package:provider/provider.dart';
import 'package:stomp_dart_client/stomp.dart';
import 'package:stomp_dart_client/stomp_config.dart';

class WebSocketSender{
  final String _url;
  final String _destination;
  StompClient? _client;

  WebSocketSender({required String destination,required String url}): _destination = destination, _url = url
  {
    _initalizeWebSocketConnection();
  }

  void send({
      Map<String, String>? headers,
      required String body,
  }) async {
    if(_client == null)_initalizeWebSocketConnection();
    _client!.send(destination: _destination,body: body, headers: headers);
  }

  void close(){
    _client?.deactivate();
    _client = null;
  }

  void _initalizeWebSocketConnection(){
    String authenticationToken = _getAuthenticationToken();
    _initClient(authenticationToken);
    _client!.activate();
  }

  String _getAuthenticationToken(){
    AuthenticationProvider provider =  _getAuthenticationProvider();
    return provider.authenticationToken;
  }

  void _initClient(String authenticationToken){
    _client = StompClient(
      config: StompConfig(
        webSocketConnectHeaders: {
          "Authorization": "Bearer $authenticationToken}"
        },
        url:_url,
      )
    );

  }

  AuthenticationProvider _getAuthenticationProvider(){
    return NavigationService.navigatorKey.currentContext!.read<AuthenticationProvider>();  
  }
}
