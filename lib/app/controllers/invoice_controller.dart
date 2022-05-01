import 'package:assets_control_app/app/models/invoice_model.dart';
import 'package:flutter/material.dart';
import 'package:assets_control_app/app/api/firebase_api.dart';

class InvoiceController extends ChangeNotifier {
  final _firebaseAPI = FirebaseAPI();
  bool invoiceEditMode = false;

  /* to prevent issues in the asset process, the editMode of 
  the assetsQuantity is disabled after being defined. to edit
  it, the user needs to create a new Invoice document. */
  bool disableEditModeAssetsQuantity = true;

  InvoiceModel backupInvoiceControllers =
      InvoiceModel("", "", "", "", "", "", "", "", "", "");
  String invoiceIDController = "";
  final invoiceNumberController = TextEditingController(text: "");
  final vendorController = TextEditingController(text: "");
  final modelCategoryController = TextEditingController(text: "");
  final modelController = TextEditingController(text: "");
  final assetsQuantityController = TextEditingController(text: "");
  final costController = TextEditingController(text: "");
  final costCenterController = TextEditingController(text: "");
  final glAccountController = TextEditingController(text: "");
  final poNumberController = TextEditingController(text: "");

  selectInvoiceDocument(InvoiceModel invoiceModel) {
    invoiceIDController = invoiceModel.invoiceID;
    invoiceNumberController.text = invoiceModel.invoice_number;
    vendorController.text = invoiceModel.vendor;
    modelCategoryController.text = invoiceModel.model_category;
    modelController.text = invoiceModel.model;
    assetsQuantityController.text = invoiceModel.assets_quantity;
    costController.text = invoiceModel.cost;
    costCenterController.text = invoiceModel.cost_center;
    glAccountController.text = invoiceModel.gl_account;
    poNumberController.text = invoiceModel.po_number;
    // reset editMode
    invoiceEditMode = false;
    disableEditModeAssetsQuantity = true;
    notifyListeners();
  }

  editInvoiceDocument({bool newDocument = false}) {
    if (newDocument == false) {
      invoiceEditMode = true;
    }
    backupInvoiceControllers = InvoiceModel(
      invoiceIDController,
      invoiceNumberController.text,
      vendorController.text,
      modelCategoryController.text,
      modelController.text,
      assetsQuantityController.text,
      costController.text,
      costCenterController.text,
      glAccountController.text,
      poNumberController.text,
    );
    if (newDocument == true) {
      disableEditModeAssetsQuantity = false;
      clearInvoiceDocument();
    }
    notifyListeners();
  }

  clearInvoiceDocument() {
    invoiceIDController = DateTime.now().millisecondsSinceEpoch.toString();
    invoiceNumberController.text = "";
    vendorController.text = "";
    modelCategoryController.text = "";
    modelController.text = "";
    assetsQuantityController.text = "";
    costController.text = "";
    costCenterController.text = "";
    glAccountController.text = "";
    poNumberController.text = "";
    notifyListeners();
  }

  restoreInvoiceDocument() {
    invoiceIDController = backupInvoiceControllers.invoiceID;
    invoiceNumberController.text = backupInvoiceControllers.invoice_number;
    vendorController.text = backupInvoiceControllers.vendor;
    modelCategoryController.text = backupInvoiceControllers.model_category;
    modelController.text = backupInvoiceControllers.model;
    assetsQuantityController.text = backupInvoiceControllers.assets_quantity;
    costController.text = backupInvoiceControllers.cost;
    costCenterController.text = backupInvoiceControllers.cost_center;
    glAccountController.text = backupInvoiceControllers.gl_account;
    poNumberController.text = backupInvoiceControllers.po_number;
    // reset editMode
    invoiceEditMode = false;
    disableEditModeAssetsQuantity = true;
    notifyListeners();
  }

  createOrUpdateInvoiceDocument() {
    // if documentID exist in Firebase, update document, else, create document
    _firebaseAPI.createOrUpdateDocument(
      collection: "Invoice",
      documentID: invoiceIDController,
      documentMap: {
        "id": invoiceIDController,
        "invoice_number": invoiceNumberController.text,
        "vendor": vendorController.text,
        "model_category": modelCategoryController.text,
        "model": modelController.text,
        "assets_quantity": assetsQuantityController.text,
        "cost": costController.text,
        "cost_center": costCenterController.text,
        "gl_account": glAccountController.text,
        "po_number": poNumberController.text,
      },
    );
    // reset editMode
    invoiceEditMode = false;
    disableEditModeAssetsQuantity = true;
    notifyListeners();
  }

  deleteInvoiceDocument() {
    _firebaseAPI.deleteDocument(
      collection: "Invoice",
      documentID: invoiceIDController,
    );
    // reset editMode
    invoiceEditMode = false;
    disableEditModeAssetsQuantity = true;
    clearInvoiceDocument();
  }

  streamInvoiceCollection() {
    return _firebaseAPI.streamCollection(collection: "Invoice");
  }
}
