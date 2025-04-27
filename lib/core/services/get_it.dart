import 'package:fruits_hub/core/services/dataBase/database_sevices.dart';
import 'package:fruits_hub/core/services/fireBase/firebase_auth_service.dart';
import 'package:fruits_hub/core/services/fireBase/firestore_service.dart';
import 'package:fruits_hub/features/auth/data/repo/auth_repo_impl.dart';
import 'package:fruits_hub/features/auth/domain/repo/auth_repo.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  getIt.registerSingleton<FirebaseAuthService>(FirebaseAuthService());
  getIt.registerSingleton<DataBaseServices>(FireStoreService());
  getIt.registerSingleton<AuthRepo>(
    AuthRepoImpl(
      firebaseAuthService: getIt<FirebaseAuthService>(),
      dataBaseServices: getIt<DataBaseServices>(),
    ),
  );
}
