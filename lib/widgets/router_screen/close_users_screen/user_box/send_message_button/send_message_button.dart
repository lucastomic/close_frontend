import 'package:flutter/material.dart';

class SendMessageButton extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
	  return MaterialButton(
        onPressed: _onPressed,
        child: Container(
			padding: const EdgeInsets.all(5),
          	margin: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
				  "Enviar mensaje",
              style: TextStyle(color: Theme.of(context).colorScheme.secondary),
            )
        ),
	  );
	}

	void _onPressed(){

	}
}
