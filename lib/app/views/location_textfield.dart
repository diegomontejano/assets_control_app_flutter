import 'package:assets_control_app/app/controllers/location_controller.dart';
import 'package:assets_control_app/app/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LocationTextField extends StatefulWidget {
  const LocationTextField({Key? key}) : super(key: key);
  @override
  State<LocationTextField> createState() => _LocationTextFieldState();
}

class _LocationTextFieldState extends State<LocationTextField> {
  @override
  Widget build(BuildContext context) {
    final locationController = context.watch<LocationController>();

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
              title: "Company",
              controller: locationController.companyController,
              onChanged: (value) => setState(() {}),
              editMode: locationController.locationEditMode,
              minLengthValidator: 3,
              autofocus: true,
            ),
            CustomTextField(
              title: "Segment",
              controller: locationController.segmentController,
              onChanged: (value) => setState(() {}),
              editMode: locationController.locationEditMode,
              minLengthValidator: 3,
            ),
            CustomTextField(
              title: "Segment Purchase",
              controller: locationController.segmentPurchaseController,
              onChanged: (value) => setState(() {}),
              editMode: locationController.locationEditMode,
              minLengthValidator: 3,
            ),
            CustomTextField(
              title: "Region",
              controller: locationController.regionController,
              onChanged: (value) => setState(() {}),
              editMode: locationController.locationEditMode,
              minLengthValidator: 3,
            ),
            CustomTextField(
              title: "Site Purchase",
              controller: locationController.sitePurchaseController,
              onChanged: (value) => setState(() {}),
              editMode: locationController.locationEditMode,
              minLengthValidator: 3,
            ),
            CustomTextField(
              title: "Location",
              controller: locationController.locationController,
              onChanged: (value) => setState(() {}),
              editMode: locationController.locationEditMode,
              minLengthValidator: 3,
            ),
            CustomTextField(
              title: "Stockroom",
              controller: locationController.stockroomController,
              onChanged: (value) => setState(() {}),
              editMode: locationController.locationEditMode,
              minLengthValidator: 3,
            ),
            CustomTextField(
              title: "Managed by",
              controller: locationController.managedByController,
              onChanged: (value) => setState(() {}),
              editMode: locationController.locationEditMode,
              minLengthValidator: 3,
            ),
          ],
        ),
      ),
    );
  }
}
