import 'package:cloud_firestore/cloud_firestore.dart';

/// RepositoryFirestore is a generic repository for Firestore operations
/// It provides methods to interact with a Firestore collection

class FirestoreRepository{
  // Initialize the repository with a collection reference
  late CollectionReference ref;

  // get stream of documents in the collection
  Stream<QuerySnapshot> stream(String uid) => ref.snapshots();

  // get all documents in the collection
  Future<DocumentSnapshot?> get(String id) => ref.doc(id).get();

  // Create|Update or set a document in the collection with merge option
  Future<void> set(
          {required String id, required Map<String, dynamic> data}) async =>
      await ref.doc(id).set(data, SetOptions(merge: true));

  // Delete a document in the collection
  Future<void> delete(String id) => ref.doc(id).delete();
}
