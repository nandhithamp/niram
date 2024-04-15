class ParticipatesModel{
  String id;
  String customer;
  String category;
  String customerPhone;
  String categoryID;
  List<dynamic> list;
  bool selectionBool;
  ParticipatesModel(this.id,this.customer,this.category,
      this.customerPhone,this.categoryID,this.list,this.selectionBool);
}

class CategorySelectionModel{
  String catID;
  String catName;
  bool selectionBool;
  CategorySelectionModel(this.catID,this.catName,this.selectionBool);
}