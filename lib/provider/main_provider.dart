import 'dart:collection';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:niram/constants/call_functions.dart';

import '../admin/admin_home.dart';
import '../models/ParticipatesModel.dart';
import '../models/category_model.dart';
import '../user/upload_screen.dart';


class MainProvider extends ChangeNotifier {


  final FirebaseFirestore db = FirebaseFirestore.instance;
  Reference ref = FirebaseStorage.instance.ref("IMAGEURL");

  TextEditingController CategorynameController = TextEditingController();

  int selectedIndex = 0;

  void setIndex(int index) {
    selectedIndex = index;
    notifyListeners();
  }

  void addCategory() {
    String id = DateTime
        .now()
        .microsecondsSinceEpoch
        .toString();
    HashMap<String, Object> category = HashMap();

    category["Name"] = CategorynameController.text;

    category["Id"] = id;

    db.collection("CATEGORY").doc(id).set(category);
    getCategory();
    notifyListeners();
  }

  List<CategoryModel> categoryList = [];

  void getCategory() {
    db.collection("CATEGORY").get().then((value) {
      if (value.docs.isNotEmpty) {
        categoryList.clear();
        for (var e in value.docs) {
          Map<dynamic, dynamic> map = e.data();

          categoryList.add(
              CategoryModel(e.id, map["Name"].toString())
          );
          notifyListeners();
        }
      }
    });
    notifyListeners();
  }

  File? addContestFileImg = null;
  String ContestImg = '';

  TextEditingController categorynamect = TextEditingController();
  TextEditingController contestthemect = TextEditingController();
  TextEditingController registrationfeect = TextEditingController();
  TextEditingController winningpricect = TextEditingController();
  TextEditingController termsandconditionct = TextEditingController();
  TextEditingController fromdateController = TextEditingController();
  TextEditingController todateController = TextEditingController();


  String productSelectedcategoryid = "";


  Future<void> addContest(String from,String oldid) async {
    String id = DateTime.now().microsecondsSinceEpoch.toString();
    HashMap<String, Object> contest = HashMap();

    contest["Category_Name"] = categorynamect.text;
    contest["Category_Id"] = productSelectedcategoryid;
    contest["ContestTheme"] = contestthemect.text;
    contest["Age"] = dropdownval;
    contest["RegistrationFee"] = registrationfeect.text;
    contest["WinningPrice"] = winningpricect.text;
    contest["Status"] = dropdownval1;
    contest["From_Date"] = fromdateController.text;
    contest["To_Date"] = todateController.text;
    contest["Terms&Conditions"] = termsandconditionct.text;


    if (addContestFileImg != null) {
      String photoId = DateTime.now().millisecondsSinceEpoch.toString();
      ref = FirebaseStorage.instance.ref().child(photoId);
      await ref.putFile(addContestFileImg!).whenComplete(() async {
        await ref.getDownloadURL().then((value) {
          contest["PHOTO"] = value;

          notifyListeners();
        });
        notifyListeners();
      });
    } else {
      contest['PHOTO'] = Image;
    }
  if(from=="NEW"){
    contest["Id"] = id;
  }
  if(from=="EDIT"){
    print("gnbgmb");
      db.collection("CONTESTS").doc(oldid).set(contest,SetOptions(merge: true));
      notifyListeners();

    }else{
      db.collection("CONTESTS").doc(id).set(contest);
      notifyListeners();
  }
  getContest();
  notifyListeners();


  }


