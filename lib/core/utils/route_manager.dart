import 'package:flutter/material.dart';

changeRoutePush(BuildContext context, Widget page) {
  Navigator.of(context).push(MaterialPageRoute(builder: (context) => page));
}

changeRoutePushPlacement(BuildContext context, Widget page) {
  Navigator.of(context)
      .pushReplacement(MaterialPageRoute(builder: (context) => page));
}

changeRouteRemove(BuildContext context, Widget page) {
  Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (_) => page), (route) => false);
}
