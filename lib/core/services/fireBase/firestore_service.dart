import 'package:fruits_hub/core/services/dataBase/database_sevices.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FireStoreService implements DataBaseServices {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  @override
  Future<void> addData({
    required String path,
    required Map<String, dynamic> data,
    String? documentId,
  }) async {
    if (documentId != null) {
      await firestore.collection(path).doc(documentId).set(data);
    }
    await firestore.collection(path).add(data);
  }

  @override
  Future<Map<String, dynamic>> getData({
    required String path,
    required String documentId,
  }) async {
    var userData = await firestore.collection(path).doc(documentId).get();
    return userData.data() as Map<String, dynamic>;
  }

  @override
  Future<bool> checkIfDocumentExists({
    required String path,
    required String documentId,
  }) async {
    var userData = await firestore.collection(path).doc(documentId).get();
    return userData.exists;
  }
}
