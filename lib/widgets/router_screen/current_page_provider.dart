import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class CurrentPageProvider extends ChangeNotifier{
  late Widget _currentPage;

  set currentPage(Widget page){
    notifyListeners();
    _currentPage = page;
  }

  set defaultPage(Widget page){
    _currentPage = page;
  }

  Widget get currentPage{
    return _currentPage;
  }

}