import 'package:assets_control_app/app/controllers/invoice_controller.dart';
import 'package:assets_control_app/app/models/invoice_model.dart';
import 'package:assets_control_app/app/widgets/custom_design.dart';
import 'package:assets_control_app/app/widgets/custom_textlist.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class InvoiceList extends StatelessWidget {
  const InvoiceList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final invoiceController = context.watch<InvoiceController>();

    return Flexible(
      child: Column(
        children: [
          // title list
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              CustomTextList(
                text: "Invoice",
                title: true,
              ),
              CustomTextList(
                text: "Vendor",
                title: true,
              ),
              CustomTextList(
                text: "Category",
                title: true,
              ),
              CustomTextList(
                text: "Model",
                title: true,
              ),
              CustomTextList(
                text: "Quantity",
                title: true,
              ),
              CustomTextList(
                text: "Cost",
                title: true,
              ),
              CustomTextList(
                text: "Cost Center",
                title: true,
              ),
              CustomTextList(
                text: "GL Account",
                title: true,
              ),
              CustomTextList(
                text: "PO Number",
                title: true,
              ),
            ],
          ),
          // stream list
          Flexible(
            child: StreamBuilder<List<InvoiceModel>>(
              stream: invoiceController.streamInvoiceCollection(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return const Center(child: Text("Error by loading data."));
                }
                if (snapshot.hasData == false) {
                  return const Center(
                      child: Text(
                          "No data was found. Please, update the page or check your database."));
                }
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          // select invoice document
                          invoiceController.selectInvoiceDocument(
                            InvoiceModel(
                              snapshot.data![index].invoiceID,
                              snapshot.data![index].invoice_number,
                              snapshot.data![index].vendor,
                              snapshot.data![index].model_category,
                              snapshot.data![index].model,
                              snapshot.data![index].assets_quantity,
                              snapshot.data![index].cost,
                              snapshot.data![index].cost_center,
                              snapshot.data![index].gl_account,
                              snapshot.data![index].po_number,
                            ),
                          );
                        },
                        child: Container(
                          height: 50,
                          margin: const EdgeInsets.only(bottom: 2),
                          color: snapshot.data![index].invoiceID ==
                                  invoiceController.invoiceIDController
                              ? CustomDesign.secondaryColor3
                              : CustomDesign.secondaryColor2,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              CustomTextList(
                                text: snapshot.data![index].invoice_number,
                              ),
                              CustomTextList(
                                  text: snapshot.data![index].vendor),
                              CustomTextList(
                                  text: snapshot.data![index].model_category),
                              CustomTextList(
                                text: snapshot.data![index].model,
                              ),
                              CustomTextList(
                                text: snapshot.data![index].assets_quantity,
                              ),
                              CustomTextList(
                                text: snapshot.data![index].cost,
                              ),
                              CustomTextList(
                                text: snapshot.data![index].cost_center,
                              ),
                              CustomTextList(
                                text: snapshot.data![index].gl_account,
                              ),
                              CustomTextList(
                                text: snapshot.data![index].po_number,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
