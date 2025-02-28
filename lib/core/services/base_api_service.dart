abstract class BaseApiService {
  Future<void> login(String email, String password);
  Future<void> register(String email, String password);
  Future<void> getUserData();
}
