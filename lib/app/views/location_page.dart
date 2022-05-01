import 'package:assets_control_app/app/controllers/location_controller.dart';
import 'package:assets_control_app/app/views/location_list.dart';
import 'package:assets_control_app/app/views/location_textfield.dart';
import 'package:assets_control_app/app/widgets/custom_appbar.dart';
import 'package:assets_control_app/app/widgets/custom_design.dart';
import 'package:assets_control_app/app/widgets/edit_button.dart';
import 'package:assets_control_app/app/widgets/layout_message.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LocationPage extends StatelessWidget {
  const LocationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double widthScreen = MediaQuery.of(context).size.width;
    final locationController = context.watch<LocationController>();

    return widthScreen < 1350
        ? const LayoutMessage()
        : Scaffold(
            // appbar
            appBar: PreferredSize(
              preferredSize: Size(widthScreen, 60),
              child: CustomAppBar(
                pageIndex: 1,
                editButtons: locationController.locationEditMode == false
                    ? Row(
                        children: [
                          EditButton(
                            icons: Icons.edit_rounded,
                            iconColor: CustomDesign.primaryColor1,
                            backgroundColor: CustomDesign.secondaryColor2,
                            onTap: () =>
                                locationController.editLocationDocument(),
                          ),
                          const Spacer(),
                          EditButton(
                            iconColor: CustomDesign.primaryColor1,
                            backgroundColor: CustomDesign.secondaryColor2,
                            icons: Icons.info_outline,
                            onTap: () {},
                          )
                        ],
                      )
                    : Row(
                        children: [
                          EditButton(
                            icons: Icons.close_rounded,
                            iconColor: CustomDesign.secondaryColor2,
                            backgroundColor: CustomDesign.errorColor,
                            onTap: () =>
                                locationController.restoreLocationDocument(),
                          ),
                          const SizedBox(width: 12),
                          EditButton(
                            icons: Icons.done_rounded,
                            iconColor: CustomDesign.secondaryColor2,
                            backgroundColor: CustomDesign.primaryColor1,
                            onTap: () {
                              if (locationController.companyController.text.length > 2 &&
                                  locationController.segmentController.text.length >
                                      2 &&
                                  locationController.segmentPurchaseController.text
                                          .length >
                                      2 &&
                                  locationController
                                          .regionController.text.length >
                                      2 &&
                                  locationController
                                          .sitePurchaseController.text.length >
                                      2 &&
                                  locationController
                                          .locationController.text.length >
                                      2 &&
                                  locationController
                                          .stockroomController.text.length >
                                      2 &&
                                  locationController
                                          .managedByController.text.length >
                                      2) {
                                locationController
                                    .createOrUpdateLocationDocument();
                              }
                            },
                          ),
                          const Spacer(),
                          EditButton(
                            icons: Icons.note_add_rounded,
                            iconColor: CustomDesign.secondaryColor2,
                            backgroundColor: CustomDesign.primaryColor1,
                            onTap: () => locationController
                                .editLocationDocument(newDocument: true),
                          ),
                          const SizedBox(width: 12),
                          EditButton(
                            icons: Icons.delete,
                            iconColor: CustomDesign.secondaryColor2,
                            backgroundColor: CustomDesign.primaryColor1,
                            onTap: () =>
                                locationController.deleteLocationDocument(),
                          ),
                        ],
                      ),
              ),
            ),
            // body
            body: Row(
              children: const [
                LocationTextField(),
                LocationList(),
              ],
            ),
          );
  }
}
