import 'dart:async';
import 'dart:developer';
import 'package:flutter/widgets.dart';
import 'package:todos_api/todos_api.dart';
import 'package:todos_repository/todos_repository.dart';
import 'app/app.dart';

void bootstrap({required TodosApi todosApi}) {
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  // Bloc.observer = const AppBlocObserver();

  final todosRepository = TodosRepository(todosApi: todosApi);

  runZonedGuarded(
    () => runApp(App(todosRepository: todosRepository)),
    (error, stackTrace) => log(error.toString(), stackTrace: stackTrace),
  );
}
