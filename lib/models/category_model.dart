class CategoryModel{
  String id;
  String categoryname;
  CategoryModel(this.id,this.categoryname);
}
class ContestModel{
  String id;
  String photo;
  String category;
  String categoryid;
  String contest_theme;
  String age;
  String registation_fee;
  String status;
  String winning_price;
  String from_date;
  String to_date;
  String termsand_condition;
  ContestModel(this.id,
      this.photo,this.category,this.categoryid,this.contest_theme,this.age,this.registation_fee,
      this.status,this.winning_price,this.from_date,this.to_date,this.termsand_condition);
}
class AdminsModel{
  String id;
  String admin_photo;
  String admin_name;
  String admin_designation;
  AdminsModel(this.id,this.admin_photo,this.admin_name,this.admin_designation);
}

class JuryModel{
  String id;
  String jury_photo;
  String jury_name;
  String jury_type;
  String jury_phone;
  JuryModel(this.id,this.jury_photo,this.jury_name,this.jury_type,this.jury_phone);
}

class UsersModel{
  String id;
  String users_photo;
  String users_name;
  String users_age;
  String users_phone;
  String users_place;
  UsersModel(this.id,this.users_photo,this.users_name,this.users_age,this.users_phone,this.users_place);
}

class CarouselModel{
  String id;
  String carousel_photo;
  String category_name;
  String contest_theme;
  CarouselModel(this.id,this.carousel_photo,this.category_name,this.contest_theme);
}