import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class CurrentPageProvider extends ChangeNotifier{
  Widget? _currentPage;
  late Widget _defaultPage;

  set currentPage(Widget page){
    notifyListeners();
    _currentPage = page;
  }

  void goToDefaultPage(){
    notifyListeners();
    _currentPage = _defaultPage;
  }

  set defaultAndCurrentPage(Widget page){
    _defaultPage = page;
    _currentPage = page;
  }

  Widget get currentPage{
    return _currentPage ?? _defaultPage;
  }
}