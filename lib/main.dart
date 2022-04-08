import 'dart:async';

import 'package:bytebank/app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() async {
  //diz para o FLUTTER que voce vai rodar algo ASYNC e isso vai garantir
  //que ele vai esperar para executar o RUN APP
  WidgetsFlutterBinding.ensureInitialized();

  //iniciando FIREBASE
  await Firebase.initializeApp();

  //verifica se o APP esta em modo DEBUG
  if (kDebugMode) {
    //vai desativar o Crashlytics em modo DEBUG, ou seja em desenvolvimento
    await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(false);
  } else {
    //vai ativar o Crashlytics em NAO DEBUG
    await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
  }

  // ele vai MONITORAR os ERROS que FLUTTER nao consegue pegar
  //como por exemplos ERROS do DART nao conseguir compilar
  runZonedGuarded<Future<void>>(() async {
    return runApp(const App());
  }, (error, stack) => FirebaseCrashlytics.instance.recordError(error, stack));
}
