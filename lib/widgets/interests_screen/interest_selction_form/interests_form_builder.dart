import 'package:close_frontend/services/interests_service/interest_service_port.dart';
import 'package:close_frontend/widgets/interests_screen/interest_selction_form/interest_checkers_manager/interest_checker_manager_port.dart';
import 'package:close_frontend/widgets/interests_screen/interest_selction_form/interests_form.dart';
import 'package:close_frontend/widgets/util_widgets/centred_circular_progress_indicator.dart';
import 'package:flutter/material.dart';

class InterestsFormBuilder extends StatefulWidget {
  final IInterestService _interestService;
  final IInterestCheckerManager _checkerFactory;
  final String? _nextPage;

  const InterestsFormBuilder(
    this._interestService, 
    this._checkerFactory,
    {
      String? nextPage //If it's omitted it will Pop to the previous page as default
    }
  ):_nextPage = nextPage;

  @override
  State<InterestsFormBuilder> createState() => _InterestsFormBuilderState();
}

class _InterestsFormBuilderState extends State<InterestsFormBuilder> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: widget._checkerFactory.getInterestCheckers(context),
      builder: (context, snapshot) {
        if(snapshot.data == null){
          return const CentredCircularProgressIndicator();
        }else{
          return InterestsForm(
            snapshot.data!, 
            widget._interestService,
            widget._nextPage,
            widget._checkerFactory
          );
        }
      }
    );
  }
}
