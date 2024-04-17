import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants/refactoring.dart';
import '../provider/main_provider.dart';

class AdminAddJury extends StatelessWidget {
  const AdminAddJury({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Shader linearGradient = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: <Color>[Color(0xff0C8290), Color(0xffBFAB78)],
    ).createShader(Rect.fromLTWH(10, 40, 100.0, 30.0));
    MainProvider mainprovider =Provider.of<MainProvider>(context,listen:false);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(
          color: Color(0xff0C8290),
          size: 25,
        ),
        centerTitle: true,
        title: Text("Add Jury",
            style: TextStyle(
                fontFamily: "amikosemi",
                fontSize: 25,
                fontWeight: FontWeight.bold,
                foreground: Paint()..shader = linearGradient)),
        toolbarHeight: 70,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(4.0), // Adjust the height of the divider
          child: Divider(color: Color(0xff86B9B4), height: 4.0,thickness: 2), // Add Divider with desired color and height
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              SizedBox(height: 20,),
              Consumer<MainProvider>(
                  builder: (context,value,child) {
                    return InkWell(
                      onTap: () {
                        showBottomSheet(context);
                      },
                      child:
                      value.addAdminImg!=null?Container(
                        height: 100,width: 100,
                        child: ClipRRect( borderRadius: BorderRadius.circular(10),
                          child: Image.file(value.addAdminImg!,fit: BoxFit.cover,
                            scale: 4,
                          ),
                        ),
                      ):
                      value.UsersImg!=""&&value.addAdminImg!=null?CircleAvatar(
                          backgroundColor:Color(0xff249C99),
                          radius: 40,
                          child: Image.network(
                              value.UsersImg.toString()
                          )): CircleAvatar(
                          backgroundColor:Color(0xff249C99),
                          radius: 40,
                          child: Icon(
                            Icons.add_photo_alternate_outlined,
                            size: 35,
                            color: Colors.white,
                          )
                        // Icon(
                        //   Icons.add_photo_alternate_outlined,
                        //   size: 35,
                        //   color: Colors.white,)
                      ),
                    );
                  }
              ),
              SizedBox(height: 15,),
              Consumer<MainProvider>(
                  builder: (context,value,child) {
                      return RegisterField(height / 18, width / 1.15, "  Name",value.NameController);
                  }
              ),
              SizedBox(
                height: height / 80,
              ),
              Consumer<MainProvider>(
                  builder: (context,value,child) {
                    return RegisterField1(height / 18, width / 1.15, "  Phone Number",10,value.PhoneNumberController);
                  }
              ),
              SizedBox(height: 20,),
              Consumer<MainProvider>(
                builder: (context,value,child) {
                  return InkWell(onTap: (){
                    if(value.NameController.text.isNotEmpty&&value.PhoneNumberController.text.isNotEmpty&&value.addAdminImg!=null){
                      mainprovider.addJoury(context);
                    }else{
                      ScaffoldMessenger.of(context)
                          .showSnackBar( SnackBar(
                        backgroundColor: Colors.red,
                        content: Text(
                            "Please enter All Details",style: TextStyle(color: Colors.white,fontSize: 14,fontWeight: FontWeight.w800,)),
                        duration:
                        Duration(milliseconds: 3000),
                      ));
                    }
                  },
                    child: Container(
                      height: 40,width: width*0.6,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color:  Color(0xff1A8894),
                      ),
                      child: Center(child: Text('Save',style: TextStyle(color: Colors.white),)),
                    ),
                  );
                }
              )

            ],
          ),
        ),
      ),
    );
  }
}
void showBottomSheet(BuildContext context) {
  MainProvider mainprovider =Provider.of<MainProvider>(context,listen:false);
  showModalBottomSheet(
      elevation: 10,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10.0),
            topRight: Radius.circular(10.0),
          )),
      context: context,
      builder: (BuildContext bc) {
        return Wrap(
          children: <Widget>[
            ListTile(
                leading:  Icon(
                  Icons.camera_enhance_sharp,
                  color: Colors.green,
                ),
                title: const Text('Camera',),
                onTap: () => {
                  mainprovider.AdmingetImagecamera(), Navigator.pop(context)
                }),
            ListTile(
                leading:  Icon(Icons.photo, color: Colors.green),
                title: const Text('Gallery',),
                onTap: () => {
                  mainprovider.AdmingetImagegallery(),Navigator.pop(context)
                }),
          ],
        );
      });
  // ImageSource
}
