import 'package:e_learning/core/services/facebook_service.dart';
import 'package:e_learning/core/services/google_service.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void serviceLocator (){
  getIt.registerSingleton<GoogleService>(GoogleService());
  getIt.registerSingleton<FaceBookService>(FaceBookService());
}