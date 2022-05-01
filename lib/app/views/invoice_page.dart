import 'package:assets_control_app/app/controllers/invoice_controller.dart';
import 'package:assets_control_app/app/views/invoice_list.dart';
import 'package:assets_control_app/app/views/invoice_textfield.dart';
import 'package:assets_control_app/app/widgets/custom_appbar.dart';
import 'package:assets_control_app/app/widgets/custom_design.dart';
import 'package:assets_control_app/app/widgets/edit_button.dart';
import 'package:assets_control_app/app/widgets/layout_message.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class InvoicePage extends StatelessWidget {
  const InvoicePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double widthScreen = MediaQuery.of(context).size.width;
    final invoiceController = context.watch<InvoiceController>();

    return widthScreen < 1350
        ? const LayoutMessage()
        : Scaffold(
            // appbar
            appBar: PreferredSize(
              preferredSize: Size(widthScreen, 60),
              child: CustomAppBar(
                pageIndex: 2,
                editButtons: invoiceController.invoiceEditMode == false
                    ? Row(
                        children: [
                          EditButton(
                            icons: Icons.edit_rounded,
                            iconColor: CustomDesign.primaryColor1,
                            backgroundColor: CustomDesign.secondaryColor2,
                            onTap: () =>
                                invoiceController.editInvoiceDocument(),
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
                                invoiceController.restoreInvoiceDocument(),
                          ),
                          const SizedBox(width: 12),
                          EditButton(
                            icons: Icons.done_rounded,
                            iconColor: CustomDesign.secondaryColor2,
                            backgroundColor: CustomDesign.primaryColor1,
                            onTap: () {
                              if (invoiceController.invoiceNumberController.text.length > 2 &&
                                  invoiceController.vendorController.text.length >
                                      2 &&
                                  invoiceController
                                          .modelCategoryController.text.length >
                                      2 &&
                                  invoiceController.modelController.text.length >
                                      2 &&
                                  invoiceController.assetsQuantityController
                                          .text.length >
                                      1 &&
                                  invoiceController.costController.text.length >
                                      2 &&
                                  invoiceController
                                          .costCenterController.text.length >
                                      2 &&
                                  invoiceController
                                          .glAccountController.text.length >
                                      2 &&
                                  invoiceController
                                          .poNumberController.text.length >
                                      2) {
                                invoiceController
                                    .createOrUpdateInvoiceDocument();
                              }
                            },
                          ),
                          const Spacer(),
                          EditButton(
                            icons: Icons.note_add_rounded,
                            iconColor: CustomDesign.secondaryColor2,
                            backgroundColor: CustomDesign.primaryColor1,
                            onTap: () => invoiceController.editInvoiceDocument(
                                newDocument: true),
                          ),
                          const SizedBox(width: 12),
                          EditButton(
                            icons: Icons.delete,
                            iconColor: CustomDesign.secondaryColor2,
                            backgroundColor: CustomDesign.primaryColor1,
                            onTap: () =>
                                invoiceController.deleteInvoiceDocument(),
                          ),
                        ],
                      ),
              ),
            ),
            // body
            body: Row(
              children: const [
                InvoiceTextField(),
                InvoiceList(),
              ],
            ),
          );
  }
}
