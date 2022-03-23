import 'package:bloc/bloc.dart';

/// {@template counter_observer}
/// [BlocObserver] for the application which
/// observes all state changes.
/// {@endtemplate}
class MyBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    print('${bloc.runtimeType} $change');
  }
}