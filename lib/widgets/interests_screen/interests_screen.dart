import 'package:close_frontend/services/interests_service/interest_service_port.dart';
import 'package:close_frontend/widgets/interests_screen/interest_selction_form/interest_checkers_manager/interest_checker_manager_port.dart';
import 'package:close_frontend/widgets/interests_screen/interest_selction_form/interests_form_builder.dart';
import 'package:close_frontend/widgets/util_widgets/text_header.dart';
import 'package:flutter/material.dart';

class InterestsScreen extends StatelessWidget {
  final IInterestService _interestService;
  final IInterestCheckerManager _checkerFactory;
  final String? _nextPage;
  InterestsScreen(this._interestService,this._checkerFactory,{String? nextPage}):_nextPage = nextPage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                children: [
                  const TextHeader("¡Sube  los intereses que quieras mostrar al resto!"),
                  Expanded(
                    child: InterestsFormBuilder(_interestService,_checkerFactory, nextPage: _nextPage,)
                  ) ,
                ],
              ),
            ),
          ],
        )
      )
    );
  }
}