  Future getImggallery() async {
    final imagePicker = ImagePicker();
    final pickedImage =
    await imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      cropImage(pickedImage.path, "");
    } else {
      print('No image selected.');
    }
  }

  Future getImgcamera() async {
    final imgPicker = ImagePicker();
    final pickedImage = await imgPicker.pickImage(source: ImageSource.camera);

    if (pickedImage != null) {
      cropImage(pickedImage.path, "");
    } else {
      print('No image selected.');
    }
  }

  Future<void> cropImage(String path, String from) async {
    final croppedFile = await ImageCropper().cropImage(
      sourcePath: path,
      aspectRatioPresets: Platform.isAndroid
          ? [
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio16x9,
      ]
          : [
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio5x3,
        CropAspectRatioPreset.ratio5x4,
        CropAspectRatioPreset.ratio7x5,
        CropAspectRatioPreset.ratio16x9,
        CropAspectRatioPreset.ratio16x9
      ],
      uiSettings: [
        AndroidUiSettings(
            toolbarTitle: 'Cropper',
            toolbarColor: Colors.white,
            toolbarWidgetColor: Colors.black,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
        IOSUiSettings(
          title: 'Cropper',
        )
      ],
    );
    if (croppedFile != null) {
      addContestFileImg = File(croppedFile.path);
      // print(Registerfileimg.toString() + "fofiifi");
      notifyListeners();
    }
  }

  String dropdownval = "Select";
  var Age = [
    'Select',
    'Below 10',
    'Below 15',
  ];

  void dropdown(String? newVal) {
    dropdownval = newVal!;
    notifyListeners();
  }


  String dropdownval1 = "Select";
  var Status = [
    'Select',
    'Ongoing',
    'Closed',
    'Upcoming'
  ];

  void dropdown1(String? newVal1) {
    dropdownval1 = newVal1!;
    notifyListeners();
  }


  DateTime _date = DateTime.now();
  DateTime to_date = DateTime.now();
  DateTime scheduledfromdate = DateTime.now();
  DateTime scheduledtodate = DateTime.now();
  String scheduledDayNode = "";
  var outputDateFormat = DateFormat('dd/MM/yyyy');
  var outputDateFormatto = DateFormat('dd/MM/yyyy');



  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _date,
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );

    if (picked != null) {
      _date = picked;
      scheduledfromdate = DateTime(_date.year, _date.month, _date.day);
      fromdateController.text = outputDateFormat.format(scheduledfromdate);
    }
    notifyListeners();
  }

  Future<void> selecttoDate(BuildContext context1) async {
    final DateTime? picked1 = await showDatePicker(
      context: context1,
      initialDate: to_date,
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );

    if (picked1 != null) {
      to_date = picked1;
      scheduledtodate = DateTime(_date.year, _date.month, _date.day);
      todateController.text = outputDateFormatto.format(scheduledtodate);
    }
    notifyListeners();
  }
  void contestclear(){
    categorynamect.clear();
    contestthemect.clear();
    dropdownval="Select";
    registrationfeect.clear();
    fromdateController.clear();
    todateController.clear();
    winningpricect.clear();
    termsandconditionct.clear();
    dropdownval1="Select";
    addContestFileImg=null;
    ContestImg="";
    notifyListeners();
  }

  List<ContestModel> contestList = [];

  void getContest() {
    db.collection("CONTESTS").get().then((value) {
      if (value.docs.isNotEmpty) {
        contestList.clear();
        for (var e in value.docs) {
          Map<dynamic, dynamic> map = e.data();
          contestList.add(ContestModel(e.id,
                  map["PHOTO"].toString(),
                  map["Category_Name"].toString(),
                  map["Category_Id"].toString(),
                  map["ContestTheme"].toString(),
                  map["Age"].toString(),
                  map["RegistrationFee"].toString(),
                  map["Status"].toString(),
                  map["WinningPrice"].toString(),
                  map["From_Date"].toString(),
                  map["To_Date"].toString(),
                  map["Terms&Conditions"].toString()
              )
          );
          notifyListeners();
        }
      }
    });
    notifyListeners();
  }
  void editcontest(String id){
    db.collection("CONTESTS").doc(id).get().then((value){
      Map<dynamic, dynamic> map = value.data()as Map;
      if(value.exists){
        categorynamect.text=map["Category_Name"].toString();
        contestthemect.text=map["ContestTheme"].toString();
        dropdownval=map["Age"].toString();
        registrationfeect.text=map["RegistrationFee"].toString();
        dropdownval1=map["Status"].toString();
        winningpricect.text=map["WinningPrice"].toString();
        fromdateController.text=map["From_Date"].toString();
        todateController.text=map["To_Date"].toString();
        termsandconditionct.text=map["Terms&Conditions"].toString();
        ContestImg=map["PHOTO"];
        notifyListeners();
      }
    });
    notifyListeners();
  }




  TextEditingController AdminnameController = TextEditingController();
  TextEditingController DesignationController=TextEditingController();

  File? addAdminImg = null;
  String AdminImg = '';

  Future<void> addAdmins() async {
    String id = DateTime.now().microsecondsSinceEpoch.toString();
    HashMap<String, Object> admins = HashMap();

    admins["Name"] = AdminnameController.text;
    admins["Designation"]=DesignationController.text;
    admins["Id"] = id;
    admins["TYPE"]="ADMIN";

    if (addAdminImg != null) {
      String photoId = DateTime.now().millisecondsSinceEpoch.toString();
      ref = FirebaseStorage.instance.ref().child(photoId);
      await ref.putFile(addAdminImg!).whenComplete(() async {
        await ref.getDownloadURL().then((value) {
          admins["PHOTO"] = value;

          notifyListeners();
        });
        notifyListeners();
      });
    } else {
      admins['PHOTO'] = Image;
    }
    // if(from=="NEW"){
    //   admins["Id"] = id;
    // }
    // if(from=="EDIT"){
    //
    //   db.collection("USERS").doc(oldid).set(admins,SetOptions(merge: true));
    //   notifyListeners();
    //
    // }else{
      db.collection("USERS").doc(id).set(admins);
    //   notifyListeners();
    // }
    getAdmins();
    notifyListeners();


    // db.collection("ADMINS").doc(id).set(admins);
    //
    // notifyListeners();
  }
  Future AdmingetImagegallery() async {
    final imagePicker = ImagePicker();
    final pickedImage =
    await imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      cropImg(pickedImage.path, "");
    } else {
      print('No image selected.');
    }
  }
  Future AdmingetImagecamera() async {
    final imgPicker = ImagePicker();
    final pickedImage = await imgPicker.pickImage(source: ImageSource.camera);

    if (pickedImage != null) {
      cropImg(pickedImage.path, "");
    } else {
      print('No image selected.');
    }
  }

  Future<void> cropImg(String path, String from) async {
    final croppedFile = await ImageCropper().cropImage(
      sourcePath: path,
      aspectRatioPresets: Platform.isAndroid
          ? [
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio16x9,
      ]
          : [
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio5x3,
        CropAspectRatioPreset.ratio5x4,
        CropAspectRatioPreset.ratio7x5,
        CropAspectRatioPreset.ratio16x9,
        CropAspectRatioPreset.ratio16x9
      ],
      uiSettings: [
        AndroidUiSettings(
            toolbarTitle: 'Cropper',
            toolbarColor: Colors.white,
            toolbarWidgetColor: Colors.black,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
        IOSUiSettings(
          title: 'Cropper',
        )
      ],
    );
    if (croppedFile != null) {
      addAdminImg = File(croppedFile.path);
      // print(Registerfileimg.toString() + "fofiifi");
      notifyListeners();
    }
  }
  List<AdminsModel> adminsList = [];
 void getAdmins(){
   db.collection("USERS").where("TYPE",isEqualTo: "ADMIN").get().then((value) {
     if (value.docs.isNotEmpty) {
       adminsList.clear();
       for (var e in value.docs) {
         Map<dynamic, dynamic> map = e.data();

         adminsList.add(
             AdminsModel(e.id,map["PHOTO"].toString(), map["Name"].toString(),map["Designation"].toString())
         );
         notifyListeners();
       }
     }
   });
   notifyListeners();
 }
 void editAdmins(String id){
   db.collection("ADMINS").doc(id).get().then((value){
     Map<dynamic, dynamic> map = value.data()as Map;
     if(value.exists){
       AdminnameController.text=map["Admin_Name"].toString();
       DesignationController.text=map["Designation"].toString();
       AdminImg=map["PHOTO"];
       notifyListeners();
     }
   });
   notifyListeners();
 }
  void adminsclear(){
    AdminnameController.clear();
    DesignationController.clear();
    addContestFileImg=null;
    AdminImg="";
    notifyListeners();
  }
  void deleteAdmin(String id){
    db.collection("ADMINS").doc(id).delete();
    getAdmins();
    notifyListeners();
  }

  TextEditingController NameController = TextEditingController();
  TextEditingController PhoneNumberController=TextEditingController();
  TextEditingController AgeController = TextEditingController();
  TextEditingController PlaceController=TextEditingController();

  File? addUsersImg = null;
  String UsersImg = '';

  Future<void> addCustomers() async {
    String id = DateTime.now().microsecondsSinceEpoch.toString();
    HashMap<String, Object> customap = HashMap();

    customap["Name"] = NameController.text;
    customap["Phone_Number"]=PhoneNumberController.text;
    customap["Age"]=AgeController.text;
    customap["Place"]=PlaceController.text;
    customap["Id"] = id;

    HashMap<String, Object> users = HashMap();
    users["Name"] = NameController.text;
    users["Phone_Number"]='+91'+PhoneNumberController.text;
    users["TYPE"]="USER";
    users["ID"]=id;



    if (addUsersImg != null) {
      String photoId = DateTime.now().millisecondsSinceEpoch.toString();
      ref = FirebaseStorage.instance.ref().child(photoId);
      await ref.putFile(addUsersImg!).whenComplete(() async {
        await ref.getDownloadURL().then((value) {
          customap["PHOTO"] = value;
          users["PHOTO"] = value;

          notifyListeners();
        });
        notifyListeners();
      });
    } else {
      customap['PHOTO'] = Image;
      users['PHOTO'] = Image;
    }

    db.collection("CUSTOMER").doc(id).set(customap);
    db.collection("USERS").doc(id).set(users);
    // getAdmins();
    notifyListeners();

  }
  int? extractNumber(String text) {
    RegExp regExp = RegExp(r'\d+');
    var match = regExp.firstMatch(text);
    if (match != null) {
      return int.parse(match.group(0)!);  // Convert the found digits to an integer
    }
    return null;  // Return null if no numbers are found
  }
  void checkCustomerAge(String id,String age,String category,String customerPhone,String customerID,String customerName,String categoryID,
      BuildContext context){
    print(id+' IIDE iHE');
    db.collection('CUSTOMER').doc(id).get().then((value){
      if(value.exists){
        Map<dynamic,dynamic> map=value.data() as Map;
        print(map['Age'].toString()+' IRUFNRF iRF');
        print(age+' EWEDEW iRF');
        if(int.parse(map['Age'].toString())<=int.parse(extractNumber(age).toString())){
          imagefileList.clear();
          notifyListeners();
          offLoader();
          callNext(context, UploadScreen(Contest_id: id,customerID:customerID ,categoryID: categoryID,
          customerName: customerName,customerPhone: customerPhone,category: category,));
        }else{
          ScaffoldMessenger.of(context)
              .showSnackBar( SnackBar(
            backgroundColor: Colors.red,
            content: Center(
              child: Text(
                  "Your are Not eligible for this contest",style: TextStyle(color: Colors.white,fontSize: 14,fontWeight: FontWeight.w800,)),
            ),
            duration:
            Duration(milliseconds: 3000),
          ));
        }
      }
    });
  }
  Future UsersgetImagegallery() async {
    final imagePicker = ImagePicker();
    final pickedImage =
    await imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      UserscropImage(pickedImage.path, "");
    } else {
      print('No image selected.');
    }
  }
  Future UsersgetImagecamera() async {
    final imgPicker = ImagePicker();
    final pickedImage = await imgPicker.pickImage(source: ImageSource.camera);

    if (pickedImage != null) {
      UserscropImage(pickedImage.path, "");
    } else {
      print('No image selected.');
    }
  }

  Future<void> UserscropImage(String path, String from) async {
    final croppedFile = await ImageCropper().cropImage(
      sourcePath: path,
      aspectRatioPresets: Platform.isAndroid
          ? [
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio16x9,
      ]
          : [
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio5x3,
        CropAspectRatioPreset.ratio5x4,
        CropAspectRatioPreset.ratio7x5,
        CropAspectRatioPreset.ratio16x9,
        CropAspectRatioPreset.ratio16x9
      ],
      uiSettings: [
        AndroidUiSettings(
            toolbarTitle: 'Cropper',
            toolbarColor: Colors.white,
            toolbarWidgetColor: Colors.black,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
        IOSUiSettings(
          title: 'Cropper',
        )
      ],
    );
    if (croppedFile != null) {
      print(' TTTy EYFE '+imagefileList.length.toString());
      addUsersImg = File(croppedFile.path);

      // print(Registerfileimg.toString() + "fofiifi");
      notifyListeners();
    }
  }
  void clearsignup(){
    NameController.clear();
    PhoneNumberController.clear();
    PlaceController.clear();
    AgeController.clear();
    addUsersImg=null;
    UsersImg="";

  }
  List<UsersModel> usersList = [];
  void getUsers(){
    db.collection("CUSTOMER").get().then((value) {
      if (value.docs.isNotEmpty) {
        usersList.clear();
        for (var e in value.docs) {
          Map<dynamic, dynamic> map = e.data();

          usersList.add(
              UsersModel(e.id,map["PHOTO"].toString(), map["Name"].toString(),map["Age"].toString(),
                  map["Phone_Number"].toString(),map["Place"].toString())
          );
          notifyListeners();
        }
      }
    });
    notifyListeners();
  }


  File? addCarouselImg = null;
  String CarouselImg = '';
  String Selectedcategoryid = "";

  TextEditingController categorynamecontroller = TextEditingController();
  TextEditingController contestthemecontroller = TextEditingController();


  Future<void> addCarousel(BuildContext context) async {
    print("hiiiiiiiiiiiiiiiiiiiiiiii");
    String id = DateTime.now().microsecondsSinceEpoch.toString();
    HashMap<String, Object> carousel = HashMap();

    carousel["Category_name"] = categorynamecontroller.text;
    carousel["Category_id"] = Selectedcategoryid;
    carousel["Contest_theme"] = contestthemecontroller.text;


    if (addCarouselImg != null) {
      String photoId = DateTime.now().millisecondsSinceEpoch.toString();
      ref = FirebaseStorage.instance.ref().child(photoId);
      await ref.putFile(addCarouselImg!).whenComplete(() async {
        await ref.getDownloadURL().then((value) {
          carousel["Carousel_Photo"] = value;

          notifyListeners();
        });
        notifyListeners();
      });
    } else {
      carousel['Carousel_Photo'] = Image;
    }
    print("${carousel.length}.........................");
      db.collection("CAROUSEL").doc(id).set(carousel);

      clearCarousel();
      notifyListeners();
      finish(context);
      // callNext(context, AdminHome(userName: '',phoneNumber: '',));
    }



  Future getCarouselImggallery() async {
    final imagePicker = ImagePicker();
    final pickedImage =
    await imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      CarouselcropImage(pickedImage.path, "");
    } else {
      print('No image selected.');
    }
  }

  Future getCarouselImgcamera() async {
    final imgPicker = ImagePicker();
    final pickedImage = await imgPicker.pickImage(source: ImageSource.camera);

    if (pickedImage != null) {
      CarouselcropImage(pickedImage.path, "");
    } else {
      print('No image selected.');
    }
  }

  Future<void> CarouselcropImage(String path, String from) async {
    final croppedFile = await ImageCropper().cropImage(
      sourcePath: path,
      aspectRatioPresets: Platform.isAndroid
          ? [
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio16x9,
      ]
          : [
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio5x3,
        CropAspectRatioPreset.ratio5x4,
        CropAspectRatioPreset.ratio7x5,
        CropAspectRatioPreset.ratio16x9,
        CropAspectRatioPreset.ratio16x9
      ],
      uiSettings: [
        AndroidUiSettings(
            toolbarTitle: 'Cropper',
            toolbarColor: Colors.white,
            toolbarWidgetColor: Colors.black,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
        IOSUiSettings(
          title: 'Cropper',
        )
      ],
    );
    if (croppedFile != null) {
      addCarouselImg = File(croppedFile.path);
      // print(Registerfileimg.toString() + "fofiifi");
      notifyListeners();
    }
  }
  void clearCarousel(){
    categorynamecontroller.clear();
    contestthemecontroller.clear();
    addCarouselImg=null;
    CarouselImg="";
    notifyListeners();
  }


  List<CarouselModel> carouselList = [];
  void getCarousel(){
    db.collection("CAROUSEL").get().then((value) {
      if (value.docs.isNotEmpty) {
        carouselList.clear();
        for (var e in value.docs) {
          Map<dynamic, dynamic> map = e.data();

          carouselList.add(
              CarouselModel(e.id,map["Carousel_Photo"].toString(), map["Category_name"].toString(),map["Contest_theme"].toString())
          );
          notifyListeners();
        }
      }
    });
    notifyListeners();

  }

  // void uploadWork1(){
  //
  // }
  List<File> imagefileList = [];
  File? addPwork1FileImg = null;
  String Pwork1Img = '';
  File? addPwork2FileImg=null;
  String Pwork2Img='';
  File? addPwork3FileImg=null;
  String Pwork3Img='';
  List<File> participant_workList=[];
  bool loader=false;
  void onLoader(){
    loader=true;
    notifyListeners();
  }
  void offLoader(){
    loader=false;
    notifyListeners();
  }
  Future<void> UploadWork(BuildContext context, String contest_id,
      String category,String customerPhone,String customerID,String customerName,String categoryID) async {
    if(imagefileList.length>0) {
      String id = DateTime
          .now()
          .microsecondsSinceEpoch
          .toString();
      HashMap<String, Object> participant_map = HashMap();
      HashMap<String, Object> work_map = HashMap();
      int i = 1;

      List<String> list = [];
      if (imagefileList.length > 0) {
        for (int i = 0; i < imagefileList.length; i++) {
          String time = DateTime
              .now()
              .millisecondsSinceEpoch
              .toString();
          ref = FirebaseStorage.instance.ref().child('Images').child(
              time); // Specify the full path including the filename
          await ref.putFile(imagefileList[i]).whenComplete(() async {
            await ref.getDownloadURL().then((value1) {
              list.add(value1);
              print(list.toString() + ' KMVKNVKFNV');
              participant_map["IMAGELIST"] = list;
              notifyListeners();
            });
          });
        }
      }
      participant_map["CUSTOMER_ID"] = customerID;
      participant_map["CUSTOMER_NAME"] = customerName;
      participant_map["CUSTOMER_PHONE"] = customerPhone;
      participant_map["CATEGORY"] = category;
      participant_map["CATEGORY_ID"] = categoryID;


      print(participant_map.toString() + ' IFRJF iFRRF');
      db.collection("PARTICIPANT").doc(id).set(participant_map);

      clearUploadWork();
      notifyListeners();
      offLoader();
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(
        backgroundColor: Colors.green,
        content: Center(
          child: Text(
              "Uploaded Successfully", style: TextStyle(
            color: Colors.white, fontSize: 12, fontWeight: FontWeight.w800,)),
        ),
        duration:
        Duration(milliseconds: 3000),
      ));
      finish(context);
    }else{
      offLoader();
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(
        backgroundColor: Colors.red,
        content: Center(
          child: Text(
              "Please Upload at least one photo", style: TextStyle(
            color: Colors.white, fontSize: 12, fontWeight: FontWeight.w800,)),
        ),
        duration:
        Duration(milliseconds: 3000),
      ));
    }
    // callNext(context, AdminHome());
  }

  List<ParticipatesModel> ParticipatesList=[];
  List<ParticipatesModel> filterParticipatesList=[];
  List<CategorySelectionModel> categoriesSelectionList=[];
  void fetchAllParticipats(){
    ParticipatesList.clear();
    filterParticipatesList.clear();
    db.collection('PARTICIPANT').get().then((value){
      if(value.docs.isNotEmpty){
        filterParticipatesList.clear();
        for(var elements in value.docs){
          Map<dynamic,dynamic> map=elements.data() as Map;
          List<dynamic> list=[''];
          print((map['IMAGELIST'].toString()+' OFIRNFR'));
          if(map['IMAGELIST']!=null){
            list=map['IMAGELIST'];
            print(' JFNDIRF FRI FR');
          }
          categoriesSelectionList.add(CategorySelectionModel(map['CATEGORY_ID'].toString(),
              map['CATEGORY'].toString(), false));
          ParticipatesList.add(ParticipatesModel(elements.id,
              map['CUSTOMER_NAME'].toString(), map['CATEGORY'].toString(),
              map['CUSTOMER_PHONE'].toString(), map['CATEGORY_ID'].toString(), list,false));
        }
        filterParticipatesList=ParticipatesList;
        categoriesSelectionList=removeCategorySelectionModel(categoriesSelectionList);
        notifyListeners();
      }
    });

  }

  void filterFun(int index,String name,String catID){
    print(filterParticipatesList.length.toString()+'  '+ParticipatesList.length.toString()+' IFRF IRO FR F'+catID);
    filterParticipatesList=ParticipatesList.where((element) => element.categoryID==catID).toSet().toList();
    notifyListeners();
    if(categoriesSelectionList[index].selectionBool){
      categoriesSelectionList[index].selectionBool=false;
    }else{
      categoriesSelectionList[index].selectionBool=true;
    }
    for(var ee in categoriesSelectionList){
    if(ee.catName!=name){
      ee.selectionBool=false;
    }
    }
    for(var rr in ParticipatesList){
      print(rr.categoryID+' IFRNFR '+catID);
    }

    notifyListeners();
  }

  List<CategorySelectionModel> removeCategorySelectionModel(List<CategorySelectionModel> processModal){

    List<CategorySelectionModel> temp = [];
    List<String> sampleStrings = [];

    for(var sample in processModal) {
      var sampleString =
          sample.catID.toString()+" "
              + sample.catName.toString()+" "
      ;

      if(!sampleStrings.contains(sampleString)){
        sampleStrings.add(sampleString);
        temp.add(sample);
      }
    }

    return temp;
  }

  Future getImgwork1gallery() async {
    final imagePicker = ImagePicker();
    final pickedImage =
    await imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      WorkcropImage1(pickedImage.path, "");
    } else {
      print('No image selected.');
    }
  }

  Future getImgwork1camera() async {
    final imgPicker = ImagePicker();
    final pickedImage = await imgPicker.pickImage(source: ImageSource.camera);

    if (pickedImage != null) {
      WorkcropImage1(pickedImage.path, "");
    } else {
      print('No image selected.');
    }
  }

  Future<void> WorkcropImage1(String path, String from) async {
    final croppedFile = await ImageCropper().cropImage(
      sourcePath: path,
      aspectRatioPresets: Platform.isAndroid
          ? [
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio16x9,
      ]
          : [
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio5x3,
        CropAspectRatioPreset.ratio5x4,
        CropAspectRatioPreset.ratio7x5,
        CropAspectRatioPreset.ratio16x9,
        CropAspectRatioPreset.ratio16x9
      ],
      uiSettings: [
        AndroidUiSettings(
            toolbarTitle: 'Cropper',
            toolbarColor: Colors.white,
            toolbarWidgetColor: Colors.black,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
        IOSUiSettings(
          title: 'Cropper',
        )
      ],
    );
    if (croppedFile != null) {
      addPwork1FileImg = File(croppedFile.path);
      if(imagefileList.length<3){
        imagefileList.add( File(croppedFile.path)!);
      }
      // print(Registerfileimg.toString() + "fofiifi");
      notifyListeners();
    }
  }


  Future getImgwork2gallery() async {
    final imagePicker = ImagePicker();
    final pickedImage =
    await imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      WorkcropImage2(pickedImage.path, "");
    } else {
      print('No image selected.');
    }
  }

  Future getImgwork2camera() async {
    final imgPicker = ImagePicker();
    final pickedImage = await imgPicker.pickImage(source: ImageSource.camera);

    if (pickedImage != null) {
      WorkcropImage2(pickedImage.path, "");
    } else {
      print('No image selected.');
    }
  }

  Future<void> WorkcropImage2(String path, String from) async {
    final croppedFile = await ImageCropper().cropImage(
      sourcePath: path,
      aspectRatioPresets: Platform.isAndroid
          ? [
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio16x9,
      ]
          : [
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio5x3,
        CropAspectRatioPreset.ratio5x4,
        CropAspectRatioPreset.ratio7x5,
        CropAspectRatioPreset.ratio16x9,
        CropAspectRatioPreset.ratio16x9
      ],
      uiSettings: [
        AndroidUiSettings(
            toolbarTitle: 'Cropper',
            toolbarColor: Colors.white,
            toolbarWidgetColor: Colors.black,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
        IOSUiSettings(
          title: 'Cropper',
        )
      ],
    );
    if (croppedFile != null) {
      addPwork2FileImg = File(croppedFile.path);
      // print(Registerfileimg.toString() + "fofiifi");
      notifyListeners();
    }
  }


  Future getImgwork3gallery() async {
    final imagePicker = ImagePicker();
    final pickedImage =
    await imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      WorkcropImage3(pickedImage.path, "");
    } else {
      print('No image selected.');
    }
  }

  Future getImgwork3camera() async {
    final imgPicker = ImagePicker();
    final pickedImage = await imgPicker.pickImage(source: ImageSource.camera);

    if (pickedImage != null) {
      WorkcropImage3(pickedImage.path, "");
    } else {
      print('No image selected.');
    }
  }

  Future<void> WorkcropImage3(String path, String from) async {
    final croppedFile = await ImageCropper().cropImage(
      sourcePath: path,
      aspectRatioPresets: Platform.isAndroid
          ? [
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio16x9,
      ]
          : [
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio5x3,
        CropAspectRatioPreset.ratio5x4,
        CropAspectRatioPreset.ratio7x5,
        CropAspectRatioPreset.ratio16x9,
        CropAspectRatioPreset.ratio16x9
      ],
      uiSettings: [
        AndroidUiSettings(
            toolbarTitle: 'Cropper',
            toolbarColor: Colors.white,
            toolbarWidgetColor: Colors.black,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
        IOSUiSettings(
          title: 'Cropper',
        )
      ],
    );
    if (croppedFile != null) {
      addPwork3FileImg = File(croppedFile.path);
      // print(Registerfileimg.toString() + "fofiifi");
      notifyListeners();
    }
  }
  void clearUploadWork(){
    participant_workList.clear();
  }

}