import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firestore_service/models/firestorException.model.dart';

import 'package:get/get.dart';

class FirestoreService extends GetxService {
  // define
  static FirestoreService get to => Get.find();

  //define instance
  final FirebaseFirestore instance = FirebaseFirestore.instance;

  Future<FirestoreService> init() async {
    // enable offline for all devices
    instance.settings = const Settings(persistenceEnabled: true);

    return this;
  }

  // Handel FireStore Exception
  FireStoreException exceptionHandel(dynamic err) => FireStoreException(
        title: err?.code ?? 'Error',
        message: err?.message ?? "Something went wrong",
      );
}
