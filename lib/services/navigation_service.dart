import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NavigatorService {
  Future<Object?> navigate(BuildContext context, Widget page) {
    return Navigator.of(context)
        .push(CupertinoPageRoute(builder: (context) => page));
  }

  Future<Object?> providerNavigator<T extends Listenable>(
      BuildContext context, Widget page) {
    final T yourModel = Provider.of<T>(context, listen: false);

    return Navigator.of(context).push(
      CupertinoPageRoute(
        builder: (context) => ListenableProvider<T>.value(
          value: yourModel,
          child: page,
        ),
      ),
    );
  }

  void pop(BuildContext context, {Object? obj}) {
    return Navigator.of(context).pop(obj);
  }

  Future<Object?> replaceNavigate(BuildContext context, Widget page) {
    return Navigator.of(context)
        .pushReplacement(CupertinoPageRoute(builder: (context) => page));
  }

  Future<Object?> clearNavigate(BuildContext context, Widget page) {
    Navigator.of(context).popUntil((route) => route.isFirst);
    return Navigator.of(context)
        .pushReplacement(CupertinoPageRoute(builder: (context) => page));
  }

  void showSnackbar(BuildContext context, String msg,
      {Duration duration = const Duration(milliseconds: 3000)}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: duration,
        content: Text(msg),
      ),
    );
  }
}
