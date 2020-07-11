import 'package:flutter/widgets.dart';
import 'package:starter_app/screens/home_screen.dart';

const String HomeRoute = '/home';
const String ContactRoute = '/contact';
const String AboutRoute = '/about';
const String SubmitRoute = '/submit';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case HomeRoute:
      return _getPageRoute(HomeScreen(), settings);
    default:
      return _getPageRoute(HomeScreen(), settings);
  }
}

Route _getPageRoute(Widget child, RouteSettings settings) {
  /// You can use Material Page Route or your Custom Route here
  return _FadeRoute(child: child, routeName: settings.name);
}

class _FadeRoute extends PageRouteBuilder {
  final Widget child;
  final String routeName;

  _FadeRoute({this.child, this.routeName})
      : super(
          settings: RouteSettings(name: routeName),
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              child,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              FadeTransition(
            opacity: animation,
            child: child,
          ),
        );
}
