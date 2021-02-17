import 'package:flutter/cupertino.dart';

class ErrorText extends StatelessWidget {
  final String message;

  const ErrorText({@required this.message});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(message),
    );
  }
}
