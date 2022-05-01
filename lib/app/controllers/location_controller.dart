import 'package:assets_control_app/app/api/firebase_api.dart';
import 'package:assets_control_app/app/models/location_model.dart';
import 'package:flutter/material.dart';

class LocationController extends ChangeNotifier {
  final _firebaseAPI = FirebaseAPI();
  bool locationEditMode = false;

  LocationModel backupLocationControllers =
      LocationModel("", "", "", "", "", "", "", "", "");
  String locationIDController = "";
  final companyController = TextEditingController(text: "");
  final segmentController = TextEditingController(text: "");
  final segmentPurchaseController = TextEditingController(text: "");
  final regionController = TextEditingController(text: "");
  final sitePurchaseController = TextEditingController(text: "");
  final locationController = TextEditingController(text: "");
  final stockroomController = TextEditingController(text: "");
  final managedByController = TextEditingController(text: "");

  selectLocationDocument(LocationModel locationModel) {
    locationIDController = locationModel.locationID;
    companyController.text = locationModel.company;
    segmentController.text = locationModel.segment;
    segmentPurchaseController.text = locationModel.segment_of_origin_purchase;
    regionController.text = locationModel.region;
    sitePurchaseController.text = locationModel.site_of_origin_purchase;
    locationController.text = locationModel.location;
    stockroomController.text = locationModel.stockroom;
    managedByController.text = locationModel.managed_by;
    // reset editMode
    locationEditMode = false;
    notifyListeners();
  }

  editLocationDocument({bool newDocument = false}) {
    if (newDocument == false) {
      locationEditMode = true;
    }
    backupLocationControllers = LocationModel(
      locationIDController,
      companyController.text,
      segmentController.text,
      segmentPurchaseController.text,
      regionController.text,
      sitePurchaseController.text,
      locationController.text,
      stockroomController.text,
      managedByController.text,
    );
    if (newDocument == true) {
      clearLocationDocument();
    }
    notifyListeners();
  }

  clearLocationDocument() {
    locationIDController = DateTime.now().millisecondsSinceEpoch.toString();
    companyController.text = "";
    segmentController.text = "";
    segmentPurchaseController.text = "";
    regionController.text = "";
    sitePurchaseController.text = "";
    locationController.text = "";
    stockroomController.text = "";
    managedByController.text = "";
    notifyListeners();
  }

  restoreLocationDocument() {
    locationIDController = backupLocationControllers.locationID;
    companyController.text = backupLocationControllers.company;
    segmentController.text = backupLocationControllers.segment;
    segmentPurchaseController.text =
        backupLocationControllers.segment_of_origin_purchase;
    regionController.text = backupLocationControllers.region;
    sitePurchaseController.text =
        backupLocationControllers.site_of_origin_purchase;
    locationController.text = backupLocationControllers.location;
    stockroomController.text = backupLocationControllers.stockroom;
    managedByController.text = backupLocationControllers.managed_by;
    // reset editMode
    locationEditMode = false;
    notifyListeners();
  }

  createOrUpdateLocationDocument() {
    // if documentID exist in Firebase, update document, else, create document
    _firebaseAPI.createOrUpdateDocument(
      collection: "Location",
      documentID: locationIDController,
      documentMap: {
        "id": locationIDController,
        "company": companyController.text,
        "segment": segmentController.text,
        "segment_of_origin_purchase": segmentPurchaseController.text,
        "region": regionController.text,
        "site_of_origin_purchase": sitePurchaseController.text,
        "location": locationController.text,
        "stockroom": stockroomController.text,
        "managed_by": managedByController.text,
      },
    );
    // reset editMode
    locationEditMode = false;
    notifyListeners();
  }

  deleteLocationDocument() {
    _firebaseAPI.deleteDocument(
      collection: "Location",
      documentID: locationIDController,
    );
    // reset editMode
    locationEditMode = false;
    clearLocationDocument();
  }

  streamLocationCollection() {
    return _firebaseAPI.streamCollection(collection: "Location");
  }
}
