import 'package:flutter/material.dart';
import 'package:my_flutter_app/pages/ChatScreen.dart';
import 'package:my_flutter_app/pages/home_page.dart';
import 'package:my_flutter_app/pages/login_page.dart';
import 'package:my_flutter_app/pages/splash_screen_page.dart';
import 'package:my_flutter_app/pages/tabs/ContactsPage.dart';

var routes = <String, WidgetBuilder>{
  "/login": (BuildContext context) => LoginPage(),
  "/chat": (BuildContext context) => ChatScreen(),
  "/home": (BuildContext context) => HomePage() ,
  "/contacts": (BuildContext context) => ContactsPage() ,
};

void main() => runApp(new MaterialApp(
    theme:
    ThemeData( primarySwatch: Colors.blue,),
    debugShowCheckedModeBanner: false,
    home: SplashScreen(),
//    onGenerateRoute: (RouteSettings settings) {
//      switch (settings.name) {
//        case '/about': return new FromRightToLeft(
//          builder: (_) => new _aboutPage.About(),
//          settings: settings,
//        );
//        case '/support': return new FromRightToLeft(
//          builder: (_) => new _supportPage.Support(),
//          settings: settings,
//        );
//      }
//    } ,
    routes: routes)

);

class FromRightToLeft<T> extends MaterialPageRoute<T> {
  FromRightToLeft({ WidgetBuilder builder, RouteSettings settings })
      : super(builder: builder, settings: settings);

  @override
  Widget buildTransitions(
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child) {

    if (settings.isInitialRoute)
      return child;

    return new SlideTransition(
      child: new Container(
        decoration: new BoxDecoration(
            boxShadow: [
              new BoxShadow(
                color: Colors.black26,
                blurRadius: 25.0,
              )
            ]
        ),
        child: child,
      ),
      position: new Tween<Offset>(
        begin: const Offset(1.0, 0.0),
        end: Offset.zero,
      )
          .animate(
          new CurvedAnimation(
            parent: animation,
            curve: Curves.fastOutSlowIn,
          )
      ),
    );
  }
  @override Duration get transitionDuration => const Duration(milliseconds: 400);
}