import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruits_hub/core/services/base_api_service.dart';

class FirebaseService implements BaseApiService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Future<void> login(String email, String password) async {
    await _auth.signInWithEmailAndPassword(email: email, password: password);
  }

  @override
  Future<void> register(String email, String password) async {
    await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  @override
  Future<void> getUserData() async {
    var user = _auth.currentUser;
    print("User: ${user?.email}");
  }
}
