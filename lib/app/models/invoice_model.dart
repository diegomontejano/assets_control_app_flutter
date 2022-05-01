class InvoiceModel {
  String invoiceID;
  String invoice_number;
  String vendor;
  String model_category;
  String model;
  String assets_quantity;
  String cost;
  String cost_center;
  String gl_account;
  String po_number;

  InvoiceModel(
    this.invoiceID,
    this.invoice_number,
    this.vendor,
    this.model_category,
    this.model,
    this.assets_quantity,
    this.cost,
    this.cost_center,
    this.gl_account,
    this.po_number,
  );
}
