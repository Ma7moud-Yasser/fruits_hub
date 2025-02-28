import 'package:fruits_hub/core/services/base_api_service.dart';

class AuthRepository {
  final BaseApiService apiService;

  AuthRepository({required this.apiService});

  Future<void> login(String email, String password) =>
      apiService.login(email, password);
  Future<void> register(String email, String password) =>
      apiService.register(email, password);
  Future<void> getUserData() => apiService.getUserData();
}
