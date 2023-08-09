import 'package:flutter/material.dart';


class DecoratedButton extends StatelessWidget {
  final String _text;
  Decoration? _boxDecoration;
  final bool _formIsLoading;
  final void Function()? _onPressed;
  late final  Color _textColor;
  final BorderRadius _borderRadius =  BorderRadius.circular(15);

  /// Context must be passed to access to theme. If there is any better way to do this, please change.
  DecoratedButton.primaryColor({required BuildContext context, required String text, void Function()? onPressed, bool formIsLoading = false})
      : _text = text,
        _formIsLoading = formIsLoading,
        _onPressed = onPressed
        {
        _textColor = Theme.of(context).primaryColor;
         _boxDecoration = BoxDecoration(
            borderRadius: _borderRadius,
            color: Theme.of(context).colorScheme.primary, 
          );
        }

  DecoratedButton.hollow({required BuildContext context, required String text, void Function()? onPressed, bool formIsLoading = false})
      : _text = text,
        _formIsLoading = formIsLoading,
        _onPressed = onPressed
        {
          _textColor = Theme.of(context).colorScheme.primary;
          _boxDecoration = BoxDecoration(
            color: Theme.of(context).colorScheme.background,
            borderRadius:_borderRadius,
            border: Border.all(width: 2, color: Theme.of(context).colorScheme.primary),
          );
        }

  DecoratedButton.dangerous({required BuildContext context, required String text, void Function()? onPressed, bool formIsLoading = false})
      : _text = text,
        _formIsLoading = formIsLoading,
        _onPressed = onPressed
        {
        _textColor = Theme.of(context).primaryColor;
         _boxDecoration = BoxDecoration(
            borderRadius: _borderRadius,
            color: Theme.of(context).colorScheme.error, 
          );
        }

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: _formIsLoading ? null : _onPressed,
      child: Container(
          padding: const EdgeInsets.symmetric(vertical:12),
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: _boxDecoration,
          child: Center(
              child: Text(
                _formIsLoading ? 'Espere' : _text,
                style: TextStyle(color: _textColor),
                textAlign: TextAlign.center,
              )
          )
      ),
    );
  }
}
