import 'package:flutter/material.dart';
import 'package:lesson22/src/bloc/stories_bloc.dart';

class StoriesProvider extends InheritedWidget{
  final StoriesBloc bloc;

  StoriesProvider({Key key, Widget child})
    : bloc = StoriesBloc(),
      super(key: key, child: child);

  bool updateShouldNotify(_) => true;

  static StoriesBloc of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(StoriesProvider) as StoriesProvider).bloc;
  }
}