import 'package:close_frontend/services/interests_service/interest_service_port.dart';
import 'package:close_frontend/widgets/util_widgets/text_header.dart';
import 'package:flutter/material.dart';

import 'interest_selction_form/interests_selection_form.dart';

class InterestsScreen extends StatelessWidget {
  final IInterestService _interestService;
  InterestsScreen(this._interestService);

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
                    child: InterestSelectionForm(_interestService)
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