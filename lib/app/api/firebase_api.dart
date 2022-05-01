import 'package:assets_control_app/app/models/invoice_model.dart';
import 'package:assets_control_app/app/models/location_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseAPI {
  createOrUpdateDocument({
    required String collection,
    required String documentID,
    required Map<String, dynamic> documentMap,
  }) {
    try {
      // if documentID exist in Firebase, update document, else, create document
      FirebaseFirestore.instance
          .collection(collection)
          .doc(documentID)
          .set(documentMap);
    } on FirebaseException catch (e) {
      print(e);
    }
  }

  updateDocument({
    required String collection,
    required String documentID,
    required String key,
    required String value,
  }) {
    try {
      FirebaseFirestore.instance.collection(collection).doc(documentID).update(
        {
          key: value,
        },
      );
    } on FirebaseException catch (e) {
      print(e);
    }
  }

  deleteDocument({
    required String collection,
    required String documentID,
  }) {
    try {
      FirebaseFirestore.instance
          .collection(collection)
          .doc(documentID)
          .delete();
    } on FirebaseException catch (e) {
      print(e);
    }
  }

  streamCollection({required String collection}) {
    if (collection == "Location") {
      return FirebaseFirestore.instance
          .collection(collection)
          .orderBy("id", descending: true)
          .snapshots()
          .map(
            (snapshot) => snapshot.docs
                .map(
                  // collectionModel
                  (map) => LocationModel(
                    map["id"],
                    map["company"],
                    map["segment"],
                    map["segment_of_origin_purchase"],
                    map["region"],
                    map["site_of_origin_purchase"],
                    map["location"],
                    map["stockroom"],
                    map["managed_by"],
                  ),
                )
                .toList(),
          );
    }
    if (collection == "Invoice") {
      return FirebaseFirestore.instance
          .collection(collection)
          .orderBy("id", descending: true)
          .snapshots()
          .map(
            (snapshot) => snapshot.docs
                .map(
                  // collectionModel
                  (map) => InvoiceModel(
                    map["id"],
                    map["invoice_number"],
                    map["vendor"],
                    map["model_category"],
                    map["model"],
                    map["assets_quantity"],
                    map["cost"],
                    map["cost_center"],
                    map["gl_account"],
                    map["po_number"],
                  ),
                )
                .toList(),
          );
    }
  }
}
