import 'package:flutter/cupertino.dart';
import 'package:flutter_api_auth/screens/blocs/form_bloc.dart';

class Provider extends InheritedWidget {
  final bloc = new FormBloc();

  Provider({Key key, Widget child}) : super(key: key, child: child);

  @override
  bool updateShouldNotify(covariant InheritedWidget _) {
    return true;
  }

  static FormBloc of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(Provider) as Provider).bloc;
  }
}
