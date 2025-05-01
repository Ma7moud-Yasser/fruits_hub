abstract class DataBaseServices {
  Future<void> addData({
    required String path,
    String? documentId,
    required Map<String, dynamic> data,
  });

  Future<Map<String, dynamic>> getData({
    required String path,
    required String documentId,
  });

  Future<bool> checkIfDocumentExists({
    required String path,
    required String documentId,
  });
}
