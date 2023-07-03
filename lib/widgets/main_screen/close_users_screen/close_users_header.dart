import 'package:flutter/material.dart';

class CloseUsersHeader extends StatelessWidget {
  final EdgeInsets _margin = const EdgeInsets.symmetric(vertical:25);

  @override
  Widget build(BuildContext context) {
	return Container(
	  margin: _margin,
	  child: RichText(
	    text: TextSpan(
	      text: 'Usuarios',
	      style: TextStyle(
			fontSize: 25, 
			color: Theme.of(context).colorScheme.secondary
		  ),
	      children: <TextSpan>[
	        TextSpan(
			  text: ' cercanos', 
			  style: TextStyle(
				fontWeight: FontWeight.bold,
				color: Theme.of(context).colorScheme.primary
			  )
			),
		  ],
	    ),
	  )
	);
  }
}
