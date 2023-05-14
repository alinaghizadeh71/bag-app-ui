import 'package:animate_do/animate_do.dart';
import 'package:bag_app_ui/constant.dart';
import 'package:bag_app_ui/pages/product_page.dart';
import 'package:flutter/material.dart';
import 'package:bag_app_ui/MediaQueryValues.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import '../colors.dart';
import '../widgets/button_wiget.dart';
import '../widgets/textField_wiget.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kSecondary2Color,
        body: Container(
          width: double.infinity,
          child: Column(
            
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    top: 50.0, right: 20.0, left: 20.0, bottom: 30.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //appbar
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        IconButton(
                          alignment: Alignment.centerLeft,
                          icon: Icon(Icons.arrow_back_ios),
                          color: Colors.black54,
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        Text(
                          "Your Profile",
                          style: TextStyle(
                              color: Colors.black45,
                              fontSize: 20,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                   Column(
                        children: [
                           SizedBox(height: 10.0),
                          TextFieldWidget(
                            hinttext: 'your Name',
                            controller: TextEditingController(),
                            errortext: 'error',
                            type: TextInputType.name,
                          ),
                          SizedBox(height: 30.0),
                          TextFieldWidget(
                            hinttext: 'your Family',
                            controller: TextEditingController(),
                            errortext: 'error',
                            type: TextInputType.text,
                          ),
                          SizedBox(height: 30.0),
                          TextFieldWidget(
                            hinttext: 'your Phone',
                            controller: TextEditingController(),
                            errortext: 'error',
                            type: TextInputType.phone,
                          ),
                          SizedBox(height: 30.0),
                          TextFieldWidget(
                            hinttext: 'your Address',                            
                            controller: TextEditingController(),
                            errortext: 'error',
                            type: TextInputType.multiline,
                            
                          )
                        ],
                      ),
                   
                  ],
                ),
              ),
              Container(                
                alignment: Alignment.bottomCenter,
                padding: const EdgeInsets.only(
                    right: 20.0, left: 20.0, bottom: 20.0),
                child: ButtonWidget(title: 'Update',toast: 'Succces'),
              )
            ],
          ),
        ));
  }
}
