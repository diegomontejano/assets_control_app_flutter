import 'package:assets_control_app/app/controllers/invoice_controller.dart';
import 'package:assets_control_app/app/controllers/location_controller.dart';
import 'package:assets_control_app/app/views/invoice_page.dart';
import 'package:assets_control_app/app/views/location_page.dart';
import 'package:assets_control_app/app/widgets/custom_design.dart';
import 'package:assets_control_app/app/widgets/custom_route.dart';
import 'package:assets_control_app/app/widgets/page_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomAppBar extends StatelessWidget {
  // attributes
  final int pageIndex;
  final Widget editButtons;

  // constructor
  const CustomAppBar({
    required this.pageIndex,
    required this.editButtons,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final locationController = context.watch<LocationController>();
    final invoiceController = context.watch<InvoiceController>();

    return Container(
      height: 60,
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
      decoration: BoxDecoration(
        color: CustomDesign.secondaryColor1,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 4,
          ),
        ],
      ),
      child: Row(
        children: [
          // edit buttons
          SizedBox(
            width: 228,
            child: editButtons, // editButtons attribute
          ),
          // divider line
          const Padding(
            padding: EdgeInsets.only(left: 20),
            child: VerticalDivider(
              width: 3,
              color: CustomDesign.secondaryColor2,
            ),
          ),
          // page buttons
          PageButton(
            title: "Location",
            subtitle: locationController.locationController.text == ""
                ? "-----"
                : locationController.locationController.text,
            color: pageIndex == 1
                ? CustomDesign.primaryColor1
                : CustomDesign.secondaryColor4,
            onTap: () {
              locationController.locationEditMode = false;
              Navigator.push(
                  context, CustomRoute(const LocationPage(), "/location_page"));
            },
          ),
          PageButton(
            title: "Invoice",
            subtitle: invoiceController.invoiceNumberController.text == ""
                ? "-----"
                : invoiceController.invoiceNumberController.text,
            color: pageIndex == 2
                ? CustomDesign.primaryColor1
                : CustomDesign.secondaryColor4,
            onTap: () {
              invoiceController.invoiceEditMode = false;
              Navigator.push(
                  context, CustomRoute(const InvoicePage(), "/invoice_page"));
            },
          ),
          PageButton(
            title: "Assets",
            subtitle: "-----",
            color: pageIndex == 3
                ? CustomDesign.primaryColor1
                : CustomDesign.secondaryColor4,
            onTap: () {
              // assetsController.assetsEditMode = false;
              // Navigator.push(context, CustomRoute(const AssetsPage(), "/assets_page"));
            },
          ),
          PageButton(
            title: "Replacement",
            subtitle: "-----",
            color: pageIndex == 4
                ? CustomDesign.primaryColor1
                : CustomDesign.secondaryColor4,
            onTap: () {
              // replacementController.replacementEditMode = false;
              // Navigator.push(context, CustomRoute(const AssetsPage(), "/assets_page"));
            },
          ),
          const Spacer(),
          // welcome message
          PageButton(
            alignToEnd: true,
            title: "Welcome",
            subtitle: "User Name",
            color: pageIndex == 5
                ? CustomDesign.primaryColor1
                : CustomDesign.secondaryColor4,
            onTap: () {
              // Navigator.push(context, CustomRoute(const AssetsPage(), "/assets_page"));
            },
          ),
          const CircleAvatar(
            backgroundImage: NetworkImage(
                "https://images.pexels.com/photos/1382728/pexels-photo-1382728.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260"),
          ),
        ],
      ),
    );
  }
}
