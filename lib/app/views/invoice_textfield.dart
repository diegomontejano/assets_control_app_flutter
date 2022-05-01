import 'package:assets_control_app/app/controllers/invoice_controller.dart';
import 'package:assets_control_app/app/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class InvoiceTextField extends StatefulWidget {
  const InvoiceTextField({Key? key}) : super(key: key);
  @override
  State<InvoiceTextField> createState() => _InvoiceTextFieldState();
}

class _InvoiceTextFieldState extends State<InvoiceTextField> {
  @override
  Widget build(BuildContext context) {
    final invoiceController = context.watch<InvoiceController>();

    return Container(
      width: 270,
      height: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(
            "assets/images/background.png",
          ),
        ),
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            const SizedBox(height: 30),
            CustomTextField(
              title: "Invoice",
              controller: invoiceController.invoiceNumberController,
              onChanged: (value) => setState(() {}),
              editMode: invoiceController.invoiceEditMode,
              minLengthValidator: 3,
              autofocus: true,
            ),
            CustomTextField(
              title: "Vendor",
              controller: invoiceController.vendorController,
              onChanged: (value) => setState(() {}),
              editMode: invoiceController.invoiceEditMode,
              minLengthValidator: 3,
            ),
            CustomTextField(
              title: "Category",
              controller: invoiceController.modelCategoryController,
              onChanged: (value) => setState(() {}),
              editMode: invoiceController.invoiceEditMode,
              minLengthValidator: 3,
            ),
            CustomTextField(
              title: "Model",
              controller: invoiceController.modelController,
              onChanged: (value) => setState(() {}),
              editMode: invoiceController.invoiceEditMode,
              minLengthValidator: 3,
            ),
            CustomTextField(
              title: "Quantity",
              controller: invoiceController.assetsQuantityController,
              onChanged: (value) => setState(() {}),
              editMode: invoiceController.invoiceEditMode,
              disableEditMode: invoiceController.disableEditModeAssetsQuantity,
              minLengthValidator: 2,
            ),
            CustomTextField(
              title: "Cost",
              controller: invoiceController.costController,
              onChanged: (value) => setState(() {}),
              editMode: invoiceController.invoiceEditMode,
              minLengthValidator: 3,
            ),
            CustomTextField(
              title: "Cost Center",
              controller: invoiceController.costCenterController,
              onChanged: (value) => setState(() {}),
              editMode: invoiceController.invoiceEditMode,
              minLengthValidator: 3,
            ),
            CustomTextField(
              title: "GL Account",
              controller: invoiceController.glAccountController,
              onChanged: (value) => setState(() {}),
              editMode: invoiceController.invoiceEditMode,
              minLengthValidator: 3,
            ),
            CustomTextField(
              title: "PO Number",
              controller: invoiceController.poNumberController,
              onChanged: (value) => setState(() {}),
              editMode: invoiceController.invoiceEditMode,
              minLengthValidator: 3,
            ),
          ],
        ),
      ),
    );
  }
}
